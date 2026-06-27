from __future__ import annotations

from datetime import date

from fastapi import APIRouter, Depends, HTTPException, Query
from fastapi.responses import PlainTextResponse
from sqlalchemy.orm import Session

from app import models, schemas
from app.core.auth import get_current_user
from app.core.database import get_db
from app.services.analytics import (
    export_region_report_csv,
    get_dashboard_summary,
    get_region_report,
    get_retention_alerts,
    get_site_kpis,
)
from app.services.ml import (
    get_churn_predictions,
    get_client_churn_prediction,
    get_segments,
)


router = APIRouter(prefix="/api/v1", tags=["analytics"])


@router.get("/dashboard/resumen")
def dashboard_summary(
    region: str | None = None,
    site_id: int | None = None,
    db: Session = Depends(get_db),
    _: models.User = Depends(get_current_user),
) -> dict:
    return get_dashboard_summary(db, region=region, site_id=site_id)


@router.get("/kpis/sedes")
def site_kpis(
    region: str | None = None,
    db: Session = Depends(get_db),
    _: models.User = Depends(get_current_user),
) -> list[dict]:
    return get_site_kpis(db, region=region)


@router.get("/reportes/regional")
def region_report(
    region: str | None = None,
    start_date: date | None = Query(default=None),
    end_date: date | None = Query(default=None),
    db: Session = Depends(get_db),
    _: models.User = Depends(get_current_user),
) -> dict:
    return get_region_report(db, region=region, start_date=start_date, end_date=end_date)


@router.get("/reportes/regional/export", response_class=PlainTextResponse)
def export_region_report(
    region: str | None = None,
    start_date: date | None = Query(default=None),
    end_date: date | None = Query(default=None),
    db: Session = Depends(get_db),
    _: models.User = Depends(get_current_user),
) -> str:
    report = get_region_report(db, region=region, start_date=start_date, end_date=end_date)
    return export_region_report_csv(report)


@router.get("/alertas/retencion")
def retention_alerts(
    db: Session = Depends(get_db),
    _: models.User = Depends(get_current_user),
) -> list[dict]:
    return get_retention_alerts(db)


@router.get("/ml/segmentacion")
def segmentation(
    db: Session = Depends(get_db),
    _: models.User = Depends(get_current_user),
) -> dict:
    return get_segments(db)


@router.get("/ml/riesgo-clientes")
def churn_predictions(
    db: Session = Depends(get_db),
    _: models.User = Depends(get_current_user),
) -> dict:
    return get_churn_predictions(db)


@router.post("/ml/prediccion-churn")
def predict_client_churn(
    payload: schemas.ChurnPredictionRequest,
    db: Session = Depends(get_db),
    _: models.User = Depends(get_current_user),
) -> dict:
    prediction = get_client_churn_prediction(db, payload.client_id)
    if prediction is None:
        client = db.get(models.Client, payload.client_id)
        if client is None:
            raise HTTPException(
                status_code=404,
                detail="Cliente no encontrado para predicción.",
            )
        raise HTTPException(
            status_code=409,
            detail="Solo se puede predecir churn para clientes con contratos activos.",
        )
    return prediction
