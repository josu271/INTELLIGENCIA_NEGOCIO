from __future__ import annotations

from collections import Counter
from datetime import date

import pandas as pd
from sklearn.cluster import KMeans
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import silhouette_score
from sklearn.preprocessing import StandardScaler
from sklearn.utils import resample
from sqlalchemy.orm import Session, selectinload

from app import models


ACTIVE_CONTRACT_STATUS = "activo"
CLOSED_INCIDENT_STATUSES = {"resuelta", "cerrada"}
PENDING_PAYMENT_STATUSES = {"pendiente", "vencido"}
CHURN_CONTRACT_STATUSES = {"cancelado", "inactivo"}

PLAN_ORDER = {
    "basico": 0,
    "estandar": 1,
    "plus": 2,
    "premium": 3,
    "empresarial": 4,
    "corporativo": 5,
}


def _months_between(start: date, end: date) -> int:
    return max(1, (end.year - start.year) * 12 + end.month - start.month + 1)


def _risk_level(probability: float) -> str:
    if probability >= 70:
        return "alto"
    if probability >= 40:
        return "medio"
    return "bajo"


def _load_clients(db: Session) -> list[models.Client]:
    return (
        db.query(models.Client)
        .options(
            selectinload(models.Client.contracts).selectinload(models.Contract.plan),
            selectinload(models.Client.contracts).selectinload(models.Contract.site),
            selectinload(models.Client.contracts).selectinload(models.Contract.payments),
            selectinload(models.Client.incidents),
        )
        .all()
    )


def build_feature_frame(db: Session) -> pd.DataFrame:
    today = date.today()
    rows = []
    for client in _load_clients(db):
        if not client.contracts:
            continue

        contracts = sorted(client.contracts, key=lambda item: item.start_date)
        latest_contract = max(contracts, key=lambda item: item.start_date)
        payments = [payment for contract in contracts for payment in contract.payments]
        paid_payments = [payment for payment in payments if payment.status == "pagado"]
        pending_payments = [
            payment for payment in payments if payment.status in PENDING_PAYMENT_STATUSES
        ]
        open_incidents = [
            incident
            for incident in client.incidents
            if incident.status not in CLOSED_INCIDENT_STATUSES
        ]

        max_plan = max(contracts, key=lambda item: float(item.plan.monthly_price))
        last_payment_date = None
        if paid_payments:
            last_payment_date = max(
                payment.paid_date or payment.issued_date for payment in paid_payments
            )

        rows.append(
            {
                "client_id": client.id,
                "client_name": f"{client.first_name} {client.last_name}",
                "latest_site": latest_contract.site.name,
                "site_code": latest_contract.site.id,
                "max_price": float(max_plan.plan.monthly_price),
                "max_speed": max_plan.plan.speed_mbps,
                "total_contracts": len(contracts),
                "active_contracts": sum(
                    1 for item in contracts if item.status == ACTIVE_CONTRACT_STATUS
                ),
                "total_paid_amount": sum(float(payment.amount) for payment in paid_payments),
                "total_payments": len(paid_payments),
                "pending_payments": len(pending_payments),
                "days_since_last_payment": (
                    (today - last_payment_date).days if last_payment_date else 180
                ),
                "tenure_months": _months_between(contracts[0].start_date, today),
                "plan_level": PLAN_ORDER.get(latest_contract.plan.category, 0),
                "open_incidents": len(open_incidents),
                "recent_incidents": sum(
                    1
                    for incident in client.incidents
                    if (today - incident.reported_at.date()).days <= 60
                ),
                "churn": 1 if latest_contract.status in CHURN_CONTRACT_STATUSES else 0,
                "client_status": client.status,
                "customer_type": client.customer_type,
            }
        )

    return pd.DataFrame(rows)


def get_segments(db: Session) -> dict:
    frame = build_feature_frame(db)
    if frame.empty:
        return {"silhouette_score": 0, "distribution": [], "clients": []}

    features = frame[
        [
            "max_price",
            "max_speed",
            "total_contracts",
            "total_paid_amount",
            "total_payments",
            "pending_payments",
            "site_code",
        ]
    ]

    scaler = StandardScaler()
    scaled_features = scaler.fit_transform(features)
    cluster_count = min(4, len(frame))
    model = KMeans(n_clusters=cluster_count, n_init=10, random_state=42)
    labels = model.fit_predict(scaled_features)
    frame["cluster"] = labels

    silhouette = 0
    if len(frame) > 4 and len(set(labels)) > 1:
        silhouette = float(silhouette_score(scaled_features, labels))

    cluster_summary = (
        frame.groupby("cluster")
        .agg(
            avg_price=("max_price", "mean"),
            avg_speed=("max_speed", "mean"),
            avg_pending=("pending_payments", "mean"),
            churn_ratio=("churn", "mean"),
            clients=("client_id", "count"),
        )
        .reset_index()
    )

    unique_clusters = list(frame["cluster"].unique())
    cluster_labels = {}
    if len(unique_clusters) == 1:
        cluster_labels[unique_clusters[0]] = "Base General"
    else:
        risk_cluster = (
            cluster_summary.assign(
                score=cluster_summary["avg_pending"] + cluster_summary["churn_ratio"] * 2
            )
            .sort_values("score", ascending=False)
            .iloc[0]["cluster"]
        )
        premium_candidates = cluster_summary[cluster_summary["cluster"] != risk_cluster]
        premium_cluster = (
            premium_candidates.sort_values("avg_price", ascending=False).iloc[0]["cluster"]
            if not premium_candidates.empty
            else risk_cluster
        )
        remaining = cluster_summary[
            ~cluster_summary["cluster"].isin([risk_cluster, premium_cluster])
        ].sort_values("avg_speed", ascending=False)
        high_consumption_cluster = (
            remaining.iloc[0]["cluster"] if not remaining.empty else premium_cluster
        )

        for cluster_id in unique_clusters:
            if cluster_id == risk_cluster:
                cluster_labels[cluster_id] = "En Riesgo"
            elif cluster_id == premium_cluster:
                cluster_labels[cluster_id] = "Empresarial / Corporativo"
            elif cluster_id == high_consumption_cluster:
                cluster_labels[cluster_id] = "Residencial Alto Consumo"
            else:
                cluster_labels[cluster_id] = "Residencial Economico"

    frame["segment"] = frame["cluster"].map(cluster_labels)

    distribution = []
    counts = Counter(frame["segment"])
    for segment_name, count in counts.items():
        distribution.append(
            {
                "segment": segment_name,
                "clients": count,
                "share": round((count / len(frame)) * 100, 2),
            }
        )

    client_segments = []
    for row in frame.sort_values(["segment", "client_name"]).to_dict("records"):
        client_segments.append(
            {
                "client_id": row["client_id"],
                "client_name": row["client_name"],
                "site": row["latest_site"],
                "segment": row["segment"],
                "max_price": round(row["max_price"], 2),
                "max_speed": int(row["max_speed"]),
                "pending_payments": int(row["pending_payments"]),
            }
        )

    return {
        "silhouette_score": round(silhouette, 3),
        "distribution": sorted(distribution, key=lambda item: item["clients"], reverse=True),
        "clients": client_segments,
    }


def get_churn_predictions(db: Session) -> dict:
    frame = build_feature_frame(db)
    if frame.empty:
        return {"metrics": {}, "predictions": []}

    feature_columns = [
        "tenure_months",
        "max_price",
        "max_speed",
        "pending_payments",
        "days_since_last_payment",
        "total_contracts",
        "plan_level",
        "site_code",
        "open_incidents",
        "recent_incidents",
    ]
    training = frame[feature_columns + ["churn"]].copy()

    majority = training[training["churn"] == 0]
    minority = training[training["churn"] == 1]
    if not minority.empty and len(minority) < len(majority):
        minority = resample(
            minority,
            replace=True,
            n_samples=len(majority),
            random_state=42,
        )
        training = pd.concat([majority, minority], ignore_index=True)

    class_values = sorted(training["churn"].unique().tolist())
    feature_importance = []
    model_mode = "random_forest"
    if len(class_values) < 2:
        base_probability = 100.0 if class_values and class_values[0] == 1 else 0.0
        probabilities = pd.Series(base_probability, index=frame.index, dtype="float64")
        feature_importance = [
            {"feature": feature, "importance": 0.0} for feature in feature_columns
        ]
        model_mode = "single_class_fallback"
    else:
        model = RandomForestClassifier(
            n_estimators=200,
            max_depth=10,
            min_samples_split=5,
            min_samples_leaf=2,
            max_features="sqrt",
            class_weight="balanced",
            random_state=42,
        )
        model.fit(training[feature_columns], training["churn"])
        probabilities = model.predict_proba(frame[feature_columns])[:, 1] * 100
        feature_importance = [
            {"feature": feature, "importance": round(float(weight), 4)}
            for feature, weight in sorted(
                zip(feature_columns, model.feature_importances_),
                key=lambda item: item[1],
                reverse=True,
            )
        ]

    frame["probability"] = probabilities
    frame["risk_level"] = frame["probability"].apply(_risk_level)
    eligible_frame = frame[
        (frame["client_status"] == "activo") & (frame["active_contracts"] > 0)
    ].copy()

    predictions = []
    for row in eligible_frame.sort_values("probability", ascending=False).to_dict("records"):
        actions = []
        if row["pending_payments"] > 0:
            actions.append("Contactar a cobranza preventiva")
        if row["open_incidents"] > 0:
            actions.append("Programar revision tecnica")
        if row["probability"] >= 70:
            actions.append("Ofrecer campana de retencion")
        if not actions:
            actions.append("Mantener seguimiento comercial")

        predictions.append(
            {
                "client_id": row["client_id"],
                "client_name": row["client_name"],
                "site": row["latest_site"],
                "probability_churn_percentage": round(row["probability"], 2),
                "risk_level": row["risk_level"],
                "actions_suggested": actions,
            }
        )

    metrics = {
        "records": len(frame),
        "eligible_clients": len(eligible_frame),
        "churn_cases": int(frame["churn"].sum()),
        "classes_present": class_values,
        "model_mode": model_mode,
        "feature_importance": feature_importance,
    }
    return {"metrics": metrics, "predictions": predictions}


def get_client_churn_prediction(db: Session, client_id: int) -> dict | None:
    result = get_churn_predictions(db)
    for item in result["predictions"]:
        if item["client_id"] == client_id:
            return item
    return None
