from __future__ import annotations

from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from app import models, schemas
from app.core.auth import get_current_user
from app.core.database import get_db
from app.services.assistant import get_zoe_reply


router = APIRouter(prefix="/api/v1/asistente", tags=["assistant"])


@router.post("/zoe/chat", response_model=schemas.AssistantChatResponse)
def chat_with_zoe(
    payload: schemas.AssistantChatRequest,
    db: Session = Depends(get_db),
    user: models.User = Depends(get_current_user),
) -> dict:
    return get_zoe_reply(
        db,
        message=payload.message,
        user=user,
        current_view=payload.view,
        history=payload.history,
    )
