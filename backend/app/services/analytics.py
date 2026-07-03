from __future__ import annotations

from collections import defaultdict
from datetime import date
from io import StringIO

from sqlalchemy.orm import Session, selectinload

from app import models


CLOSED_INCIDENT_STATUSES = {"resuelta", "cerrada"}
PENDING_PAYMENT_STATUSES = {"pendiente", "vencido"}
INACTIVE_CONTRACT_STATUSES = {"cancelado", "inactivo"}
PREMIUM_CATEGORIES = {"premium", "empresarial", "corporativo"}


def shift_month(value: date, offset: int) -> date:
    month_index = value.month - 1 + offset
    year = value.year + month_index // 12
    month = month_index % 12 + 1
    return date(year, month, 1)


def _safe_pct(numerator: float, denominator: float) -> float:
    if denominator == 0:
        return 0.0
    return round((numerator / denominator) * 100, 2)


def _load_sites(db: Session, region: str | None = None) -> list[models.Site]:
    query = db.query(models.Site)
    if region:
        query = query.filter(models.Site.region == region)
    return query.order_by(models.Site.name).all()


def _load_clients(db: Session) -> list[models.Client]:
    return (
        db.query(models.Client)
        .options(
            selectinload(models.Client.site),
            selectinload(models.Client.contracts).selectinload(models.Contract.plan),
            selectinload(models.Client.contracts).selectinload(models.Contract.site),
            selectinload(models.Client.contracts).selectinload(models.Contract.payments),
            selectinload(models.Client.incidents),
            selectinload(models.Client.surveys),
        )
        .all()
    )


def _filter_site_ids(
    db: Session, region: str | None = None, site_id: int | None = None
) -> set[int]:
    query = db.query(models.Site)
    if region:
        query = query.filter(models.Site.region == region)
    if site_id:
        query = query.filter(models.Site.id == site_id)
    return {site.id for site in query.all()}


def _site_scope_label(db: Session, site_id: int | None = None) -> str:
    if site_id is None:
        return "Todas las sedes"

    site = db.get(models.Site, site_id)
    return site.name if site is not None else "Sede seleccionada"


def get_dashboard_summary(
    db: Session, region: str | None = None, site_id: int | None = None
) -> dict:
    today = date.today()
    current_month = date(today.year, today.month, 1)
    previous_month = shift_month(current_month, -1)
    next_month = shift_month(current_month, 1)
    allowed_site_ids = _filter_site_ids(db, region=region, site_id=site_id)
    clients = _load_clients(db)

    included_clients = []
    active_contracts = []
    cancelled_current = 0
    pending_current = 0
    total_billing_current = 0
    monthly_revenue = 0.0
    resolution_hours = []
    resolved_scored = 0
    resolved_satisfied = 0
    complaints_open = 0

    monthly_revenue_history = defaultdict(float)
    growth_history = defaultdict(int)
    churn_history = defaultdict(int)

    for client in clients:
        relevant_contracts = [
            contract for contract in client.contracts if contract.site_id in allowed_site_ids
        ]
        relevant_incidents = [
            incident for incident in client.incidents if incident.site_id in allowed_site_ids
        ]
        relevant_contract_ids = {contract.id for contract in relevant_contracts}
        relevant_surveys = [
            survey for survey in client.surveys if survey.contract_id in relevant_contract_ids
        ]
        if not relevant_contracts and not relevant_incidents:
            continue

        included_clients.append(client)
        growth_history[client.registered_at.strftime("%Y-%m")] += 1

        for contract in relevant_contracts:
            if contract.status == "activo":
                active_contracts.append(contract)
            if contract.end_date and contract.status in INACTIVE_CONTRACT_STATUSES:
                churn_history[contract.end_date.strftime("%Y-%m")] += 1
                if current_month <= contract.end_date < next_month:
                    cancelled_current += 1

            for payment in contract.payments:
                income_date = payment.paid_date or payment.issued_date
                month_key = income_date.strftime("%Y-%m")
                if payment.status == "pagado":
                    monthly_revenue_history[month_key] += float(payment.amount)
                if (
                    payment.status == "pagado"
                    and payment.paid_date
                    and current_month <= payment.paid_date < next_month
                ):
                    monthly_revenue += float(payment.amount)
                if current_month <= payment.issued_date < next_month:
                    total_billing_current += 1
                    if payment.status in PENDING_PAYMENT_STATUSES:
                        pending_current += 1

        for incident in relevant_incidents:
            if incident.status not in CLOSED_INCIDENT_STATUSES:
                complaints_open += 1
            if incident.resolved_at:
                resolution_hours.append(
                    (incident.resolved_at - incident.reported_at).total_seconds() / 3600
                )

        for survey in relevant_surveys:
            resolved_scored += 1
            if survey.score >= 4:
                resolved_satisfied += 1

    active_clients = len({contract.client_id for contract in active_contracts})
    current_growth = sum(1 for client in included_clients if client.registered_at >= current_month)
    previous_growth = sum(
        1
        for client in included_clients
        if previous_month <= client.registered_at < current_month
    )
    active_previous_base = (
        sum(1 for contract in active_contracts if contract.start_date < current_month)
        + cancelled_current
    )

    last_six_months = [shift_month(current_month, -offset) for offset in range(5, -1, -1)]
    history = []
    for month_start in last_six_months:
        key = month_start.strftime("%Y-%m")
        history.append(
            {
                "period": key,
                "revenue": round(monthly_revenue_history.get(key, 0.0), 2),
                "new_clients": growth_history.get(key, 0),
                "churn_events": churn_history.get(key, 0),
            }
        )

    premium_contracts = sum(
        1 for contract in active_contracts if contract.plan.category in PREMIUM_CATEGORIES
    )

    return {
        "filters": {"region": region, "site_id": site_id},
        "summary": {
            "active_clients": active_clients,
            "monthly_revenue": round(monthly_revenue, 2),
            "open_complaints": complaints_open,
            "satisfaction_rate": _safe_pct(resolved_satisfied, resolved_scored),
            "churn_rate": _safe_pct(cancelled_current, active_previous_base),
            "growth_rate": _safe_pct(current_growth, previous_growth or 1),
            "average_resolution_hours": round(
                sum(resolution_hours) / len(resolution_hours), 2
            )
            if resolution_hours
            else 0.0,
            "delinquency_rate": _safe_pct(pending_current, total_billing_current),
            "ticket_average": round(monthly_revenue / active_clients, 2)
            if active_clients
            else 0.0,
            "premium_penetration": _safe_pct(premium_contracts, len(active_contracts)),
        },
        "history": history,
    }


def get_site_kpis(db: Session, region: str | None = None) -> list[dict]:
    result = []
    for site in _load_sites(db, region=region):
        site_summary = get_dashboard_summary(db, site_id=site.id)
        summary = site_summary["summary"]
        result.append(
            {
                "site_id": site.id,
                "name": site.name,
                "city": site.city,
                "region": site.region,
                "is_expansion": site.is_expansion,
                "active_clients": summary["active_clients"],
                "monthly_revenue": summary["monthly_revenue"],
                "open_complaints": summary["open_complaints"],
                "satisfaction_rate": summary["satisfaction_rate"],
                "churn_rate": summary["churn_rate"],
                "growth_rate": summary["growth_rate"],
                "average_resolution_hours": summary["average_resolution_hours"],
            }
        )
    return result


def get_region_report(
    db: Session,
    region: str | None = None,
    site_id: int | None = None,
    start_date: date | None = None,
    end_date: date | None = None,
) -> dict:
    today = date.today()
    start_date = start_date or shift_month(date(today.year, today.month, 1), -5)
    end_date = end_date or today
    site_ids = _filter_site_ids(db, region=region, site_id=site_id)
    clients = _load_clients(db)

    report_rows = []
    month_cursor = date(start_date.year, start_date.month, 1)
    while month_cursor <= end_date:
        next_month = shift_month(month_cursor, 1)
        revenue = 0.0
        incidents = 0
        new_clients = 0
        active_clients = set()
        churn_events = 0

        for client in clients:
            if any(contract.site_id in site_ids for contract in client.contracts):
                if month_cursor <= client.registered_at < next_month:
                    new_clients += 1
            for contract in client.contracts:
                if contract.site_id not in site_ids:
                    continue
                if contract.start_date < next_month and (
                    contract.end_date is None or contract.end_date >= month_cursor
                ):
                    active_clients.add(client.id)
                if (
                    contract.end_date
                    and month_cursor <= contract.end_date < next_month
                    and contract.status in INACTIVE_CONTRACT_STATUSES
                ):
                    churn_events += 1
                for payment in contract.payments:
                    if (
                        payment.status == "pagado"
                        and payment.paid_date
                        and month_cursor <= payment.paid_date < next_month
                    ):
                        revenue += float(payment.amount)
            for incident in client.incidents:
                if (
                    incident.site_id in site_ids
                    and month_cursor <= incident.reported_at.date() < next_month
                ):
                    incidents += 1

        report_rows.append(
            {
                "period": month_cursor.strftime("%Y-%m"),
                "revenue": round(revenue, 2),
                "incidents": incidents,
                "new_clients": new_clients,
                "active_clients": len(active_clients),
                "churn_events": churn_events,
            }
        )
        month_cursor = next_month

    marketing_actions = _build_marketing_actions(
        db,
        site_id=site_id,
        report_rows=report_rows,
    )

    return {
        "region": region or "Todas",
        "site_id": site_id,
        "site_name": _site_scope_label(db, site_id=site_id),
        "start_date": start_date.isoformat(),
        "end_date": end_date.isoformat(),
        "series": report_rows,
        "totals": {
            "revenue": round(sum(row["revenue"] for row in report_rows), 2),
            "incidents": sum(row["incidents"] for row in report_rows),
            "new_clients": sum(row["new_clients"] for row in report_rows),
            "churn_events": sum(row["churn_events"] for row in report_rows),
        },
        "marketing_actions": marketing_actions,
    }


def _build_marketing_actions(
    db: Session,
    site_id: int | None,
    report_rows: list[dict],
) -> list[dict]:
    from app.services.ml import get_churn_predictions, get_segments

    site_name = _site_scope_label(db, site_id=site_id)
    predictions = get_churn_predictions(db)["predictions"]
    segments = get_segments(db)["clients"]

    if site_id is not None:
        predictions = [item for item in predictions if item["site"] == site_name]
        segments = [item for item in segments if item["site"] == site_name]

    high_risk_clients = [item for item in predictions if item["risk_level"] == "alto"]
    medium_risk_clients = [item for item in predictions if item["risk_level"] == "medio"]
    total_risk_clients = len(high_risk_clients) + len(medium_risk_clients)

    high_consumption_clients = [
        item
        for item in segments
        if item["segment"] == "Residencial Alto Consumo" and item["pending_payments"] == 0
    ]
    corporate_clients = [
        item
        for item in segments
        if item["segment"] == "Empresarial / Corporativo" and item["pending_payments"] == 0
    ]

    total_incidents = sum(row["incidents"] for row in report_rows)
    total_new_clients = sum(row["new_clients"] for row in report_rows)
    total_churn = sum(row["churn_events"] for row in report_rows)

    actions = []

    if total_risk_clients > 0:
        actions.append(
            {
                "priority": "Alta" if high_risk_clients else "Media",
                "chart_label": "Retencion",
                "title": "Campana de retencion inmediata",
                "target": (
                    f"{total_risk_clients} clientes con senales de posible baja en {site_name}."
                ),
                "why": (
                    "El sistema detecto clientes con riesgo medio o alto de abandonar el "
                    "servicio, por lo que conviene actuar antes de la cancelacion."
                ),
                "recommended_actions": [
                    "Llamada preventiva en las siguientes 48 horas.",
                    "Oferta temporal de beneficio o mejora de plan para retener al cliente.",
                    "Priorizar revision tecnica o de cobranza si el caso lo requiere.",
                ],
                "estimated_clients": total_risk_clients,
            }
        )

    if high_consumption_clients:
        actions.append(
            {
                "priority": "Media",
                "chart_label": "Mejora",
                "title": "Campana de mejora de plan",
                "target": (
                    f"{len(high_consumption_clients)} clientes con alto uso y pagos al dia."
                ),
                "why": (
                    "Hay clientes con perfil de mayor consumo que podrian responder bien a "
                    "mejoras de velocidad, combos o servicios adicionales."
                ),
                "recommended_actions": [
                    "Ofrecer subida de velocidad con precio preferencial.",
                    "Promover paquetes con servicios complementarios.",
                    "Enviar propuesta personalizada por sede o asesor comercial.",
                ],
                "estimated_clients": len(high_consumption_clients),
            }
        )
    elif corporate_clients:
        actions.append(
            {
                "priority": "Media",
                "chart_label": "Fidelizacion",
                "title": "Campana de fidelizacion empresarial",
                "target": (
                    f"{len(corporate_clients)} clientes empresariales con oportunidad de fidelizacion."
                ),
                "why": (
                    "La base muestra clientes empresariales que pueden responder bien a "
                    "beneficios de permanencia, soporte preferente o ampliacion de servicios."
                ),
                "recommended_actions": [
                    "Ofrecer renovacion con mejores condiciones comerciales.",
                    "Presentar beneficios de soporte preferente o SLA.",
                    "Proponer ampliacion de enlaces, sedes o servicios agregados.",
                ],
                "estimated_clients": len(corporate_clients),
            }
        )

    if total_incidents > 0:
        actions.append(
            {
                "priority": "Media" if total_incidents >= 8 else "Oportunidad",
                "chart_label": "Recuperacion",
                "title": "Campana de recuperacion de experiencia",
                "target": f"Clientes atendidos en {total_incidents} casos registrados en el periodo.",
                "why": (
                    "Cuando aumenta la cantidad de incidencias, una campana de seguimiento "
                    "ayuda a recuperar confianza y reduce el riesgo de quejas o bajas."
                ),
                "recommended_actions": [
                    "Enviar mensaje de seguimiento despues de la atencion.",
                    "Ofrecer encuesta corta y beneficio de recuperacion si corresponde.",
                    "Crear lista de clientes para control de calidad por sede.",
                ],
                "estimated_clients": total_incidents,
            }
        )

    if total_new_clients <= total_churn:
        actions.append(
            {
                "priority": "Oportunidad",
                "chart_label": "Captacion",
                "title": "Campana local de captacion y referidos",
                "target": f"Prospectos y recomendaciones en la sede {site_name}.",
                "why": (
                    "Las altas del periodo no superan con claridad a las bajas, por lo que "
                    "conviene reforzar la captacion comercial y los referidos."
                ),
                "recommended_actions": [
                    "Impulsar promociones de ingreso con instalacion o descuento inicial.",
                    "Activar programa de referidos para clientes satisfechos.",
                    "Coordinar volanteo, redes locales o alianzas con comercios cercanos.",
                ],
                "estimated_clients": total_new_clients,
            }
        )

    if not actions:
        actions.append(
            {
                "priority": "Oportunidad",
                "chart_label": "Presencia",
                "title": "Campana de presencia comercial",
                "target": f"Clientes actuales y prospectos de {site_name}.",
                "why": (
                    "El comportamiento actual es estable, por lo que conviene mantener "
                    "presencia comercial y recordacion de marca."
                ),
                "recommended_actions": [
                    "Promover beneficios del servicio actual y canales de atencion.",
                    "Reforzar mensajes de continuidad y calidad del servicio.",
                    "Mantener base de clientes actualizada para futuras campanas.",
                ],
                "estimated_clients": 0,
            }
        )

    return actions[:3]


def export_region_report_csv(report: dict) -> str:
    buffer = StringIO()
    buffer.write("period,revenue,incidents,new_clients,active_clients,churn_events\n")
    for row in report["series"]:
        buffer.write(
            f"{row['period']},{row['revenue']},{row['incidents']},{row['new_clients']},"
            f"{row['active_clients']},{row['churn_events']}\n"
        )
    return buffer.getvalue()


def get_retention_alerts(db: Session) -> list[dict]:
    from app.services.ml import get_churn_predictions

    predictions = get_churn_predictions(db)["predictions"]
    alerts = []
    for prediction in predictions:
        if prediction["probability_churn_percentage"] < 45:
            continue
        alerts.append(
            {
                "client_id": prediction["client_id"],
                "client_name": prediction["client_name"],
                "site": prediction["site"],
                "risk_level": prediction["risk_level"],
                "probability": prediction["probability_churn_percentage"],
                "message": (
                    f"Cliente con riesgo {prediction['risk_level']} de churn "
                    f"({prediction['probability_churn_percentage']}%)."
                ),
                "actions": prediction["actions_suggested"],
            }
        )
    return alerts[:12]
