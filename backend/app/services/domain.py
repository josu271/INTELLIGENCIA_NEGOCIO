from __future__ import annotations

from sqlalchemy.orm import Session

from app import models


def sync_client_status(db: Session, client_id: int) -> None:
    client = db.get(models.Client, client_id)
    if client is None:
        return

    active_contract = (
        db.query(models.Contract)
        .filter(
            models.Contract.client_id == client_id,
            models.Contract.status == "activo",
        )
        .order_by(models.Contract.start_date.desc())
        .first()
    )
    latest_contract = (
        db.query(models.Contract)
        .filter(models.Contract.client_id == client_id)
        .order_by(models.Contract.start_date.desc())
        .first()
    )

    client.status = "activo" if active_contract is not None else "inactivo"
    if active_contract is not None:
        client.site_id = active_contract.site_id
    elif latest_contract is not None:
        client.site_id = latest_contract.site_id
