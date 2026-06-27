from __future__ import annotations

from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session, joinedload

from app import models, schemas
from app.core.auth import get_current_user
from app.core.database import get_db


router = APIRouter(prefix="/api/v1/incidencias", tags=["incidencias"])


@router.get("")
def list_incidents(
    db: Session = Depends(get_db),
    _: models.User = Depends(get_current_user),
) -> list[dict]:
    incidents = (
        db.query(models.Incident)
        .options(
            joinedload(models.Incident.client),
            joinedload(models.Incident.site),
            joinedload(models.Incident.contract),
        )
        .order_by(models.Incident.reported_at.desc())
        .all()
    )
    return [
        {
            "id": incident.id,
            "client_id": incident.client_id,
            "client_name": f"{incident.client.first_name} {incident.client.last_name}",
            "contract_id": incident.contract_id,
            "site_id": incident.site_id,
            "site_name": incident.site.name,
            "reported_at": incident.reported_at.isoformat(),
            "resolved_at": incident.resolved_at.isoformat() if incident.resolved_at else None,
            "incident_type": incident.incident_type,
            "description": incident.description,
            "priority": incident.priority,
            "status": incident.status,
        }
        for incident in incidents
    ]


@router.post("", response_model=schemas.IncidentRead)
def create_incident(
    payload: schemas.IncidentCreate,
    db: Session = Depends(get_db),
    _: models.User = Depends(get_current_user),
) -> models.Incident:
    incident = models.Incident(**payload.model_dump())
    db.add(incident)
    db.commit()
    db.refresh(incident)
    return incident


@router.put("/{incident_id}", response_model=schemas.IncidentRead)
def update_incident(
    incident_id: int,
    payload: schemas.IncidentUpdate,
    db: Session = Depends(get_db),
    _: models.User = Depends(get_current_user),
) -> models.Incident:
    incident = db.get(models.Incident, incident_id)
    if incident is None:
        raise HTTPException(status_code=404, detail="Incidencia no encontrada.")
    for key, value in payload.model_dump().items():
        setattr(incident, key, value)
    db.commit()
    db.refresh(incident)
    return incident
