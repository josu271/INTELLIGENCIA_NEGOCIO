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


# Motor de machine learning de CableBI.
# 1. Segmentacion de clientes con K-Means.
# 2. Prediccion de riesgo de baja con Random Forest.
# Antes de usar cualquier modelo, el sistema convierte los datos reales
# de PostgreSQL en una tabla de variables numericas. Esa tabla sirve como
# base comun para ambos analisis.


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
    """Calcula la antiguedad del cliente en meses.

    Se fuerza un minimo de 1 para evitar valores cero en clientes
    nuevos y mantener estable el analisis.
    """
    return max(1, (end.year - start.year) * 12 + end.month - start.month + 1)


def _risk_level(probability: float) -> str:
    """Traduce la probabilidad numerica a una etiqueta operativa simple."""
    if probability >= 70:
        return "alto"
    if probability >= 40:
        return "medio"
    return "bajo"


def _load_clients(db: Session) -> list[models.Client]:
    """Carga clientes con sus relaciones para evitar consultas repetidas.

    Se trae contratos, planes, sedes, pagos e incidencias de una sola vez
    para que el backend sea mas ligero al construir las variables del modelo.
    """
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
    """Convierte los datos operativos en variables que el modelo puede leer.

    Aqui no se entrena un modelo todavia. Primero se resume el historial de
    cada cliente en una fila con indicadores utiles para el negocio:
    pagos, antiguedad, incidencias, plan contratado y estado del servicio.
    """
    today = date.today()
    rows = []
    for client in _load_clients(db):
        if not client.contracts:
            continue

        # Ordenamos contratos para conocer la evolucion del cliente y tomar
        # el contrato mas reciente como referencia actual.
        contracts = sorted(client.contracts, key=lambda item: item.start_date)
        latest_contract = max(contracts, key=lambda item: item.start_date)

        # Consolidamos los pagos de todos los contratos del cliente para medir
        # cumplimiento y detectar atrasos.
        payments = [payment for contract in contracts for payment in contract.payments]
        paid_payments = [payment for payment in payments if payment.status == "pagado"]
        pending_payments = [
            payment for payment in payments if payment.status in PENDING_PAYMENT_STATUSES
        ]

        # Las incidencias abiertas o recientes suelen ser una senal de riesgo:
        # si el cliente tiene problemas tecnicos sin resolver, puede darse de baja.
        open_incidents = [
            incident
            for incident in client.incidents
            if incident.status not in CLOSED_INCIDENT_STATUSES
        ]

        # Se toma el plan de mayor valor para representar el peso comercial del cliente.
        max_plan = max(contracts, key=lambda item: float(item.plan.monthly_price))
        last_payment_date = None
        if paid_payments:
            last_payment_date = max(
                payment.paid_date or payment.issued_date for payment in paid_payments
            )

        rows.append(
            {
                # Datos de identificacion para mostrar resultados al usuario.
                "client_id": client.id,
                "client_name": f"{client.first_name} {client.last_name}",
                "latest_site": latest_contract.site.name,

                # Variables numericas para segmentacion y prediccion.
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

                # Si nunca pago, se asigna un valor alto para reflejar
                # poca evidencia de cumplimiento.
                "days_since_last_payment": (
                    (today - last_payment_date).days if last_payment_date else 180
                ),
                "tenure_months": _months_between(contracts[0].start_date, today),

                # PLAN_ORDER convierte categorias de texto en una escala numerica.
                "plan_level": PLAN_ORDER.get(latest_contract.plan.category, 0),
                "open_incidents": len(open_incidents),
                "recent_incidents": sum(
                    1
                    for incident in client.incidents
                    if (today - incident.reported_at.date()).days <= 60
                ),

                # Esta es la etiqueta historica que usa Random Forest para aprender.
                # 1 significa que el cliente termino en un estado asociado a baja.
                "churn": 1 if latest_contract.status in CHURN_CONTRACT_STATUSES else 0,
                "client_status": client.status,
                "customer_type": client.customer_type,
            }
        )

    return pd.DataFrame(rows)


def get_segments(db: Session) -> dict:
    """Agrupa clientes por comportamientos parecidos usando K-Means.

    El modelo no predice una baja. Su trabajo es encontrar grupos naturales
    de clientes segun precio, velocidad, pagos y sede para ayudar a crear
    campanas y seguimiento por perfil.
    """
    frame = build_feature_frame(db)
    if frame.empty:
        return {"silhouette_score": 0, "distribution": [], "clients": []}

    # K-Means necesita variables numericas. Por eso se seleccionan solo
    # columnas medibles y no textos como nombre o estado descriptivo.
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

    # Se normalizan escalas para que una variable grande, como monto pagado,
    # no domine injustamente a otra mas pequena, como cantidad de contratos.
    scaler = StandardScaler()
    scaled_features = scaler.fit_transform(features)

    # Se limita a 4 grupos para mantener el analisis facil de interpretar.
    # Si hay pocos clientes, se usan menos grupos automaticamente.
    cluster_count = min(4, len(frame))
    model = KMeans(n_clusters=cluster_count, n_init=10, random_state=42)
    labels = model.fit_predict(scaled_features)
    frame["cluster"] = labels

    # El silhouette score mide si los grupos quedaron bien separados.
    # Se calcula solo cuando hay datos suficientes y mas de un grupo real.
    silhouette = 0
    if len(frame) > 4 and len(set(labels)) > 1:
        silhouette = float(silhouette_score(scaled_features, labels))

    # Resumimos cada grupo para traducir el resultado tecnico
    # a etiquetas comprensibles para el negocio.
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
        # El grupo con mas pendientes y mas historial de bajas se considera
        # el de mayor riesgo comercial.
        risk_cluster = (
            cluster_summary.assign(
                score=cluster_summary["avg_pending"] + cluster_summary["churn_ratio"] * 2
            )
            .sort_values("score", ascending=False)
            .iloc[0]["cluster"]
        )

        # Entre los demas grupos, el de mayor precio promedio se toma como
        # perfil premium o empresarial.
        premium_candidates = cluster_summary[cluster_summary["cluster"] != risk_cluster]
        premium_cluster = (
            premium_candidates.sort_values("avg_price", ascending=False).iloc[0]["cluster"]
            if not premium_candidates.empty
            else risk_cluster
        )

        # El grupo restante con mayor velocidad promedio se interpreta como
        # clientes residenciales de alto consumo.
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

    # Este bloque arma la distribucion para el panel de negocio:
    # cuantos clientes hay por tipo y que porcentaje representan.
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

    # Finalmente se devuelve una lista lista para mostrar en tablas del frontend.
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
    """Calcula el riesgo de baja con un modelo Random Forest.

    Este modelo aprende de casos historicos: compara clientes que siguieron
    activos contra clientes que terminaron inactivos o cancelados, y con eso
    estima una probabilidad de baja para los clientes actuales.
    """
    frame = build_feature_frame(db)
    if frame.empty:
        return {"metrics": {}, "predictions": []}

    # Estas son las variables de entrada del modelo.
    # Se eligieron por relacion directa con permanencia, cobranza y soporte.
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

    # Si hay pocos casos de baja, el modelo puede aprender mal.
    # Por eso se balancea la clase minoritaria repitiendo ejemplos de churn.
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
        # Si solo existe una clase historica, no se puede entrenar un clasificador
        # real. En ese caso devolvemos una probabilidad fija como salida de respaldo.
        base_probability = 100.0 if class_values and class_values[0] == 1 else 0.0
        probabilities = pd.Series(base_probability, index=frame.index, dtype="float64")
        feature_importance = [
            {"feature": feature, "importance": 0.0} for feature in feature_columns
        ]
        model_mode = "single_class_fallback"
    else:
        # Random Forest combina muchos arboles de decision para lograr una
        # prediccion mas estable y menos sensible a ruido puntual.
        model = RandomForestClassifier(
            n_estimators=200,
            max_depth=10,
            min_samples_split=5,
            min_samples_leaf=2,
            max_features="sqrt",
            class_weight="balanced",
            random_state=42,
        )

        # El entrenamiento usa variables historicas y la etiqueta churn.
        model.fit(training[feature_columns], training["churn"])

        # Luego el modelo estima la probabilidad de baja para cada cliente actual.
        probabilities = model.predict_proba(frame[feature_columns])[:, 1] * 100

        # Esta salida explica que variables pesaron mas dentro del bosque.
        feature_importance = [
            {"feature": feature, "importance": round(float(weight), 4)}
            for feature, weight in sorted(
                zip(feature_columns, model.feature_importances_),
                key=lambda item: item[1],
                reverse=True,
            )
        ]

    # Convertimos la salida tecnica del modelo a un nivel de riesgo facil de leer.
    frame["probability"] = probabilities
    frame["risk_level"] = frame["probability"].apply(_risk_level)

    # Solo se muestran clientes actualmente activos, porque sobre ellos
    # si tiene sentido ejecutar acciones preventivas.
    eligible_frame = frame[
        (frame["client_status"] == "activo") & (frame["active_contracts"] > 0)
    ].copy()

    predictions = []
    for row in eligible_frame.sort_values("probability", ascending=False).to_dict("records"):
        # Las acciones sugeridas no salen del modelo directamente.
        # Son reglas de negocio construidas a partir del riesgo y del contexto.
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

    # Estas metricas ayudan a explicar con que informacion se calculo el resultado.
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
    """Devuelve la evaluacion de un cliente especifico ya procesado por el modelo."""
    result = get_churn_predictions(db)
    for item in result["predictions"]:
        if item["client_id"] == client_id:
            return item
    return None
