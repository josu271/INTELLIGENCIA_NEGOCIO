from __future__ import annotations

import os
from dataclasses import dataclass
from pathlib import Path

from dotenv import load_dotenv


BASE_DIR = Path(__file__).resolve().parents[2]
load_dotenv(BASE_DIR / ".env")


@dataclass(slots=True)
class Settings:
    db_host: str = os.getenv("DB_HOST", "localhost")
    db_port: int = int(os.getenv("DB_PORT", "5432"))
    db_name: str = os.getenv("DB_NAME", "CableBI")
    db_schema: str = os.getenv("DB_SCHEMA", "cablebi")
    db_user: str = os.getenv("DB_USER", "postgres")
    db_password: str = os.getenv("DB_PASSWORD", "postgres")
    db_admin_user: str | None = os.getenv("DB_ADMIN_USER")
    db_admin_password: str | None = os.getenv("DB_ADMIN_PASSWORD")
    db_maintenance_db: str = os.getenv("DB_MAINTENANCE_DB", "postgres")
    secret_key: str = os.getenv("SECRET_KEY", "cablebi-dev-secret")
    cors_origins_raw: str = os.getenv(
        "BACKEND_CORS_ORIGINS", "http://localhost:5173"
    )
    db_fallback_to_sqlite: bool = (
        os.getenv("DB_FALLBACK_TO_SQLITE", "true").lower() == "true"
    )

    @property
    def database_url(self) -> str:
        return (
            f"postgresql+psycopg2://{self.db_user}:{self.db_password}"
            f"@{self.db_host}:{self.db_port}/{self.db_name}"
        )

    @property
    def cors_origins(self) -> list[str]:
        return [origin.strip() for origin in self.cors_origins_raw.split(",") if origin]

    @property
    def sqlite_url(self) -> str:
        sqlite_path = BASE_DIR / "cablebi_demo.db"
        return f"sqlite:///{sqlite_path.as_posix()}"


settings = Settings()
