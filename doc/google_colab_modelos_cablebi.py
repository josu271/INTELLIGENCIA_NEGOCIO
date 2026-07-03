from __future__ import annotations

import argparse
from datetime import date
from pathlib import Path

import pandas as pd
from sklearn.cluster import KMeans
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import silhouette_score
from sklearn.preprocessing import StandardScaler
from sklearn.utils import resample


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

REQUIRED_SHEETS = {
    "clientes": {
        "id_cliente",
        "nombres",
        "apellidos",
        "tipo_cliente",
        "fecha_registro",
        "estado",
    },
    "contratos": {
        "id_contrato",
        "id_cliente",
        "id_sede",
        "id_plan",
        "fecha_inicio",
        "estado",
    },
    "planes": {
        "id_plan",
        "categoria_comercial",
        "velocidad_mbps",
        "precio_mensual",
        "estado",
    },
    "pagos": {
        "id_pago",
        "id_contrato",
        "fecha_emision",
        "fecha_pago",
        "monto",
        "estado",
    },
    "incidencias": {
        "id_incidencia",
        "id_cliente",
        "id_contrato",
        "id_sede",
        "fecha_reporte",
        "estado",
    },
    "sedes": {
        "id_sede",
        "nombre_sede",
        "estado",
    },
}


def running_in_colab() -> bool:
    try:
        import google.colab  # type: ignore
    except ImportError:
        return False
    return True


def normalize_text(value: object) -> str:
    if pd.isna(value):
        return ""
    return str(value).strip().lower()


def safe_text(value: object, default: str = "") -> str:
    if pd.isna(value):
        return default
    text = str(value).strip()
    return text if text else default


def safe_int(value: object, default: int = 0) -> int:
    if pd.isna(value):
        return default
    try:
        return int(float(value))
    except (TypeError, ValueError):
        return default


def safe_float(value: object, default: float = 0.0) -> float:
    if pd.isna(value):
        return default
    try:
        return float(value)
    except (TypeError, ValueError):
        return default


def months_between(start: pd.Timestamp, end: pd.Timestamp) -> int:
    if pd.isna(start):
        return 1
    return max(1, (end.year - start.year) * 12 + end.month - start.month + 1)


def risk_level(probability: float) -> str:
    if probability >= 70:
        return "alto"
    if probability >= 40:
        return "medio"
    return "bajo"


def validate_workbook(tables: dict[str, pd.DataFrame]) -> None:
    missing_sheets = sorted(set(REQUIRED_SHEETS) - set(tables))
    if missing_sheets:
        raise ValueError(
            "Faltan hojas en el Excel: " + ", ".join(missing_sheets)
        )

    for sheet_name, required_columns in REQUIRED_SHEETS.items():
        current_columns = set(tables[sheet_name].columns)
        missing_columns = sorted(required_columns - current_columns)
        if missing_columns:
            raise ValueError(
                f"En la hoja '{sheet_name}' faltan columnas: "
                + ", ".join(missing_columns)
            )


def load_excel_tables(excel_path: Path) -> dict[str, pd.DataFrame]:
    workbook = pd.read_excel(excel_path, sheet_name=None)
    tables: dict[str, pd.DataFrame] = {}

    for sheet_name, frame in workbook.items():
        normalized_sheet = str(sheet_name).strip().lower()
        frame = frame.copy()
        frame.columns = [str(column).strip().lower() for column in frame.columns]
        tables[normalized_sheet] = frame

    validate_workbook(tables)
    return tables


def prepare_tables(tables: dict[str, pd.DataFrame]) -> dict[str, pd.DataFrame]:
    prepared = {name: frame.copy() for name, frame in tables.items()}

    date_columns = {
        "clientes": ["fecha_registro"],
        "contratos": ["fecha_inicio", "fecha_fin"],
        "pagos": ["fecha_emision", "fecha_pago"],
        "incidencias": ["fecha_reporte", "fecha_resolucion"],
    }
    numeric_columns = {
        "clientes": ["id_cliente", "id_sede"],
        "contratos": ["id_contrato", "id_cliente", "id_sede", "id_plan"],
        "planes": ["id_plan", "velocidad_mbps", "precio_mensual"],
        "pagos": ["id_pago", "id_contrato", "monto"],
        "incidencias": ["id_incidencia", "id_cliente", "id_contrato", "id_sede"],
        "sedes": ["id_sede"],
    }

    for sheet_name, columns in date_columns.items():
        for column in columns:
            if column in prepared[sheet_name]:
                prepared[sheet_name][column] = pd.to_datetime(
                    prepared[sheet_name][column], errors="coerce"
                )

    for sheet_name, columns in numeric_columns.items():
        for column in columns:
            if column in prepared[sheet_name]:
                prepared[sheet_name][column] = pd.to_numeric(
                    prepared[sheet_name][column], errors="coerce"
                )

    prepared["clientes"]["estado_norm"] = prepared["clientes"]["estado"].map(normalize_text)
    prepared["clientes"]["tipo_cliente_norm"] = prepared["clientes"]["tipo_cliente"].map(
        normalize_text
    )
    prepared["contratos"]["estado_norm"] = prepared["contratos"]["estado"].map(normalize_text)
    prepared["planes"]["categoria_norm"] = prepared["planes"]["categoria_comercial"].map(
        normalize_text
    )
    prepared["pagos"]["estado_norm"] = prepared["pagos"]["estado"].map(normalize_text)
    prepared["incidencias"]["estado_norm"] = prepared["incidencias"]["estado"].map(normalize_text)

    prepared["planes"]["precio_mensual"] = prepared["planes"]["precio_mensual"].fillna(0)
    prepared["planes"]["velocidad_mbps"] = prepared["planes"]["velocidad_mbps"].fillna(0)
    prepared["pagos"]["monto"] = prepared["pagos"]["monto"].fillna(0)

    return prepared


def build_feature_frame(tables: dict[str, pd.DataFrame]) -> pd.DataFrame:
    today = pd.Timestamp(date.today())
    clientes = tables["clientes"].copy()
    contratos = tables["contratos"].copy()
    planes = tables["planes"].copy()
    pagos = tables["pagos"].copy()
    incidencias = tables["incidencias"].copy()
    sedes = tables["sedes"].copy()

    contratos = contratos.merge(
        planes[
            ["id_plan", "categoria_comercial", "categoria_norm", "velocidad_mbps", "precio_mensual"]
        ],
        on="id_plan",
        how="left",
    )
    contratos = contratos.merge(
        sedes[["id_sede", "nombre_sede"]],
        on="id_sede",
        how="left",
    )

    rows = []
    for _, client in clientes.iterrows():
        client_id = client["id_cliente"]
        client_contracts = contratos[contratos["id_cliente"] == client_id].copy()
        if client_contracts.empty:
            continue

        client_contracts = client_contracts.sort_values("fecha_inicio")
        latest_contract = client_contracts.iloc[-1]
        max_plan = client_contracts.sort_values("precio_mensual").iloc[-1]

        client_payments = pagos[pagos["id_contrato"].isin(client_contracts["id_contrato"])].copy()
        paid_payments = client_payments[client_payments["estado_norm"] == "pagado"].copy()
        pending_payments = client_payments[
            client_payments["estado_norm"].isin(PENDING_PAYMENT_STATUSES)
        ].copy()

        client_incidents = incidencias[incidencias["id_cliente"] == client_id].copy()
        open_incidents = client_incidents[
            ~client_incidents["estado_norm"].isin(CLOSED_INCIDENT_STATUSES)
        ].copy()

        last_payment_date = pd.NaT
        if not paid_payments.empty:
            payment_dates = paid_payments["fecha_pago"].fillna(paid_payments["fecha_emision"])
            last_payment_date = payment_dates.max()

        recent_incidents = 0
        if "fecha_reporte" in client_incidents:
            recent_incidents = int(
                (
                    (today - client_incidents["fecha_reporte"]).dt.days.fillna(9999) <= 60
                ).sum()
            )

        rows.append(
            {
                "client_id": safe_int(client_id),
                "client_name": (
                    f"{safe_text(client.get('nombres'))} {safe_text(client.get('apellidos'))}"
                ).strip(),
                "latest_site": safe_text(latest_contract.get("nombre_sede"), "Sin sede"),
                "site_code": safe_int(latest_contract.get("id_sede"), 0),
                "max_price": safe_float(max_plan.get("precio_mensual"), 0.0),
                "max_speed": safe_float(max_plan.get("velocidad_mbps"), 0.0),
                "total_contracts": int(len(client_contracts)),
                "active_contracts": int(
                    (client_contracts["estado_norm"] == ACTIVE_CONTRACT_STATUS).sum()
                ),
                "total_paid_amount": float(paid_payments["monto"].sum()),
                "total_payments": int(len(paid_payments)),
                "pending_payments": int(len(pending_payments)),
                "days_since_last_payment": (
                    int((today - last_payment_date).days)
                    if not pd.isna(last_payment_date)
                    else 180
                ),
                "tenure_months": months_between(client_contracts.iloc[0]["fecha_inicio"], today),
                "plan_level": PLAN_ORDER.get(normalize_text(latest_contract.get("categoria_comercial")), 0),
                "open_incidents": int(len(open_incidents)),
                "recent_incidents": recent_incidents,
                "churn": int(
                    latest_contract["estado_norm"] in CHURN_CONTRACT_STATUSES
                ),
                "client_status": client["estado_norm"],
                "customer_type": client["tipo_cliente_norm"],
            }
        )

    return pd.DataFrame(rows)


def get_segments(frame: pd.DataFrame) -> tuple[dict, pd.DataFrame]:
    if frame.empty:
        return {"silhouette_score": 0, "distribution": []}, pd.DataFrame()

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
    ].fillna(0)

    scaler = StandardScaler()
    scaled_features = scaler.fit_transform(features)
    cluster_count = min(4, len(frame))
    model = KMeans(n_clusters=cluster_count, n_init=10, random_state=42)
    labels = model.fit_predict(scaled_features)

    segment_frame = frame.copy()
    segment_frame["cluster"] = labels

    silhouette = 0.0
    if len(segment_frame) > 4 and len(set(labels)) > 1:
        silhouette = float(silhouette_score(scaled_features, labels))

    cluster_summary = (
        segment_frame.groupby("cluster")
        .agg(
            avg_price=("max_price", "mean"),
            avg_speed=("max_speed", "mean"),
            avg_pending=("pending_payments", "mean"),
            churn_ratio=("churn", "mean"),
            clients=("client_id", "count"),
        )
        .reset_index()
    )

    cluster_labels: dict[int, str] = {}
    unique_clusters = list(segment_frame["cluster"].unique())
    if len(unique_clusters) == 1:
        cluster_labels[int(unique_clusters[0])] = "Base General"
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
                cluster_labels[int(cluster_id)] = "En Riesgo"
            elif cluster_id == premium_cluster:
                cluster_labels[int(cluster_id)] = "Empresarial / Corporativo"
            elif cluster_id == high_consumption_cluster:
                cluster_labels[int(cluster_id)] = "Residencial Alto Consumo"
            else:
                cluster_labels[int(cluster_id)] = "Residencial Economico"

    segment_frame["segment"] = segment_frame["cluster"].map(cluster_labels)

    distribution = (
        segment_frame["segment"]
        .value_counts()
        .rename_axis("segment")
        .reset_index(name="clients")
    )
    distribution["share"] = (
        distribution["clients"] / len(segment_frame) * 100
    ).round(2)

    client_segments = segment_frame[
        [
            "client_id",
            "client_name",
            "latest_site",
            "segment",
            "max_price",
            "max_speed",
            "pending_payments",
        ]
    ].copy()
    client_segments = client_segments.rename(
        columns={
            "latest_site": "site",
        }
    )
    client_segments["max_price"] = client_segments["max_price"].round(2)
    client_segments["max_speed"] = client_segments["max_speed"].round(0).astype(int)
    client_segments["pending_payments"] = client_segments["pending_payments"].astype(int)
    client_segments = client_segments.sort_values(["segment", "client_name"])

    summary = {
        "silhouette_score": round(silhouette, 3),
        "distribution": distribution.to_dict("records"),
    }
    return summary, client_segments


def get_churn_predictions(frame: pd.DataFrame) -> tuple[dict, pd.DataFrame]:
    if frame.empty:
        return {
            "records": 0,
            "eligible_clients": 0,
            "churn_cases": 0,
            "classes_present": [],
            "model_mode": "empty",
            "model_name": "Random Forest",
            "library": "scikit-learn",
            "feature_importance": [],
        }, pd.DataFrame()

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

    prediction_frame = frame.copy()
    prediction_frame["probability"] = probabilities
    prediction_frame["risk_level"] = prediction_frame["probability"].apply(risk_level)

    eligible_frame = prediction_frame[
        (prediction_frame["client_status"] == "activo")
        & (prediction_frame["active_contracts"] > 0)
    ].copy()

    predictions = []
    for _, row in eligible_frame.sort_values("probability", ascending=False).iterrows():
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
                "client_id": int(row["client_id"]),
                "client_name": row["client_name"],
                "site": row["latest_site"],
                "probability_churn_percentage": round(float(row["probability"]), 2),
                "risk_level": row["risk_level"],
                "actions_suggested": " | ".join(actions),
            }
        )

    metrics = {
        "records": int(len(frame)),
        "eligible_clients": int(len(eligible_frame)),
        "churn_cases": int(frame["churn"].sum()),
        "classes_present": class_values,
        "model_mode": model_mode,
        "model_name": "Random Forest",
        "library": "scikit-learn",
        "feature_importance": feature_importance,
    }
    return metrics, pd.DataFrame(predictions)


def build_metrics_frame(segment_summary: dict, churn_metrics: dict) -> pd.DataFrame:
    return pd.DataFrame(
        [
            {"metric": "modelo_segmentacion", "value": "K-Means"},
            {"metric": "modelo_riesgo_baja", "value": churn_metrics["model_name"]},
            {"metric": "libreria_ml", "value": churn_metrics["library"]},
            {"metric": "silhouette_score", "value": segment_summary["silhouette_score"]},
            {"metric": "clientes_modelados", "value": churn_metrics["records"]},
            {"metric": "clientes_evaluados", "value": churn_metrics["eligible_clients"]},
            {"metric": "casos_churn_historico", "value": churn_metrics["churn_cases"]},
            {
                "metric": "clases_detectadas",
                "value": ", ".join(str(item) for item in churn_metrics["classes_present"]),
            },
            {"metric": "modo_modelo", "value": churn_metrics["model_mode"]},
        ]
    )


def save_outputs(
    output_path: Path,
    segment_summary: dict,
    segment_clients: pd.DataFrame,
    churn_metrics: dict,
    churn_predictions: pd.DataFrame,
) -> None:
    distribution_frame = pd.DataFrame(segment_summary["distribution"])
    feature_importance_frame = pd.DataFrame(churn_metrics["feature_importance"])
    metrics_frame = build_metrics_frame(segment_summary, churn_metrics)

    with pd.ExcelWriter(output_path, engine="openpyxl") as writer:
        distribution_frame.to_excel(writer, index=False, sheet_name="segmentos_resumen")
        segment_clients.to_excel(writer, index=False, sheet_name="segmentos_clientes")
        churn_predictions.to_excel(writer, index=False, sheet_name="churn_predicciones")
        feature_importance_frame.to_excel(writer, index=False, sheet_name="variables_clave")
        metrics_frame.to_excel(writer, index=False, sheet_name="metricas_modelo")


def resolve_excel_path(cli_path: str | None) -> Path:
    if cli_path:
        return Path(cli_path).expanduser().resolve()

    if running_in_colab():
        from google.colab import files  # type: ignore

        uploaded = files.upload()
        if not uploaded:
            raise SystemExit("No se subio ningun archivo Excel.")
        first_file = next(iter(uploaded.keys()))
        return Path(first_file).resolve()

    raise SystemExit("Indica la ruta del Excel con --excel.")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Ejecuta los modelos de CableBI desde un Excel en Google Colab o local."
    )
    parser.add_argument(
        "--excel",
        help="Ruta al archivo Excel con las hojas: clientes, contratos, planes, pagos, incidencias y sedes.",
    )
    parser.add_argument(
        "--output",
        default="resultados_ml_cablebi.xlsx",
        help="Ruta del archivo Excel de salida.",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    excel_path = resolve_excel_path(args.excel)
    output_path = Path(args.output).expanduser().resolve()

    tables = load_excel_tables(excel_path)
    prepared_tables = prepare_tables(tables)
    feature_frame = build_feature_frame(prepared_tables)

    segment_summary, segment_clients = get_segments(feature_frame)
    churn_metrics, churn_predictions = get_churn_predictions(feature_frame)
    save_outputs(
        output_path,
        segment_summary,
        segment_clients,
        churn_metrics,
        churn_predictions,
    )

    print("Proceso completado.")
    print(f"Excel de entrada: {excel_path}")
    print(f"Clientes modelados: {churn_metrics['records']}")
    print(f"Clientes evaluados para riesgo: {churn_metrics['eligible_clients']}")
    print(f"Archivo generado: {output_path}")
    print("Modelos usados: K-Means para segmentacion y Random Forest para riesgo de baja.")


if __name__ == "__main__":
    main()
