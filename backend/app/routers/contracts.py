from __future__ import annotations

from datetime import date

from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session, joinedload

from app import models, schemas
from app.core.auth import get_current_user
from app.core.database import get_db
from app.services.domain import sync_client_status


router = APIRouter(prefix="/api/v1/contratos", tags=["contratos"])


@router.get("")
def list_contracts(
    db: Session = Depends(get_db),
    _: models.User = Depends(get_current_user),
) -> list[dict]:
    contracts = (
        db.query(models.Contract)
        .options(
            joinedload(models.Contract.client),
            joinedload(models.Contract.plan),
            joinedload(models.Contract.site),
        )
        .order_by(models.Contract.start_date.desc())
        .all()
    )
    return [
        {
            "id": contract.id,
            "client_id": contract.client_id,
            "client_name": f"{contract.client.first_name} {contract.client.last_name}",
            "site_id": contract.site_id,
            "site_name": contract.site.name,
            "plan_id": contract.plan_id,
            "plan_name": contract.plan.name,
            "monthly_price": float(contract.plan.monthly_price),
            "speed_mbps": contract.plan.speed_mbps,
            "start_date": contract.start_date.isoformat(),
            "end_date": contract.end_date.isoformat() if contract.end_date else None,
            "status": contract.status,
            "note": contract.note,
        }
        for contract in contracts
    ]


@router.post("", response_model=schemas.ContractRead)
def create_contract(
    payload: schemas.ContractCreate,
    db: Session = Depends(get_db),
    _: models.User = Depends(get_current_user),
) -> models.Contract:
    contract = models.Contract(**payload.model_dump())
    db.add(contract)
    db.flush()
    sync_client_status(db, contract.client_id)
    db.commit()
    db.refresh(contract)
    return contract


@router.put("/{contract_id}", response_model=schemas.ContractRead)
def update_contract(
    contract_id: int,
    payload: schemas.ContractUpdate,
    db: Session = Depends(get_db),
    _: models.User = Depends(get_current_user),
) -> models.Contract:
    contract = db.get(models.Contract, contract_id)
    if contract is None:
        raise HTTPException(status_code=404, detail="Contrato no encontrado.")
    previous_client_id = contract.client_id
    for key, value in payload.model_dump().items():
        setattr(contract, key, value)
    db.flush()
    sync_client_status(db, previous_client_id)
    if contract.client_id != previous_client_id:
        sync_client_status(db, contract.client_id)
    db.commit()
    db.refresh(contract)
    return contract


@router.delete("/{contract_id}")
def cancel_contract(
    contract_id: int,
    db: Session = Depends(get_db),
    _: models.User = Depends(get_current_user),
) -> dict:
    contract = db.get(models.Contract, contract_id)
    if contract is None:
        raise HTTPException(status_code=404, detail="Contrato no encontrado.")
    contract.status = "cancelado"
    contract.end_date = date.today()
    db.flush()
    sync_client_status(db, contract.client_id)
    db.commit()
    return {"message": "Contrato cancelado correctamente."}
