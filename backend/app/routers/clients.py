from __future__ import annotations

from datetime import date

from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import or_
from sqlalchemy.orm import Session, selectinload

from app import models, schemas
from app.core.auth import get_current_user
from app.core.database import get_db
from app.services.domain import sync_client_status


router = APIRouter(prefix="/api/v1/clientes", tags=["clientes"])


def _serialize_client(client: models.Client) -> dict:
    latest_contract = (
        max(client.contracts, key=lambda item: item.start_date) if client.contracts else None
    )
    resolved_site = client.site or (latest_contract.site if latest_contract else None)
    return {
        "id": client.id,
        "site_id": client.site_id,
        "dni": client.dni,
        "first_name": client.first_name,
        "last_name": client.last_name,
        "full_name": f"{client.first_name} {client.last_name}",
        "email": client.email,
        "phone": client.phone,
        "address": client.address,
        "customer_type": client.customer_type,
        "status": client.status,
        "registered_at": client.registered_at.isoformat(),
        "active_contracts": sum(1 for contract in client.contracts if contract.status == "activo"),
        "site_name": resolved_site.name if resolved_site else None,
        "plan_name": latest_contract.plan.name if latest_contract else None,
    }


@router.get("")
def list_clients(
    search: str | None = None,
    status: str | None = None,
    db: Session = Depends(get_db),
    _: models.User = Depends(get_current_user),
) -> list[dict]:
    query = db.query(models.Client).options(
        selectinload(models.Client.site),
        selectinload(models.Client.contracts).selectinload(models.Contract.site),
        selectinload(models.Client.contracts).selectinload(models.Contract.plan),
    )
    if search:
        like = f"%{search}%"
        query = query.filter(
            or_(
                models.Client.first_name.ilike(like),
                models.Client.last_name.ilike(like),
                models.Client.dni.ilike(like),
                models.Client.email.ilike(like),
            )
        )
    if status:
        query = query.filter(models.Client.status == status)
    clients = query.order_by(models.Client.registered_at.desc()).all()
    return [_serialize_client(client) for client in clients]


@router.post("", response_model=schemas.ClientRead)
def create_client(
    payload: schemas.ClientCreate,
    db: Session = Depends(get_db),
    _: models.User = Depends(get_current_user),
) -> models.Client:
    client = models.Client(**payload.model_dump())
    db.add(client)
    db.commit()
    db.refresh(client)
    return client


@router.put("/{client_id}", response_model=schemas.ClientRead)
def update_client(
    client_id: int,
    payload: schemas.ClientUpdate,
    db: Session = Depends(get_db),
    _: models.User = Depends(get_current_user),
) -> models.Client:
    client = db.get(models.Client, client_id)
    if client is None:
        raise HTTPException(status_code=404, detail="Cliente no encontrado.")
    for key, value in payload.model_dump().items():
        setattr(client, key, value)
    db.commit()
    db.refresh(client)
    return client


@router.delete("/{client_id}")
def deactivate_client(
    client_id: int,
    db: Session = Depends(get_db),
    _: models.User = Depends(get_current_user),
) -> dict:
    client = db.get(models.Client, client_id)
    if client is None:
        raise HTTPException(status_code=404, detail="Cliente no encontrado.")

    for contract in client.contracts:
        if contract.status == "activo":
            contract.status = "inactivo"
            contract.end_date = contract.end_date or date.today()

    client.status = "inactivo"
    sync_client_status(db, client.id)
    db.commit()
    return {"message": "Cliente marcado como inactivo."}
