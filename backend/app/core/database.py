from __future__ import annotations

from typing import Generator

import psycopg2
from psycopg2 import sql
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
from sqlalchemy import create_engine, text
from sqlalchemy.orm import declarative_base, sessionmaker

from app.core.config import settings


Base = declarative_base()
ACTIVE_DATABASE_URL = settings.database_url
ACTIVE_DATABASE_BACKEND = "postgres"


def _build_engine(database_url: str):
    if database_url.startswith("sqlite"):
        connect_args = {"check_same_thread": False}
    else:
        connect_args = {
            "options": f"-csearch_path={settings.db_schema},public",
        }
    engine = create_engine(
        database_url,
        future=True,
        pool_pre_ping=not database_url.startswith("sqlite"),
        connect_args=connect_args,
    )
    return engine


engine = _build_engine(settings.database_url)
SessionLocal = sessionmaker(bind=engine, autoflush=False, autocommit=False, future=True)


def configure_engine(database_url: str) -> None:
    global engine, ACTIVE_DATABASE_URL, ACTIVE_DATABASE_BACKEND
    engine = _build_engine(database_url)
    SessionLocal.configure(bind=engine)
    ACTIVE_DATABASE_URL = database_url
    ACTIVE_DATABASE_BACKEND = (
        "sqlite" if database_url.startswith("sqlite") else "postgres"
    )


def _credentials_to_try() -> list[tuple[str, str]]:
    credentials = [(settings.db_user, settings.db_password)]
    if settings.db_admin_user and settings.db_admin_password:
        admin_credentials = (settings.db_admin_user, settings.db_admin_password)
        if admin_credentials not in credentials:
            credentials.append(admin_credentials)
    return credentials


def _maintenance_databases() -> list[str]:
    candidates = [settings.db_maintenance_db, "postgres", "template1"]
    unique_candidates = []
    for database_name in candidates:
        if database_name and database_name not in unique_candidates:
            unique_candidates.append(database_name)
    return unique_candidates


def ensure_database_exists() -> None:
    last_error: Exception | None = None

    for username, password in _credentials_to_try():
        connection = None
        for maintenance_db in _maintenance_databases():
            try:
                connection = psycopg2.connect(
                    host=settings.db_host,
                    port=settings.db_port,
                    user=username,
                    password=password,
                    dbname=maintenance_db,
                )
                break
            except (UnicodeDecodeError, psycopg2.Error) as exc:
                last_error = exc
                connection = None

        if connection is None:
            continue

        try:
            connection.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
            with connection.cursor() as cursor:
                cursor.execute(
                    "SELECT 1 FROM pg_database WHERE datname = %s", (settings.db_name,)
                )
                exists = cursor.fetchone() is not None
                if exists:
                    return

                cursor.execute(
                    sql.SQL("CREATE DATABASE {} OWNER {}").format(
                        sql.Identifier(settings.db_name),
                        sql.Identifier(settings.db_user),
                    )
                )
                return
        except psycopg2.Error as exc:
            last_error = exc
        finally:
            connection.close()

    raise RuntimeError(
        "No fue posible verificar o crear la base de datos PostgreSQL configurada."
    ) from last_error


def ensure_schema_exists() -> None:
    if ACTIVE_DATABASE_BACKEND == "sqlite":
        return

    with engine.begin() as connection:
        connection.execute(
            text(f"CREATE SCHEMA IF NOT EXISTS {settings.db_schema}")
        )


def initialize_database() -> str:
    try:
        ensure_database_exists()
        configure_engine(settings.database_url)
        ensure_schema_exists()
    except Exception:
        if not settings.db_fallback_to_sqlite:
            raise
        configure_engine(settings.sqlite_url)
    return ACTIVE_DATABASE_BACKEND


def get_db() -> Generator:
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
