from __future__ import annotations

import re
import unicodedata
from dataclasses import dataclass
from datetime import date, timedelta
from decimal import Decimal

from sqlalchemy.orm import Session, selectinload

from app import models
from app.services.analytics import get_dashboard_summary, get_region_report, get_retention_alerts
from app.services.ml import get_churn_predictions, get_client_churn_prediction, get_segments


ACTIVE_CONTRACT_STATUS = "activo"
CLOSED_INCIDENT_STATUSES = {"resuelta", "cerrada"}
INACTIVE_CONTRACT_STATUSES = {"cancelado", "inactivo"}
PENDING_PAYMENT_STATUSES = {"pendiente", "vencido"}

HELP_BY_VIEW = {
    "dashboard": [
        "Dame un resumen general",
        "Cuanto se cobro este mes",
        "Cuantas incidencias abiertas hay",
    ],
    "clientes": [
        "Cuantos clientes activos hay",
        "Cuantos clientes ingresaron este mes",
        "Busca al cliente con DNI 70000001",
    ],
    "contratos": [
        "Cuantos contratos activos hay",
        "Cuantos contratos iniciaron este mes",
        "Que planes existen",
    ],
    "pagos": [
        "Cuanto se cobro este mes",
        "Cuantos pagos pendientes hay",
        "Cuanto cobraron en junio",
    ],
    "incidencias": [
        "Cuantas incidencias abiertas hay",
        "Cuantas incidencias hubo en junio",
        "Hay casos de alta prioridad",
    ],
    "reportes": [
        "Resume el reporte general",
        "Cuanto se cobro en junio",
        "Cuantas bajas hubo este mes",
    ],
    "ml": [
        "Muestra clientes con mayor riesgo",
        "Hay alertas de retencion",
        "Como esta la segmentacion",
    ],
}

DEFAULT_HELP = [
    "Dame un resumen general",
    "Cuanto se cobro este mes",
    "Muestra clientes con mayor riesgo",
]

STOPWORDS = {
    "a",
    "al",
    "alguna",
    "algun",
    "ayuda",
    "con",
    "como",
    "cuanto",
    "cuantos",
    "cuanta",
    "cuantas",
    "cual",
    "cuales",
    "de",
    "del",
    "dime",
    "el",
    "en",
    "estado",
    "esta",
    "este",
    "favor",
    "hay",
    "la",
    "las",
    "lo",
    "los",
    "me",
    "mi",
    "muestra",
    "para",
    "por",
    "que",
    "quiero",
    "resumen",
    "se",
    "su",
    "sus",
    "tiene",
    "un",
    "una",
    "ver",
}

MONTH_ALIASES = {
    "enero": 1,
    "febrero": 2,
    "marzo": 3,
    "abril": 4,
    "mayo": 5,
    "junio": 6,
    "julio": 7,
    "agosto": 8,
    "septiembre": 9,
    "setiembre": 9,
    "octubre": 10,
    "noviembre": 11,
    "diciembre": 12,
}

MONTH_NAMES = {
    1: "enero",
    2: "febrero",
    3: "marzo",
    4: "abril",
    5: "mayo",
    6: "junio",
    7: "julio",
    8: "agosto",
    9: "septiembre",
    10: "octubre",
    11: "noviembre",
    12: "diciembre",
}

TRIMESTER_ALIASES = {
    "primer": 1,
    "1er": 1,
    "primero": 1,
    "segundo": 2,
    "2do": 2,
    "tercer": 3,
    "tercero": 3,
    "3er": 3,
    "cuarto": 4,
    "4to": 4,
}

MONTH_PATTERN = "|".join(sorted(MONTH_ALIASES.keys(), key=len, reverse=True))
COUNT_TOKENS = {"cuanto", "cuantos", "cuanta", "cuantas", "cantidad", "numero"}
PAYMENT_PREFIXES = {"pag", "cobr", "recaud", "abon", "deud", "moros", "factur"}
COLLECTED_PREFIXES = {"cobr", "recaud", "ingres", "abon"}
PENDING_PREFIXES = {"pendient", "vencid", "deud", "moros"}
CLIENT_PREFIXES = {"client", "dni", "registr", "afiliad", "alta", "altas", "usuario", "persona"}
CONTRACT_PREFIXES = {"contrat", "servici", "baja", "bajas", "cancel", "renov"}
INCIDENT_PREFIXES = {"incidenc", "reclam", "soport", "ticket", "aver", "fall", "cort", "interrupc"}
REPORT_PREFIXES = {"report", "histor", "tendenc", "compar", "period", "indic", "metric"}
SITE_PREFIXES = {"sede", "sedes", "region", "regional", "sucursal", "local", "ciudad"}
ML_PREFIXES = {"riesg", "churn", "retenc", "alert", "segment", "predic", "probabil"}
PLAN_PREFIXES = {"plan", "planes", "veloc", "mbps"}
OVERVIEW_PREFIXES = {"resumen", "general", "dashboard", "panel", "kpi", "kpis", "vision"}
FOLLOW_UP_TOKENS = {"y", "ahora", "tambien", "entonces", "igual", "eso", "esa", "ese", "sus", "su"}
FOLLOW_UP_PHRASES = {
    "en ese periodo",
    "ese periodo",
    "ese mes",
    "ese ano",
    "ese anio",
    "esa sede",
    "esa region",
    "ese cliente",
    "esa persona",
    "sus pagos",
    "sus contratos",
    "sus incidencias",
    "su riesgo",
    "el riesgo",
}
THANKS_PATTERNS = {"gracias", "muchas gracias", "perfecto gracias", "genial gracias", "ok gracias"}
IDENTITY_PATTERNS = {"quien eres", "como te llamas", "tu nombre", "quien es zoe"}
VIEW_DOMAIN_HINTS = {
    "dashboard": "overview",
    "clientes": "clients",
    "contratos": "contracts",
    "pagos": "payments",
    "incidencias": "incidents",
    "reportes": "reports",
    "ml": "ml",
}
PERIOD_AWARE_DOMAINS = {"clients", "contracts", "payments", "incidents", "reports"}


@dataclass
class Scope:
    site: models.Site | None = None
    region: str | None = None
    label: str = "toda la empresa"


@dataclass
class Period:
    start: date
    end: date
    label: str


@dataclass
class ConversationContext:
    domain: str | None = None
    scope: Scope | None = None
    client: models.Client | None = None
    period: Period | None = None


def shift_month(value: date, offset: int) -> date:
    month_index = value.month - 1 + offset
    year = value.year + month_index // 12
    month = month_index % 12 + 1
    return date(year, month, 1)


def _normalize_text(value: str) -> str:
    normalized = unicodedata.normalize("NFKD", value.lower())
    ascii_text = normalized.encode("ascii", "ignore").decode("ascii")
    clean_text = re.sub(r"[^a-z0-9\s]", " ", ascii_text)
    return re.sub(r"\s+", " ", clean_text).strip()


def _contains_any(message: str, options: set[str] | list[str] | tuple[str, ...]) -> bool:
    return any(option in message for option in options)


def _tokenize(message: str) -> list[str]:
    return [token for token in message.split() if token]


def _has_prefix(tokens: list[str], prefixes: set[str]) -> bool:
    return any(any(token.startswith(prefix) for prefix in prefixes) for token in tokens)


def _format_money(value: float | int | Decimal) -> str:
    return f"S/ {float(value):,.2f}"


def _format_date(value: date | None) -> str:
    if value is None:
        return "sin fecha"
    return value.strftime("%d/%m/%Y")


def _format_period(period: Period) -> str:
    return f"{period.label} ({_format_date(period.start)} al {_format_date(period.end - timedelta(days=1))})"


def _build_basic_response(scope: str, message: str, suggestions: list[str]) -> dict:
    return {
        "assistant_name": "Zoe",
        "scope": scope,
        "message": message,
        "suggestions": suggestions,
    }


def _help_suggestions(current_view: str | None) -> list[str]:
    return HELP_BY_VIEW.get(current_view or "", DEFAULT_HELP)


def _build_help_message(user: models.User, current_view: str | None) -> dict:
    first_name = user.first_name.strip().split(" ")[0]
    return {
        "assistant_name": "Zoe",
        "scope": "help",
        "message": (
            f"Hola {first_name}, soy Zoe. Puedo ayudarte con datos internos de CableBI: "
            "clientes, contratos, pagos, incidencias, sedes, reportes y analisis de riesgo. "
            "Tambien entiendo consultas por mes, anio y rangos como junio de 2026 o los ultimos 3 meses. "
            "Si ya iniciamos una consulta, puedes seguir con preguntas como y en junio, y sus pagos o y el riesgo."
        ),
        "suggestions": _help_suggestions(current_view),
    }


def _build_out_of_scope_message(current_view: str | None) -> dict:
    return {
        "assistant_name": "Zoe",
        "scope": "restricted",
        "message": (
            "Solo respondo consultas internas de la empresa y datos del sistema CableBI. "
            "Puedo ayudarte con clientes, contratos, pagos, incidencias, sedes, reportes "
            "y alertas de riesgo."
        ),
        "suggestions": _help_suggestions(current_view),
    }


def _default_domain_for_view(current_view: str | None) -> str | None:
    return VIEW_DOMAIN_HINTS.get(current_view or "")


def _scope_has_filters(scope: Scope | None) -> bool:
    return scope is not None and (scope.site is not None or scope.region is not None)


def _history_value(item: object, field_name: str) -> str | None:
    if isinstance(item, dict):
        value = item.get(field_name)
    else:
        value = getattr(item, field_name, None)
    return value if isinstance(value, str) else None


def _is_follow_up_message(
    normalized_message: str,
    tokens: list[str],
    period: Period | None,
) -> bool:
    if _contains_any(normalized_message, FOLLOW_UP_PHRASES):
        return True
    if tokens and tokens[0] in FOLLOW_UP_TOKENS:
        return True
    return period is not None and len(tokens) <= 4


def _should_reuse_client_context(
    normalized_message: str,
    tokens: list[str],
    detected_client: models.Client | None,
    domain: str | None,
) -> bool:
    if detected_client is not None:
        return False
    if any(token in {"su", "sus"} for token in tokens):
        return True
    if _contains_any(normalized_message, {"ese cliente", "esa persona", "el cliente", "la clienta"}):
        return True
    return domain in {"contracts", "payments", "incidents", "ml"} and len(tokens) <= 4


def _should_reuse_period_context(
    normalized_message: str,
    period: Period | None,
    domain: str | None,
    is_follow_up: bool,
) -> bool:
    if period is not None:
        return False
    if _contains_any(normalized_message, {"ese periodo", "ese mes", "ese ano", "ese anio", "esa fecha"}):
        return True
    return (
        is_follow_up
        and domain in PERIOD_AWARE_DOMAINS
        and not _contains_any(normalized_message, {"general", "actual", "hoy", "ayer"})
    )


def _should_reuse_scope_context(normalized_message: str, scope: Scope, is_follow_up: bool) -> bool:
    if _scope_has_filters(scope):
        return False
    if _contains_any(normalized_message, {"esa sede", "esa region", "ahi", "alli"}):
        return True
    return is_follow_up


def _detect_domain(
    normalized_message: str,
    tokens: list[str],
    detected_client: models.Client | None,
    period: Period | None,
    fallback_domain: str | None = None,
) -> str | None:
    if _has_prefix(tokens, PLAN_PREFIXES):
        return "plans"

    if detected_client is not None and _contains_any(
        normalized_message,
        {"cliente", "dni", "estado", "datos", "informacion", "buscar", "busca"},
    ):
        return "clients"

    if _contains_any(normalized_message, {"cliente", "clientes", "usuario", "usuarios"}) or (
        _has_prefix(tokens, CLIENT_PREFIXES)
        and not _has_prefix(tokens, PAYMENT_PREFIXES | INCIDENT_PREFIXES | ML_PREFIXES)
    ):
        return "clients"

    if _has_prefix(tokens, CONTRACT_PREFIXES) or _contains_any(
        normalized_message,
        {
            "contrato",
            "contratos",
            "servicio",
            "servicios",
            "cancelacion",
            "cancelaciones",
            "renovacion",
            "renovaciones",
        },
    ):
        return "contracts"

    if _has_prefix(tokens, PAYMENT_PREFIXES) or _contains_any(
        normalized_message,
        {
            "pago",
            "pagos",
            "cobro",
            "cobros",
            "cobraron",
            "cobrado",
            "recaudaron",
            "recaudado",
            "cuanto se cobro",
            "factura",
            "facturas",
            "deuda",
            "deudas",
            "morosidad",
            "ticket promedio",
        },
    ):
        return "payments"

    if _has_prefix(tokens, INCIDENT_PREFIXES) or _contains_any(
        normalized_message,
        {
            "incidencia",
            "incidencias",
            "caso",
            "casos",
            "soporte",
            "reclamo",
            "atencion",
            "corte",
            "cortes",
            "caida",
            "caidas",
        },
    ):
        return "incidents"

    if _has_prefix(tokens, ML_PREFIXES) or _contains_any(
        normalized_message,
        {
            "riesgo",
            "churn",
            "retencion",
            "alerta",
            "alertas",
            "segmentacion",
            "segmentos",
            "prediccion",
            "probabilidad de baja",
        },
    ):
        return "ml"

    if _has_prefix(tokens, REPORT_PREFIXES) or _contains_any(
        normalized_message,
        {
            "reporte",
            "reportes",
            "ingresos",
            "facturacion",
            "bajas",
            "historico",
            "comparativo",
            "indicadores",
            "metricas",
        },
    ):
        return "reports"

    if _has_prefix(tokens, OVERVIEW_PREFIXES) or _contains_any(
        normalized_message,
        {"resumen", "dashboard", "general", "kpi", "kpis", "panel"},
    ):
        return "overview"

    if _has_prefix(tokens, SITE_PREFIXES) or _contains_any(
        normalized_message, {"sede", "sedes", "region", "regional", "sucursal"}
    ):
        return "sites"

    if period is not None and _has_prefix(tokens, COUNT_TOKENS | {"baja", "bajas"}):
        return "reports"

    if period is not None and _contains_any(normalized_message, {"este mes", "mes pasado"}):
        return "reports"

    return fallback_domain


def _resolve_history_context(
    db: Session,
    history: list[object] | None,
    current_view: str | None,
) -> ConversationContext:
    context = ConversationContext(domain=_default_domain_for_view(current_view))
    if not history:
        return context

    for item in reversed(history):
        role = _history_value(item, "role")
        if role != "user":
            continue

        text = _history_value(item, "text")
        if not text:
            continue

        normalized_message = _normalize_text(text)
        if not normalized_message:
            continue

        tokens = _tokenize(normalized_message)
        detected_client = _find_client(db, normalized_message)
        period = _parse_period(normalized_message)
        scope = _resolve_scope(db, normalized_message)
        domain = _detect_domain(normalized_message, tokens, detected_client, period)

        if context.client is None and detected_client is not None:
            context.client = detected_client
        if context.period is None and period is not None:
            context.period = period
        if context.domain is None and domain is not None:
            context.domain = domain
        if context.scope is None and _scope_has_filters(scope):
            context.scope = scope

        if (
            context.client is not None
            and context.period is not None
            and context.domain is not None
            and context.scope is not None
        ):
            break

    return context


def _load_sites(db: Session) -> list[models.Site]:
    return db.query(models.Site).order_by(models.Site.name).all()


def _load_clients(db: Session) -> list[models.Client]:
    return (
        db.query(models.Client)
        .options(
            selectinload(models.Client.site),
            selectinload(models.Client.contracts).selectinload(models.Contract.plan),
            selectinload(models.Client.contracts).selectinload(models.Contract.site),
            selectinload(models.Client.contracts).selectinload(models.Contract.payments),
            selectinload(models.Client.incidents).selectinload(models.Incident.site),
        )
        .order_by(models.Client.first_name, models.Client.last_name)
        .all()
    )


def _load_contracts(db: Session) -> list[models.Contract]:
    return (
        db.query(models.Contract)
        .options(
            selectinload(models.Contract.plan),
            selectinload(models.Contract.site),
            selectinload(models.Contract.payments),
        )
        .all()
    )


def _load_incidents(db: Session) -> list[models.Incident]:
    return (
        db.query(models.Incident)
        .options(selectinload(models.Incident.site))
        .all()
    )


def _resolve_scope(db: Session, normalized_message: str) -> Scope:
    sites = _load_sites(db)
    normalized_sites = sorted(
        ((site, _normalize_text(site.name)) for site in sites),
        key=lambda item: len(item[1]),
        reverse=True,
    )

    for site, site_name in normalized_sites:
        if site_name and site_name in normalized_message:
            return Scope(site=site, label=f"la sede {site.name}")

    regions = sorted(
        {site.region for site in sites if site.region},
        key=lambda item: len(_normalize_text(item)),
        reverse=True,
    )
    for region in regions:
        if _normalize_text(region) in normalized_message:
            return Scope(region=region, label=f"la region {region}")

    return Scope()


def _site_ids_for_scope(db: Session, scope: Scope) -> set[int] | None:
    if scope.site is not None:
        return {scope.site.id}

    if scope.region is not None:
        return {
            site.id
            for site in db.query(models.Site).filter(models.Site.region == scope.region).all()
        }

    return None


def _client_matches_scope(client: models.Client, site_ids: set[int] | None) -> bool:
    if site_ids is None:
        return True

    if client.site_id in site_ids:
        return True

    return any(contract.site_id in site_ids for contract in client.contracts)


def _filter_contracts_for_scope(
    contracts: list[models.Contract], site_ids: set[int] | None
) -> list[models.Contract]:
    if site_ids is None:
        return list(contracts)
    return [contract for contract in contracts if contract.site_id in site_ids]


def _filter_incidents_for_scope(
    incidents: list[models.Incident], site_ids: set[int] | None
) -> list[models.Incident]:
    if site_ids is None:
        return list(incidents)
    return [incident for incident in incidents if incident.site_id in site_ids]


def _find_client(db: Session, normalized_message: str) -> models.Client | None:
    dni_match = re.search(r"\b\d{7,15}\b", normalized_message)
    query = (
        db.query(models.Client)
        .options(
            selectinload(models.Client.site),
            selectinload(models.Client.contracts).selectinload(models.Contract.plan),
            selectinload(models.Client.contracts).selectinload(models.Contract.site),
            selectinload(models.Client.contracts).selectinload(models.Contract.payments),
            selectinload(models.Client.incidents).selectinload(models.Incident.site),
        )
    )
    if dni_match:
        found = query.filter(models.Client.dni == dni_match.group(0)).first()
        if found is not None:
            return found

    tokens = [
        token
        for token in normalized_message.split()
        if len(token) >= 3 and token not in STOPWORDS
    ]
    if not tokens:
        return None

    best_match = None
    best_score = 0
    for client in query.all():
        full_name = _normalize_text(f"{client.first_name} {client.last_name}")
        if full_name and full_name in normalized_message:
            return client

        name_parts = set(full_name.split())
        overlap = sum(1 for token in tokens if token in name_parts)
        if overlap >= 2 and overlap > best_score:
            best_match = client
            best_score = overlap

    return best_match


def _infer_year_for_month(month: int, today: date) -> int:
    return today.year if month <= today.month else today.year - 1


def _build_month_period(year: int, month: int) -> Period:
    start = date(year, month, 1)
    return Period(start=start, end=shift_month(start, 1), label=f"{MONTH_NAMES[month]} de {year}")


def _build_year_period(year: int) -> Period:
    start = date(year, 1, 1)
    return Period(start=start, end=date(year + 1, 1, 1), label=f"el anio {year}")


def _build_quarter_period(year: int, quarter: int) -> Period:
    start_month = (quarter - 1) * 3 + 1
    start = date(year, start_month, 1)
    return Period(start=start, end=shift_month(start, 3), label=f"el trimestre {quarter} de {year}")


def _parse_period(normalized_message: str, today: date | None = None) -> Period | None:
    today = today or date.today()
    current_month = date(today.year, today.month, 1)

    month_range_match = re.search(
        rf"\b(?:entre\s+)?({MONTH_PATTERN})(?:\s+de\s+(\d{{4}}))?\s+(?:a|hasta|al|y)\s+({MONTH_PATTERN})(?:\s+de\s+(\d{{4}}))?\b",
        normalized_message,
    )
    if month_range_match:
        start_month = MONTH_ALIASES[month_range_match.group(1)]
        start_year_raw = month_range_match.group(2)
        end_month = MONTH_ALIASES[month_range_match.group(3)]
        end_year_raw = month_range_match.group(4)

        start_year = int(start_year_raw) if start_year_raw else None
        end_year = int(end_year_raw) if end_year_raw else None

        if start_year is not None and end_year is None:
            end_year = start_year if end_month >= start_month else start_year + 1
        elif end_year is not None and start_year is None:
            start_year = end_year if start_month <= end_month else end_year - 1
        elif start_year is None and end_year is None:
            end_year = _infer_year_for_month(end_month, today)
            start_year = end_year if start_month <= end_month else end_year - 1

        start = date(start_year, start_month, 1)
        end_start = date(end_year, end_month, 1)
        return Period(
            start=start,
            end=shift_month(end_start, 1),
            label=(
                f"de {MONTH_NAMES[start_month]} de {start_year} "
                f"a {MONTH_NAMES[end_month]} de {end_year}"
            ),
        )

    quarter_match = re.search(
        r"\b(primer|primero|1er|segundo|2do|tercer|tercero|3er|cuarto|4to)\s+trimestre(?:\s+de\s+(\d{4}))?\b",
        normalized_message,
    )
    if quarter_match:
        quarter = TRIMESTER_ALIASES[quarter_match.group(1)]
        year = int(quarter_match.group(2)) if quarter_match.group(2) else today.year
        return _build_quarter_period(year, quarter)

    months_back_match = re.search(r"\bultim(?:o|os|a|as)\s+(\d+)\s+mes(?:es)?\b", normalized_message)
    if months_back_match:
        months_back = max(1, int(months_back_match.group(1)))
        start = shift_month(current_month, -(months_back - 1))
        return Period(
            start=start,
            end=shift_month(current_month, 1),
            label=f"los ultimos {months_back} meses",
        )

    days_back_match = re.search(r"\bultim(?:o|os|a|as)\s+(\d+)\s+dias?\b", normalized_message)
    if days_back_match:
        days_back = max(1, int(days_back_match.group(1)))
        start = today - timedelta(days=days_back - 1)
        return Period(start=start, end=today + timedelta(days=1), label=f"los ultimos {days_back} dias")

    if "este mes" in normalized_message or "mes actual" in normalized_message:
        return Period(start=current_month, end=shift_month(current_month, 1), label="este mes")

    if (
        "mes pasado" in normalized_message
        or "ultimo mes" in normalized_message
        or "mes anterior" in normalized_message
    ):
        previous_month = shift_month(current_month, -1)
        return Period(start=previous_month, end=current_month, label="el mes pasado")

    if "este ano" in normalized_message or "este anio" in normalized_message:
        return _build_year_period(today.year)

    if "ano pasado" in normalized_message or "anio pasado" in normalized_message:
        return _build_year_period(today.year - 1)

    if "hoy" in normalized_message:
        return Period(start=today, end=today + timedelta(days=1), label="hoy")

    if "ayer" in normalized_message:
        return Period(start=today - timedelta(days=1), end=today, label="ayer")

    month_match = re.search(rf"\b({MONTH_PATTERN})(?:\s+de\s+(\d{{4}}))?\b", normalized_message)
    if month_match:
        month = MONTH_ALIASES[month_match.group(1)]
        year = int(month_match.group(2)) if month_match.group(2) else _infer_year_for_month(month, today)
        return _build_month_period(year, month)

    bare_year_match = re.search(r"\b(20\d{2})\b", normalized_message)
    if bare_year_match and _contains_any(
        normalized_message,
        {"ano", "anio", "gestion", "reporte", "reportes", "pagos", "cobros", "ingresos"},
    ):
        return _build_year_period(int(bare_year_match.group(1)))

    return None


def _is_collection_query(tokens: list[str], normalized_message: str) -> bool:
    return _has_prefix(tokens, COLLECTED_PREFIXES) or _contains_any(
        normalized_message,
        {"cuanto se cobro", "cuanto cobraron", "monto cobrado", "monto recaudado"},
    )


def _is_pending_query(tokens: list[str], normalized_message: str) -> bool:
    return _has_prefix(tokens, PENDING_PREFIXES) or _contains_any(
        normalized_message,
        {"pagos pendientes", "monto pendiente", "monto vencido"},
    )


def _is_registration_query(tokens: list[str], normalized_message: str) -> bool:
    return _has_prefix(tokens, {"registr", "alt", "ingres"}) or _contains_any(
        normalized_message,
        {"clientes nuevos", "nuevos clientes"},
    )


def _answer_overview(db: Session, scope: Scope) -> dict:
    summary = get_dashboard_summary(
        db,
        region=scope.region,
        site_id=scope.site.id if scope.site is not None else None,
    )["summary"]
    return {
        "assistant_name": "Zoe",
        "scope": "overview",
        "message": (
            f"Resumen de {scope.label}: {summary['active_clients']} clientes activos, "
            f"{_format_money(summary['monthly_revenue'])} cobrados en el mes actual, "
            f"{summary['open_complaints']} incidencias abiertas, "
            f"{summary['delinquency_rate']}% de morosidad y "
            f"{summary['satisfaction_rate']}% de satisfaccion."
        ),
        "suggestions": [
            "Cuanto se cobro este mes",
            "Cuantos pagos pendientes hay",
            "Muestra clientes con mayor riesgo",
        ],
    }


def _answer_sites(db: Session, scope: Scope) -> dict:
    sites = _load_sites(db)
    if scope.site is not None:
        site = scope.site
        return {
            "assistant_name": "Zoe",
            "scope": "sites",
            "message": (
                f"La sede {site.name} esta en {site.city}, region {site.region}, "
                f"con estado {site.status}. Direccion registrada: {site.address}."
            ),
            "suggestions": [
                f"Dame un resumen de {site.name}",
                f"Cuanto se cobro en {site.name} este mes",
                f"Cuantas incidencias abiertas hay en {site.name}",
            ],
        }

    if scope.region is not None:
        regional_sites = [site for site in sites if site.region == scope.region]
        names = ", ".join(site.name for site in regional_sites[:5])
        extra = "" if len(regional_sites) <= 5 else f" y {len(regional_sites) - 5} mas"
        return {
            "assistant_name": "Zoe",
            "scope": "sites",
            "message": (
                f"En la region {scope.region} hay {len(regional_sites)} sedes registradas: "
                f"{names}{extra}."
            ),
            "suggestions": [
                f"Dame un resumen de la region {scope.region}",
                f"Cuanto se cobro en la region {scope.region} este mes",
                f"Cuantas incidencias abiertas hay en la region {scope.region}",
            ],
        }

    active_sites = [site for site in sites if site.status == "activo"]
    grouped = {}
    for site in active_sites:
        grouped.setdefault(site.region, 0)
        grouped[site.region] += 1
    region_summary = ", ".join(
        f"{region}: {count}" for region, count in sorted(grouped.items(), key=lambda item: item[0])
    )
    return {
        "assistant_name": "Zoe",
        "scope": "sites",
        "message": (
            f"Actualmente hay {len(active_sites)} sedes activas. Distribucion por region: "
            f"{region_summary}."
        ),
        "suggestions": [
            "Dame un resumen general",
            "Cuanto se cobro este mes",
            "Cuantos clientes activos hay",
        ],
    }


def _answer_clients(
    db: Session,
    scope: Scope,
    client: models.Client | None,
    normalized_message: str,
    period: Period | None,
) -> dict:
    tokens = _tokenize(normalized_message)
    site_ids = _site_ids_for_scope(db, scope)
    clients = _load_clients(db)

    if client is not None:
        relevant_contracts = _filter_contracts_for_scope(client.contracts, site_ids)
        relevant_incidents = _filter_incidents_for_scope(client.incidents, site_ids)
        if site_ids is not None and not relevant_contracts and not relevant_incidents:
            return {
                "assistant_name": "Zoe",
                "scope": "clients",
                "message": (
                    f"No encontre datos de {client.first_name} {client.last_name} dentro de {scope.label}."
                ),
                "suggestions": _help_suggestions("clientes"),
            }

        pending_payments = sum(
            1
            for contract in relevant_contracts
            for payment in contract.payments
            if payment.status in PENDING_PAYMENT_STATUSES
        )
        open_incidents = sum(
            1 for incident in relevant_incidents if incident.status not in CLOSED_INCIDENT_STATUSES
        )
        active_contracts = sum(
            1 for contract in relevant_contracts if contract.status == ACTIVE_CONTRACT_STATUS
        )
        location = client.site.name if client.site is not None else "sin sede asignada"
        return {
            "assistant_name": "Zoe",
            "scope": "clients",
            "message": (
                f"{client.first_name} {client.last_name} figura {client.status}, registrado el "
                f"{_format_date(client.registered_at)}, asociado a {location}. Tiene "
                f"{active_contracts} contratos activos, {pending_payments} pagos pendientes y "
                f"{open_incidents} incidencias abiertas."
            ),
            "suggestions": [
                f"Que pagos tiene {client.first_name} {client.last_name}",
                f"Que contratos tiene {client.first_name} {client.last_name}",
                f"Cual es el riesgo de {client.first_name} {client.last_name}",
            ],
        }

    relevant_clients = [item for item in clients if _client_matches_scope(item, site_ids)]
    if not relevant_clients:
        return {
            "assistant_name": "Zoe",
            "scope": "clients",
            "message": f"No encontre clientes registrados en {scope.label}.",
            "suggestions": _help_suggestions("clientes"),
        }

    if period is not None and _is_registration_query(tokens, normalized_message):
        new_clients = [
            item for item in relevant_clients if period.start <= item.registered_at < period.end
        ]
        sample_names = ", ".join(
            f"{item.first_name} {item.last_name}"
            for item in sorted(new_clients, key=lambda row: row.registered_at, reverse=True)[:3]
        )
        sample_fragment = f" Ultimos registros: {sample_names}." if sample_names else ""
        return {
            "assistant_name": "Zoe",
            "scope": "clients",
            "message": (
                f"En {_format_period(period)}, dentro de {scope.label}, se registraron "
                f"{len(new_clients)} clientes nuevos.{sample_fragment}"
            ),
            "suggestions": [
                "Cuantos contratos iniciaron en ese periodo",
                "Cuanto se cobro en ese periodo",
                "Cuantas incidencias hubo en ese periodo",
            ],
        }

    today = date.today()
    current_month = date(today.year, today.month, 1)
    active_clients = sum(
        1
        for item in relevant_clients
        if any(
            contract.status == ACTIVE_CONTRACT_STATUS
            and (site_ids is None or contract.site_id in site_ids)
            for contract in item.contracts
        )
    )
    new_clients = sum(1 for item in relevant_clients if item.registered_at >= current_month)
    recent_names = ", ".join(
        f"{item.first_name} {item.last_name}"
        for item in sorted(relevant_clients, key=lambda row: row.registered_at, reverse=True)[:3]
    )
    return {
        "assistant_name": "Zoe",
        "scope": "clients",
        "message": (
            f"En {scope.label} hay {len(relevant_clients)} clientes registrados y "
            f"{active_clients} con servicio activo. En el mes ingresaron {new_clients} nuevos. "
            f"Ultimos registros: {recent_names}."
        ),
        "suggestions": [
            "Cuantos contratos activos hay",
            "Cuanto se cobro este mes",
            "Hay clientes con riesgo de baja",
        ],
    }


def _answer_contracts(
    db: Session,
    scope: Scope,
    client: models.Client | None,
    normalized_message: str,
    period: Period | None,
) -> dict:
    site_ids = _site_ids_for_scope(db, scope)

    if client is not None:
        relevant_contracts = _filter_contracts_for_scope(client.contracts, site_ids)
        if not relevant_contracts:
            return {
                "assistant_name": "Zoe",
                "scope": "contracts",
                "message": (
                    f"No encontre contratos de {client.first_name} {client.last_name} en {scope.label}."
                ),
                "suggestions": _help_suggestions("contratos"),
            }

        contract_lines = []
        for contract in sorted(relevant_contracts, key=lambda row: row.start_date, reverse=True)[:3]:
            contract_lines.append(
                f"{contract.plan.name} ({contract.status}, inicio {_format_date(contract.start_date)})"
            )
        return {
            "assistant_name": "Zoe",
            "scope": "contracts",
            "message": (
                f"{client.first_name} {client.last_name} tiene {len(relevant_contracts)} contratos "
                f"registrados en {scope.label}. Ultimos servicios: {', '.join(contract_lines)}."
            ),
            "suggestions": [
                f"Que pagos tiene {client.first_name} {client.last_name}",
                f"Cual es el riesgo de {client.first_name} {client.last_name}",
                "Que planes existen",
            ],
        }

    contracts = _load_contracts(db)
    if site_ids is not None:
        contracts = [contract for contract in contracts if contract.site_id in site_ids]

    if period is not None:
        started = [contract for contract in contracts if period.start <= contract.start_date < period.end]
        ended = [
            contract
            for contract in contracts
            if contract.end_date
            and period.start <= contract.end_date < period.end
            and contract.status in INACTIVE_CONTRACT_STATUSES
        ]
        if _contains_any(normalized_message, {"baja", "bajas", "cancel", "cancelaron", "cancelados"}):
            message = (
                f"En {_format_period(period)}, dentro de {scope.label}, hubo "
                f"{len(ended)} bajas o cancelaciones de contratos."
            )
        elif _contains_any(normalized_message, {"inicio", "iniciaron", "iniciado", "altas", "alta"}):
            message = (
                f"En {_format_period(period)}, dentro de {scope.label}, iniciaron "
                f"{len(started)} contratos."
            )
        else:
            message = (
                f"En {_format_period(period)}, dentro de {scope.label}, iniciaron "
                f"{len(started)} contratos y se cerraron o cancelaron {len(ended)}."
            )
        return {
            "assistant_name": "Zoe",
            "scope": "contracts",
            "message": message,
            "suggestions": [
                "Cuanto se cobro en ese periodo",
                "Cuantos clientes ingresaron en ese periodo",
                "Que planes existen",
            ],
        }

    active_contracts = [contract for contract in contracts if contract.status == ACTIVE_CONTRACT_STATUS]
    inactive_contracts = [
        contract for contract in contracts if contract.status in INACTIVE_CONTRACT_STATUSES
    ]
    plan_counter = {}
    for contract in active_contracts:
        plan_counter.setdefault(contract.plan.name, 0)
        plan_counter[contract.plan.name] += 1
    top_plans = ", ".join(
        f"{name}: {count}"
        for name, count in sorted(plan_counter.items(), key=lambda item: item[1], reverse=True)[:3]
    )
    return {
        "assistant_name": "Zoe",
        "scope": "contracts",
        "message": (
            f"En {scope.label} hay {len(active_contracts)} contratos activos y "
            f"{len(inactive_contracts)} inactivos o cancelados. Los planes mas usados son: "
            f"{top_plans or 'sin contratos activos'}."
        ),
        "suggestions": [
            "Que planes existen",
            "Cuanto se cobro este mes",
            "Cuantos clientes activos hay",
        ],
    }


def _answer_plans(db: Session) -> dict:
    plans = (
        db.query(models.ServicePlan)
        .filter(models.ServicePlan.status == "activo")
        .order_by(models.ServicePlan.monthly_price.desc())
        .all()
    )
    highlighted = ", ".join(
        f"{plan.name} ({plan.speed_mbps} Mbps, {_format_money(plan.monthly_price)})"
        for plan in plans[:4]
    )
    return {
        "assistant_name": "Zoe",
        "scope": "plans",
        "message": f"Hay {len(plans)} planes activos. Algunos destacados son: {highlighted}.",
        "suggestions": [
            "Cuantos contratos activos hay",
            "Cuanto se cobro este mes",
            "Cuantos clientes activos hay",
        ],
    }


def _answer_payments(
    db: Session,
    scope: Scope,
    client: models.Client | None,
    normalized_message: str,
    period: Period | None,
) -> dict:
    tokens = _tokenize(normalized_message)
    site_ids = _site_ids_for_scope(db, scope)
    wants_collection = _is_collection_query(tokens, normalized_message)
    wants_pending = _is_pending_query(tokens, normalized_message)

    if client is not None:
        relevant_contracts = _filter_contracts_for_scope(client.contracts, site_ids)
        payments = [payment for contract in relevant_contracts for payment in contract.payments]
        paid = [payment for payment in payments if payment.status == "pagado"]
        pending = [payment for payment in payments if payment.status in PENDING_PAYMENT_STATUSES]

        if period is not None:
            paid = [
                payment
                for payment in paid
                if payment.paid_date is not None and period.start <= payment.paid_date < period.end
            ]
            pending = [
                payment for payment in pending if period.start <= payment.issued_date < period.end
            ]
            paid_amount = sum(float(payment.amount) for payment in paid)
            pending_amount = sum(float(payment.amount) for payment in pending)
            return {
                "assistant_name": "Zoe",
                "scope": "payments",
                "message": (
                    f"Para {client.first_name} {client.last_name}, en {_format_period(period)}, se cobraron "
                    f"{len(paid)} pagos por {_format_money(paid_amount)} y quedaron "
                    f"{len(pending)} pendientes por {_format_money(pending_amount)}."
                ),
                "suggestions": [
                    f"Que contratos tiene {client.first_name} {client.last_name}",
                    f"Que incidencias tiene {client.first_name} {client.last_name}",
                    f"Cual es el riesgo de {client.first_name} {client.last_name}",
                ],
            }

        pending_amount = sum(float(payment.amount) for payment in pending)
        last_payment = max(
            (payment.paid_date or payment.issued_date for payment in paid),
            default=None,
        )
        return {
            "assistant_name": "Zoe",
            "scope": "payments",
            "message": (
                f"{client.first_name} {client.last_name} tiene {len(pending)} pagos pendientes por "
                f"{_format_money(pending_amount)}. Ultimo pago registrado: {_format_date(last_payment)}."
            ),
            "suggestions": [
                f"Que contratos tiene {client.first_name} {client.last_name}",
                f"Que incidencias tiene {client.first_name} {client.last_name}",
                f"Cual es el riesgo de {client.first_name} {client.last_name}",
            ],
        }

    contracts = _load_contracts(db)
    if site_ids is not None:
        contracts = [contract for contract in contracts if contract.site_id in site_ids]

    payments = [payment for contract in contracts for payment in contract.payments]
    pending = [payment for payment in payments if payment.status in PENDING_PAYMENT_STATUSES]
    overdue = [payment for payment in pending if payment.status == "vencido"]

    if period is not None:
        paid_period = [
            payment
            for payment in payments
            if payment.status == "pagado"
            and payment.paid_date is not None
            and period.start <= payment.paid_date < period.end
        ]
        issued_period = [
            payment for payment in payments if period.start <= payment.issued_date < period.end
        ]
        pending_period = [
            payment for payment in issued_period if payment.status in PENDING_PAYMENT_STATUSES
        ]
        overdue_period = [payment for payment in pending_period if payment.status == "vencido"]

        collected_amount = sum(float(payment.amount) for payment in paid_period)
        pending_amount = sum(float(payment.amount) for payment in pending_period)
        average_ticket = collected_amount / len(paid_period) if paid_period else 0.0

        if wants_pending and not wants_collection:
            message = (
                f"En {_format_period(period)}, dentro de {scope.label}, quedaron "
                f"{len(pending_period)} pagos pendientes por {_format_money(pending_amount)}. "
                f"De ellos, {len(overdue_period)} estan vencidos."
            )
        elif wants_collection and not wants_pending:
            message = (
                f"En {_format_period(period)}, dentro de {scope.label}, se cobraron "
                f"{len(paid_period)} pagos por {_format_money(collected_amount)}. "
                f"El ticket promedio cobrado fue {_format_money(average_ticket)}."
            )
        else:
            message = (
                f"En {_format_period(period)}, dentro de {scope.label}, se cobraron "
                f"{len(paid_period)} pagos por {_format_money(collected_amount)} y quedaron "
                f"{len(pending_period)} pendientes por {_format_money(pending_amount)}."
            )

        return {
            "assistant_name": "Zoe",
            "scope": "payments",
            "message": message,
            "suggestions": [
                "Cuantos clientes ingresaron en ese periodo",
                "Cuantas incidencias hubo en ese periodo",
                "Cuantos contratos iniciaron en ese periodo",
            ],
        }

    today = date.today()
    current_month = date(today.year, today.month, 1)
    collected_this_month = sum(
        float(payment.amount)
        for payment in payments
        if payment.status == "pagado"
        and payment.paid_date is not None
        and payment.paid_date >= current_month
    )
    pending_amount = sum(float(payment.amount) for payment in pending)
    return {
        "assistant_name": "Zoe",
        "scope": "payments",
        "message": (
            f"En {scope.label} hay {len(pending)} pagos pendientes por {_format_money(pending_amount)}. "
            f"De ellos, {len(overdue)} estan vencidos. En el mes actual se cobraron "
            f"{_format_money(collected_this_month)}."
        ),
        "suggestions": [
            "Cuanto cobraron en junio",
            "Cuantos pagos pendientes hay este mes",
            "Cuantos clientes activos hay",
        ],
    }


def _answer_incidents(
    db: Session,
    scope: Scope,
    client: models.Client | None,
    period: Period | None,
) -> dict:
    site_ids = _site_ids_for_scope(db, scope)

    if client is not None:
        relevant_incidents = _filter_incidents_for_scope(client.incidents, site_ids)
        open_incidents = [
            incident for incident in relevant_incidents if incident.status not in CLOSED_INCIDENT_STATUSES
        ]
        if period is not None:
            period_incidents = [
                incident
                for incident in relevant_incidents
                if period.start <= incident.reported_at.date() < period.end
            ]
            return {
                "assistant_name": "Zoe",
                "scope": "incidents",
                "message": (
                    f"{client.first_name} {client.last_name} tuvo {len(period_incidents)} incidencias en "
                    f"{_format_period(period)}. Actualmente mantiene {len(open_incidents)} abiertas."
                ),
                "suggestions": [
                    f"Que pagos tiene {client.first_name} {client.last_name}",
                    f"Cual es el riesgo de {client.first_name} {client.last_name}",
                    f"Que contratos tiene {client.first_name} {client.last_name}",
                ],
            }

        latest_incident = max(
            relevant_incidents,
            key=lambda incident: incident.reported_at,
            default=None,
        )
        latest_detail = (
            f"Ultimo caso: {latest_incident.incident_type} el {latest_incident.reported_at.strftime('%d/%m/%Y %H:%M')}."
            if latest_incident is not None
            else "No tiene casos registrados."
        )
        return {
            "assistant_name": "Zoe",
            "scope": "incidents",
            "message": (
                f"{client.first_name} {client.last_name} tiene {len(open_incidents)} incidencias abiertas. "
                f"{latest_detail}"
            ),
            "suggestions": [
                f"Que pagos tiene {client.first_name} {client.last_name}",
                f"Cual es el riesgo de {client.first_name} {client.last_name}",
                "Cuantas incidencias abiertas hay",
            ],
        }

    incidents = _load_incidents(db)
    if site_ids is not None:
        incidents = [incident for incident in incidents if incident.site_id in site_ids]

    if period is not None:
        reported_period = [
            incident for incident in incidents if period.start <= incident.reported_at.date() < period.end
        ]
        resolved_period = [
            incident
            for incident in incidents
            if incident.resolved_at is not None and period.start <= incident.resolved_at.date() < period.end
        ]
        high_priority = [
            incident for incident in reported_period if incident.priority in {"alta", "critica"}
        ]
        return {
            "assistant_name": "Zoe",
            "scope": "incidents",
            "message": (
                f"En {_format_period(period)}, dentro de {scope.label}, se registraron "
                f"{len(reported_period)} incidencias, durante ese mismo periodo se resolvieron "
                f"{len(resolved_period)} y "
                f"{len(high_priority)} fueron de prioridad alta o critica."
            ),
            "suggestions": [
                "Cuanto se cobro en ese periodo",
                "Cuantos clientes ingresaron en ese periodo",
                "Cuantas bajas hubo en ese periodo",
            ],
        }

    open_incidents = [
        incident for incident in incidents if incident.status not in CLOSED_INCIDENT_STATUSES
    ]
    high_priority = [incident for incident in open_incidents if incident.priority in {"alta", "critica"}]
    summary = get_dashboard_summary(
        db,
        region=scope.region,
        site_id=scope.site.id if scope.site is not None else None,
    )["summary"]
    return {
        "assistant_name": "Zoe",
        "scope": "incidents",
        "message": (
            f"En {scope.label} hay {len(open_incidents)} incidencias abiertas y "
            f"{len(high_priority)} de prioridad alta o critica. El tiempo promedio de resolucion es "
            f"{summary['average_resolution_hours']} horas."
        ),
        "suggestions": [
            "Cuantas incidencias hubo en junio",
            "Cuanto se cobro este mes",
            "Hay clientes con riesgo de baja",
        ],
    }


def _answer_reports(db: Session, scope: Scope, period: Period | None) -> dict:
    report = get_region_report(
        db,
        region=scope.region,
        site_id=scope.site.id if scope.site is not None else None,
        start_date=period.start if period is not None else None,
        end_date=(period.end - timedelta(days=1)) if period is not None else None,
    )

    if period is not None:
        return {
            "assistant_name": "Zoe",
            "scope": "reports",
            "message": (
                f"Reporte de {scope.label} para {_format_period(period)}: ingresos "
                f"{_format_money(report['totals']['revenue'])}, {report['totals']['new_clients']} "
                f"clientes nuevos, {report['totals']['incidents']} incidencias y "
                f"{report['totals']['churn_events']} bajas."
            ),
            "suggestions": [
                "Cuanto se cobro en ese periodo",
                "Cuantas incidencias hubo en ese periodo",
                "Cuantos clientes ingresaron en ese periodo",
            ],
        }

    latest_period = report["series"][-1] if report["series"] else None
    latest_fragment = ""
    if latest_period is not None:
        latest_fragment = (
            f" Ultimo periodo {latest_period['period']}: ingresos {_format_money(latest_period['revenue'])}, "
            f"{latest_period['incidents']} incidencias y {latest_period['churn_events']} bajas."
        )
    return {
        "assistant_name": "Zoe",
        "scope": "reports",
        "message": (
            f"Reporte de {scope.label}: ingresos acumulados {_format_money(report['totals']['revenue'])}, "
            f"{report['totals']['new_clients']} nuevos clientes, {report['totals']['incidents']} incidencias "
            f"y {report['totals']['churn_events']} bajas en el periodo.{latest_fragment}"
        ),
        "suggestions": [
            "Cuanto se cobro este mes",
            "Cuantas bajas hubo este mes",
            "Muestra clientes con mayor riesgo",
        ],
    }


def _answer_ml(
    db: Session,
    normalized_message: str,
    scope: Scope,
    client: models.Client | None,
) -> dict:
    site_name = scope.site.name if scope.site is not None else None

    if client is not None:
        prediction = get_client_churn_prediction(db, client.id)
        if prediction is None:
            return {
                "assistant_name": "Zoe",
                "scope": "ml",
                "message": (
                    f"No hay una prediccion disponible para {client.first_name} {client.last_name}. "
                    "Normalmente ocurre cuando no tiene contratos activos."
                ),
                "suggestions": [
                    f"Que contratos tiene {client.first_name} {client.last_name}",
                    f"Que pagos tiene {client.first_name} {client.last_name}",
                    "Muestra clientes con mayor riesgo",
                ],
            }

        return {
            "assistant_name": "Zoe",
            "scope": "ml",
            "message": (
                f"{prediction['client_name']} tiene riesgo {prediction['risk_level']} de baja con "
                f"{prediction['probability_churn_percentage']}%. Acciones sugeridas: "
                f"{', '.join(prediction['actions_suggested'])}."
            ),
            "suggestions": [
                f"Que pagos tiene {client.first_name} {client.last_name}",
                f"Que incidencias tiene {client.first_name} {client.last_name}",
                "Hay alertas de retencion",
            ],
        }

    if _contains_any(normalized_message, {"segmentacion", "segmento", "segmentos", "grupo", "grupos"}):
        segments = get_segments(db)
        distribution = segments["distribution"]
        if site_name is not None:
            clients = [item for item in segments["clients"] if item["site"] == site_name]
            segment_counter = {}
            for item in clients:
                segment_counter.setdefault(item["segment"], 0)
                segment_counter[item["segment"]] += 1
            top_segments = ", ".join(
                f"{segment}: {count}"
                for segment, count in sorted(
                    segment_counter.items(), key=lambda row: row[1], reverse=True
                )[:3]
            )
            return {
                "assistant_name": "Zoe",
                "scope": "ml",
                "message": (
                    f"En {scope.label}, la segmentacion muestra principalmente: "
                    f"{top_segments or 'sin datos suficientes'}."
                ),
                "suggestions": [
                    "Muestra clientes con mayor riesgo",
                    "Hay alertas de retencion",
                    "Cuanto se cobro este mes",
                ],
            }

        top_segments = ", ".join(
            f"{item['segment']}: {item['clients']}" for item in distribution[:3]
        )
        return {
            "assistant_name": "Zoe",
            "scope": "ml",
            "message": (
                f"La segmentacion actual se concentra en: {top_segments}. "
                f"Indice de separacion del modelo: {segments['silhouette_score']}."
            ),
            "suggestions": [
                "Muestra clientes con mayor riesgo",
                "Hay alertas de retencion",
                "Cuantos clientes activos hay",
            ],
        }

    if _contains_any(normalized_message, {"alerta", "alertas", "retencion"}):
        alerts = get_retention_alerts(db)
        if site_name is not None:
            alerts = [alert for alert in alerts if alert["site"] == site_name]

        if not alerts:
            return {
                "assistant_name": "Zoe",
                "scope": "ml",
                "message": f"No hay alertas de retencion activas en {scope.label}.",
                "suggestions": [
                    "Muestra clientes con mayor riesgo",
                    "Como esta la segmentacion",
                    "Dame un resumen general",
                ],
            }

        top_alerts = "; ".join(
            f"{alert['client_name']} ({alert['risk_level']}, {alert['probability']}%)"
            for alert in alerts[:3]
        )
        return {
            "assistant_name": "Zoe",
            "scope": "ml",
            "message": (
                f"Hay {len(alerts)} alertas de retencion en {scope.label}. Casos destacados: "
                f"{top_alerts}."
            ),
            "suggestions": [
                "Muestra clientes con mayor riesgo",
                "Cuantos pagos pendientes hay",
                "Cuantas incidencias abiertas hay",
            ],
        }

    predictions = get_churn_predictions(db)["predictions"]
    if site_name is not None:
        predictions = [item for item in predictions if item["site"] == site_name]

    high_risk = [item for item in predictions if item["risk_level"] == "alto"]
    medium_risk = [item for item in predictions if item["risk_level"] == "medio"]
    top_cases = "; ".join(
        f"{item['client_name']} ({item['probability_churn_percentage']}%)"
        for item in predictions[:3]
    )
    return {
        "assistant_name": "Zoe",
        "scope": "ml",
        "message": (
            f"En {scope.label} hay {len(high_risk)} clientes con riesgo alto y "
            f"{len(medium_risk)} con riesgo medio. Casos con mayor prioridad: "
            f"{top_cases or 'sin predicciones disponibles'}."
        ),
        "suggestions": [
            "Hay alertas de retencion",
            "Como esta la segmentacion",
            "Cuantos pagos pendientes hay",
        ],
    }


def get_zoe_reply(
    db: Session,
    message: str,
    user: models.User,
    current_view: str | None = None,
    history: list[object] | None = None,
) -> dict:
    clean_message = message.strip()
    normalized_message = _normalize_text(clean_message)
    if not normalized_message:
        return _build_help_message(user, current_view)

    tokens = _tokenize(normalized_message)

    if _contains_any(
        normalized_message,
        {
            "hola",
            "buenas",
            "buen dia",
            "buenos dias",
            "buenas tardes",
            "buenas noches",
        },
    ) and len(tokens) <= 3:
        return _build_help_message(user, current_view)

    if _contains_any(normalized_message, THANKS_PATTERNS) and len(tokens) <= 4:
        return _build_basic_response(
            "smalltalk",
            "Con gusto. Si quieres, seguimos con clientes, contratos, pagos, incidencias o alertas de riesgo.",
            _help_suggestions(current_view),
        )

    if _contains_any(normalized_message, IDENTITY_PATTERNS):
        return _build_basic_response(
            "smalltalk",
            "Soy Zoe, el asistente interno de CableBI para consultas de clientes, contratos, pagos, incidencias, reportes y riesgo.",
            _help_suggestions(current_view),
        )

    if _contains_any(
        normalized_message,
        {"ayuda", "que puedes hacer", "que haces", "como ayudas", "sugerencias"},
    ):
        return _build_help_message(user, current_view)

    history_context = _resolve_history_context(db, history, current_view)
    scope = _resolve_scope(db, normalized_message)
    detected_client = _find_client(db, normalized_message)
    period = _parse_period(normalized_message)
    explicit_domain = _detect_domain(normalized_message, tokens, detected_client, period)
    is_follow_up = _is_follow_up_message(normalized_message, tokens, period)

    resolved_scope = (
        history_context.scope
        if _should_reuse_scope_context(normalized_message, scope, is_follow_up)
        and _scope_has_filters(history_context.scope)
        else scope
    )
    resolved_client = (
        history_context.client
        if history_context.client is not None
        and (
            _should_reuse_client_context(
                normalized_message,
                tokens,
                detected_client,
                explicit_domain,
            )
            or (
                detected_client is None
                and is_follow_up
                and explicit_domain not in {"overview", "sites", "plans"}
            )
        )
        else detected_client
    )
    resolved_period = (
        history_context.period
        if _should_reuse_period_context(
            normalized_message,
            period,
            explicit_domain or history_context.domain,
            is_follow_up,
        )
        and history_context.period is not None
        else period
    )
    if explicit_domain is None and detected_client is not None:
        resolved_domain = "clients"
    else:
        resolved_domain = explicit_domain or (
            history_context.domain
            if is_follow_up or len(tokens) <= 3
            else _default_domain_for_view(current_view)
        )

    if resolved_domain == "plans":
        return _answer_plans(db)

    if resolved_domain == "clients":
        return _answer_clients(db, resolved_scope, resolved_client, normalized_message, resolved_period)

    if resolved_domain == "contracts":
        return _answer_contracts(db, resolved_scope, resolved_client, normalized_message, resolved_period)

    if resolved_domain == "payments":
        return _answer_payments(db, resolved_scope, resolved_client, normalized_message, resolved_period)

    if resolved_domain == "incidents":
        return _answer_incidents(db, resolved_scope, resolved_client, resolved_period)

    if resolved_domain == "ml":
        return _answer_ml(db, normalized_message, resolved_scope, resolved_client)

    if resolved_domain == "reports":
        return _answer_reports(db, resolved_scope, resolved_period)

    if resolved_domain == "overview":
        return _answer_overview(db, resolved_scope)

    if resolved_domain == "sites":
        return _answer_sites(db, resolved_scope)

    if resolved_client is not None:
        return _answer_clients(db, resolved_scope, resolved_client, normalized_message, resolved_period)

    return _build_out_of_scope_message(current_view)
