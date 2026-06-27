from __future__ import annotations

import base64
import hashlib
import hmac
import time

from fastapi import Depends, HTTPException, status
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer
from sqlalchemy.orm import Session

from app import models
from app.core.config import settings
from app.core.database import get_db


TOKEN_MAX_AGE_SECONDS = 60 * 60 * 12
security = HTTPBearer(auto_error=False)


def hash_password(password: str) -> str:
    salted = f"{settings.secret_key}:{password}".encode("utf-8")
    return hashlib.sha256(salted).hexdigest()


def verify_password(password: str, password_hash: str) -> bool:
    return hash_password(password) == password_hash


def _sign_token(payload: str) -> str:
    return hmac.new(
        settings.secret_key.encode("utf-8"),
        payload.encode("utf-8"),
        hashlib.sha256,
    ).hexdigest()


def issue_token(user_id: int) -> str:
    issued_at = int(time.time())
    payload = f"{user_id}:{issued_at}"
    signature = _sign_token(payload)
    raw_token = f"{payload}:{signature}".encode("utf-8")
    return base64.urlsafe_b64encode(raw_token).decode("utf-8").rstrip("=")


def _decode_token(token: str) -> int | None:
    padding = "=" * (-len(token) % 4)
    try:
        decoded = base64.urlsafe_b64decode(f"{token}{padding}".encode("utf-8")).decode(
            "utf-8"
        )
        user_id_raw, issued_at_raw, signature = decoded.split(":", 2)
        payload = f"{user_id_raw}:{issued_at_raw}"
        expected_signature = _sign_token(payload)
        issued_at = int(issued_at_raw)
        user_id = int(user_id_raw)
    except (ValueError, UnicodeDecodeError):
        return None

    if not hmac.compare_digest(signature, expected_signature):
        return None

    if time.time() - issued_at > TOKEN_MAX_AGE_SECONDS:
        return None

    return user_id


def get_current_user(
    credentials: HTTPAuthorizationCredentials | None = Depends(security),
    db: Session = Depends(get_db),
) -> models.User:
    if credentials is None:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Se requiere autenticacion.",
        )

    user_id = _decode_token(credentials.credentials)
    if user_id is None:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Token invalido o expirado.",
        )

    user = db.get(models.User, user_id)
    if user is None or not user.is_active:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Usuario no autorizado.",
        )
    return user
