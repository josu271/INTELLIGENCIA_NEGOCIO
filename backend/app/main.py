from __future__ import annotations

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.core.config import settings
from app.core import database
from app.routers import analytics, auth, catalogs, clients, contracts, incidents, payments
from app.services.seed import seed_database


app = FastAPI(
    title="CableBI API",
    version="1.0.0",
    description=(
        "Backend FastAPI para el sistema de inteligencia de negocios y "
        "análisis predictivo CableBI."
    ),
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.cors_origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.on_event("startup")
def startup() -> None:
    database.initialize_database()
    database.Base.metadata.create_all(bind=database.engine)
    db = database.SessionLocal()
    try:
        seed_database(db)
    finally:
        db.close()


@app.get("/")
def health() -> dict:
    return {
        "name": "CableBI API",
        "status": "ok",
        "database_backend": database.ACTIVE_DATABASE_BACKEND,
        "docs": "/docs",
        "default_user": "admin",
        "default_password": "admin123",
    }


app.include_router(auth.router)
app.include_router(catalogs.router)
app.include_router(clients.router)
app.include_router(contracts.router)
app.include_router(payments.router)
app.include_router(incidents.router)
app.include_router(analytics.router)
