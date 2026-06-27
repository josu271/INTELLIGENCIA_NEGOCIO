from __future__ import annotations

from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session, joinedload

from app import models, schemas
from app.core.auth import get_current_user
from app.core.database import get_db


router = APIRouter(prefix="/api/v1/pagos", tags=["pagos"])


@router.get("")
def list_payments(
    db: Session = Depends(get_db),
    _: models.User = Depends(get_current_user),
) -> list[dict]:
    payments = (
        db.query(models.Payment)
        .options(
            joinedload(models.Payment.contract).joinedload(models.Contract.client),
            joinedload(models.Payment.contract).joinedload(models.Contract.site),
        )
        .order_by(models.Payment.issued_date.desc())
        .all()
    )
    return [
        {
            "id": payment.id,
            "contract_id": payment.contract_id,
            "client_name": (
                f"{payment.contract.client.first_name} {payment.contract.client.last_name}"
            ),
            "site_name": payment.contract.site.name,
            "issued_date": payment.issued_date.isoformat(),
            "paid_date": payment.paid_date.isoformat() if payment.paid_date else None,
            "amount": float(payment.amount),
            "payment_method": payment.payment_method,
            "reference": payment.reference,
            "status": payment.status,
        }
        for payment in payments
    ]


@router.post("", response_model=schemas.PaymentRead)
def create_payment(
    payload: schemas.PaymentCreate,
    db: Session = Depends(get_db),
    _: models.User = Depends(get_current_user),
) -> models.Payment:
    payment = models.Payment(**payload.model_dump())
    db.add(payment)
    db.commit()
    db.refresh(payment)
    return payment


@router.put("/{payment_id}", response_model=schemas.PaymentRead)
def update_payment(
    payment_id: int,
    payload: schemas.PaymentUpdate,
    db: Session = Depends(get_db),
    _: models.User = Depends(get_current_user),
) -> models.Payment:
    payment = db.get(models.Payment, payment_id)
    if payment is None:
        raise HTTPException(status_code=404, detail="Pago no encontrado.")
    for key, value in payload.model_dump().items():
        setattr(payment, key, value)
    db.commit()
    db.refresh(payment)
    return payment
