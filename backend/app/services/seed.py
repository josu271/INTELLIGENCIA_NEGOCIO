from __future__ import annotations

import random
from datetime import date, datetime, time, timedelta
from decimal import Decimal

from sqlalchemy.orm import Session

from app import models
from app.core.auth import hash_password


FIRST_NAMES = [
    "Carlos",
    "Ana",
    "Luis",
    "Marisol",
    "Jorge",
    "Rosa",
    "Kevin",
    "Paola",
    "Renzo",
    "Diana",
    "Miguel",
    "Fiorella",
    "Bruno",
    "Lucia",
    "Henry",
    "Ximena",
]

LAST_NAMES = [
    "Mendoza",
    "Garcia",
    "Torres",
    "Rojas",
    "Quispe",
    "Chavez",
    "Paredes",
    "Cerna",
    "Vargas",
    "Lopez",
    "Soto",
    "Huaman",
]

SITE_DATA = [
    {
        "name": "San Ramon",
        "city": "San Ramon",
        "region": "Junin",
        "province": "Chanchamayo",
        "address": "Av. Central 245",
        "phone": "064-500101",
        "is_expansion": False,
    },
    {
        "name": "La Merced",
        "city": "La Merced",
        "region": "Junin",
        "province": "Chanchamayo",
        "address": "Jr. Tarma 510",
        "phone": "064-500102",
        "is_expansion": False,
    },
    {
        "name": "Llacta",
        "city": "Llacta",
        "region": "Huanuco",
        "province": "Leoncio Prado",
        "address": "Psje. Comercio 118",
        "phone": "062-400210",
        "is_expansion": False,
    },
    {
        "name": "Pichanaqui",
        "city": "Pichanaqui",
        "region": "Junin",
        "province": "Chanchamayo",
        "address": "Av. Marginal 880",
        "phone": "064-500199",
        "is_expansion": True,
    },
]

PLAN_DATA = [
    {
        "name": "Plan Basico 80",
        "service_type": "internet",
        "category": "basico",
        "speed_mbps": 80,
        "monthly_price": 59.0,
    },
    {
        "name": "Plan Estandar 150",
        "service_type": "combo",
        "category": "estandar",
        "speed_mbps": 150,
        "monthly_price": 75.0,
    },
    {
        "name": "Plan Plus 300",
        "service_type": "combo",
        "category": "plus",
        "speed_mbps": 300,
        "monthly_price": 95.0,
    },
    {
        "name": "Plan Premium 500",
        "service_type": "internet",
        "category": "premium",
        "speed_mbps": 500,
        "monthly_price": 125.0,
    },
    {
        "name": "Plan Empresarial 800",
        "service_type": "internet",
        "category": "empresarial",
        "speed_mbps": 800,
        "monthly_price": 185.0,
    },
    {
        "name": "Plan Corporativo 1400",
        "service_type": "internet",
        "category": "corporativo",
        "speed_mbps": 1400,
        "monthly_price": 260.0,
    },
]


def shift_month(value: date, offset: int) -> date:
    month_index = value.month - 1 + offset
    year = value.year + month_index // 12
    month = month_index % 12 + 1
    return date(year, month, 1)


def seed_database(db: Session) -> None:
    existing_admin = (
        db.query(models.User)
        .filter(models.User.username == "admin")
        .first()
    )
    if existing_admin is not None:
        if existing_admin.password_hash == "hash_password_demo":
            existing_admin.password_hash = hash_password("admin123")
            db.commit()
        return

    if db.query(models.User).first():
        return

    rng = random.Random(42)
    today = date.today()
    current_month = date(today.year, today.month, 1)

    roles = [
        models.Role(name="administrador", description="Acceso total al sistema."),
        models.Role(name="analista", description="Consulta indicadores y reportes."),
        models.Role(name="operador", description="Gestion operativa diaria."),
    ]
    db.add_all(roles)
    db.flush()

    admin = models.User(
        role_id=roles[0].id,
        first_name="Jose Luis",
        last_name="Sulla",
        username="admin",
        email="admin@cablebi.local",
        password_hash=hash_password("admin123"),
        status="activo",
    )
    db.add(admin)

    sites = []
    for site_data in SITE_DATA:
        site = models.Site(status="activo", **site_data)
        db.add(site)
        sites.append(site)

    plans = []
    for plan_data in PLAN_DATA:
        plan = models.ServicePlan(status="activo", **plan_data)
        db.add(plan)
        plans.append(plan)

    db.flush()

    for index in range(72):
        first_name = FIRST_NAMES[index % len(FIRST_NAMES)]
        last_name = LAST_NAMES[(index * 2) % len(LAST_NAMES)]
        customer_type = "juridico" if index % 9 == 0 or index % 14 == 0 else "natural"
        site = rng.choices(sites, weights=[28, 24, 18, 14], k=1)[0]
        registered_at = today - timedelta(days=rng.randint(20, 540))
        client = models.Client(
            site_id=site.id,
            dni=f"{70000000 + index:08d}",
            first_name=first_name,
            last_name=last_name,
            email=f"{first_name.lower()}.{last_name.lower()}{index}@cablebi.pe",
            phone=f"9{rng.randint(10000000, 99999999)}",
            address=f"Calle {index + 1} - Zona {rng.randint(1, 8)}",
            customer_type=customer_type,
            status="activo",
            registered_at=registered_at,
        )
        db.add(client)
        db.flush()

        if customer_type == "juridico":
            plan = rng.choice(plans[-2:])
        elif index % 5 == 0:
            plan = rng.choice(plans[2:5])
        else:
            plan = rng.choice(plans[:4])

        contract_status = "cancelado" if index % 8 == 0 else "activo"
        start_date = registered_at + timedelta(days=rng.randint(0, 18))
        end_date = None
        if contract_status != "activo":
            end_date = start_date + timedelta(days=rng.randint(120, 360))
            if end_date >= today:
                end_date = today - timedelta(days=rng.randint(10, 120))

        contract = models.Contract(
            client_id=client.id,
            site_id=site.id,
            plan_id=plan.id,
            start_date=start_date,
            end_date=end_date,
            status=contract_status,
            note="Contrato semilla generado automaticamente.",
        )
        db.add(contract)
        db.flush()

        if index % 11 == 0:
            legacy_plan = rng.choice(plans[:3])
            legacy_start = start_date - timedelta(days=rng.randint(180, 420))
            legacy_end = legacy_start + timedelta(days=rng.randint(100, 220))
            db.add(
                models.Contract(
                    client_id=client.id,
                    site_id=site.id,
                    plan_id=legacy_plan.id,
                    start_date=legacy_start,
                    end_date=legacy_end,
                    status="inactivo",
                    note="Contrato historico de referencia.",
                )
            )

        billing_start = max(date(start_date.year, start_date.month, 1), shift_month(today, -7))
        billing_end = date((end_date or today).year, (end_date or today).month, 1)
        cycle = billing_start
        while cycle <= billing_end:
            is_pending = False
            if cycle == billing_end and contract_status != "activo":
                is_pending = rng.random() < 0.65
            elif cycle >= shift_month(today, -1):
                is_pending = rng.random() < (0.28 if index % 6 == 0 else 0.12)
            elif index % 13 == 0:
                is_pending = rng.random() < 0.25

            paid_date = None
            payment_status = "pendiente" if is_pending else "pagado"
            if not is_pending:
                paid_date = cycle + timedelta(days=rng.randint(0, 10))
            elif cycle < current_month:
                payment_status = "vencido"

            db.add(
                models.Payment(
                    contract_id=contract.id,
                    issued_date=cycle,
                    paid_date=paid_date,
                    amount=Decimal(str(plan.monthly_price)),
                    payment_method=rng.choice(
                        ["transferencia", "yape", "efectivo", "deposito", "plin"]
                    ),
                    reference=f"TXN-{client.id:04d}-{cycle.strftime('%Y%m')}",
                    status=payment_status,
                )
            )
            cycle = shift_month(cycle, 1)

        incident_count = rng.choices([0, 1, 2, 3], weights=[30, 36, 22, 12], k=1)[0]
        if contract_status != "activo":
            incident_count = max(incident_count, 1)

        for incident_index in range(incident_count):
            reported_date = today - timedelta(days=rng.randint(1, 180))
            reported_at = datetime.combine(
                reported_date,
                time(hour=rng.randint(8, 19), minute=rng.choice([0, 10, 20, 30, 40])),
            )
            unresolved = rng.random() < (
                0.35 if incident_index == 0 and index % 6 == 0 else 0.18
            )
            resolved_at = None
            incident_status = rng.choice(["registrada", "en_proceso"]) if unresolved else "resuelta"
            survey_score = None
            if not unresolved:
                resolved_at = reported_at + timedelta(hours=rng.randint(5, 58))
                base_score = 5 - (1 if contract_status != "activo" else 0)
                survey_score = max(2, min(5, base_score - rng.randint(0, 2)))

            db.add(
                models.Incident(
                    client_id=client.id,
                    contract_id=contract.id,
                    site_id=site.id,
                    reported_at=reported_at,
                    resolved_at=resolved_at,
                    incident_type=rng.choice(
                        [
                            "Caida de senal",
                            "Facturacion",
                            "Velocidad lenta",
                            "Visita tecnica",
                        ]
                    ),
                    description=f"Incidencia #{incident_index + 1} del cliente {client.id}",
                    priority=rng.choice(["baja", "media", "alta", "critica"]),
                    status=incident_status,
                )
            )

            if survey_score is not None and resolved_at is not None:
                db.add(
                    models.SatisfactionSurvey(
                        client_id=client.id,
                        contract_id=contract.id,
                        surveyed_at=min(today, resolved_at.date() + timedelta(days=2)),
                        score=survey_score,
                        comment="Seguimiento semilla de satisfaccion.",
                    )
                )

        if contract_status != "activo":
            client.status = "inactivo"

    db.commit()
