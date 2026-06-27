from __future__ import annotations

from datetime import date, datetime

from pydantic import BaseModel, ConfigDict, Field


class ORMModel(BaseModel):
    model_config = ConfigDict(from_attributes=True)


class LoginRequest(BaseModel):
    username: str
    password: str


class LoginResponse(BaseModel):
    access_token: str
    token_type: str = "bearer"
    username: str
    full_name: str
    role: str


class SiteRead(ORMModel):
    id: int
    name: str
    city: str
    region: str
    province: str | None = None
    address: str
    phone: str | None = None
    is_expansion: bool
    status: str


class PlanRead(ORMModel):
    id: int
    name: str
    service_type: str
    category: str
    speed_mbps: int
    monthly_price: float
    status: str


class ClientCreate(BaseModel):
    site_id: int | None = None
    dni: str
    first_name: str
    last_name: str
    email: str | None = None
    phone: str | None = None
    address: str | None = None
    customer_type: str = "natural"
    status: str = "activo"
    registered_at: date = Field(default_factory=date.today)


class ClientUpdate(BaseModel):
    site_id: int | None = None
    dni: str
    first_name: str
    last_name: str
    email: str | None = None
    phone: str | None = None
    address: str | None = None
    customer_type: str = "natural"
    status: str = "activo"
    registered_at: date = Field(default_factory=date.today)


class ClientRead(ORMModel):
    id: int
    site_id: int | None = None
    dni: str
    first_name: str
    last_name: str
    email: str | None = None
    phone: str | None = None
    address: str | None = None
    customer_type: str
    status: str
    registered_at: date


class ContractCreate(BaseModel):
    client_id: int
    site_id: int
    plan_id: int
    start_date: date
    end_date: date | None = None
    status: str = "activo"
    note: str | None = None


class ContractUpdate(BaseModel):
    client_id: int
    site_id: int
    plan_id: int
    start_date: date
    end_date: date | None = None
    status: str = "activo"
    note: str | None = None


class ContractRead(ORMModel):
    id: int
    client_id: int
    site_id: int
    plan_id: int
    start_date: date
    end_date: date | None = None
    status: str
    note: str | None = None


class PaymentCreate(BaseModel):
    contract_id: int
    issued_date: date = Field(default_factory=date.today)
    paid_date: date | None = None
    amount: float
    payment_method: str | None = "transferencia"
    reference: str | None = None
    status: str = "pendiente"


class PaymentUpdate(BaseModel):
    contract_id: int
    issued_date: date = Field(default_factory=date.today)
    paid_date: date | None = None
    amount: float
    payment_method: str | None = "transferencia"
    reference: str | None = None
    status: str = "pendiente"


class PaymentRead(ORMModel):
    id: int
    contract_id: int
    issued_date: date
    paid_date: date | None = None
    amount: float
    payment_method: str | None = None
    reference: str | None = None
    status: str


class IncidentCreate(BaseModel):
    client_id: int
    contract_id: int
    site_id: int
    reported_at: datetime = Field(default_factory=datetime.utcnow)
    resolved_at: datetime | None = None
    incident_type: str
    description: str
    priority: str = "media"
    status: str = "registrada"


class IncidentUpdate(BaseModel):
    client_id: int
    contract_id: int
    site_id: int
    reported_at: datetime = Field(default_factory=datetime.utcnow)
    resolved_at: datetime | None = None
    incident_type: str
    description: str
    priority: str = "media"
    status: str = "registrada"


class IncidentRead(ORMModel):
    id: int
    client_id: int
    contract_id: int
    site_id: int
    reported_at: datetime
    resolved_at: datetime | None = None
    incident_type: str
    description: str
    priority: str
    status: str


class ChurnPredictionRequest(BaseModel):
    client_id: int
