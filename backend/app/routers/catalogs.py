from __future__ import annotations

from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from app import models, schemas
from app.core.auth import get_current_user
from app.core.database import get_db


router = APIRouter(prefix="/api/v1", tags=["catalogs"])


@router.get("/sedes", response_model=list[schemas.SiteRead])
def list_sites(
    db: Session = Depends(get_db),
    _: models.User = Depends(get_current_user),
) -> list[models.Site]:
    return db.query(models.Site).order_by(models.Site.name).all()


@router.get("/planes", response_model=list[schemas.PlanRead])
def list_plans(
    db: Session = Depends(get_db),
    _: models.User = Depends(get_current_user),
) -> list[models.ServicePlan]:
    return db.query(models.ServicePlan).order_by(models.ServicePlan.monthly_price).all()
