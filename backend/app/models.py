from __future__ import annotations

from datetime import date, datetime

from sqlalchemy import (
    Boolean,
    Column,
    Date,
    DateTime,
    ForeignKey,
    Integer,
    JSON,
    Numeric,
    String,
    Text,
)
from sqlalchemy.orm import relationship

from app.core.config import settings
from app.core.database import Base


SCHEMA = settings.db_schema


class Role(Base):
    __tablename__ = "roles"
    __table_args__ = {"schema": SCHEMA}

    id = Column("id_rol", Integer, primary_key=True, index=True)
    name = Column("nombre_rol", String(50), unique=True, nullable=False)
    description = Column("descripcion", Text, nullable=True)

    users = relationship("User", back_populates="role_ref")


class User(Base):
    __tablename__ = "usuarios"
    __table_args__ = {"schema": SCHEMA}

    id = Column("id_usuario", Integer, primary_key=True, index=True)
    role_id = Column(
        "id_rol",
        Integer,
        ForeignKey(f"{SCHEMA}.roles.id_rol"),
        nullable=False,
        index=True,
    )
    first_name = Column("nombres", String(100), nullable=False)
    last_name = Column("apellidos", String(100), nullable=False)
    username = Column("usuario", String(50), unique=True, nullable=False, index=True)
    email = Column(String(100), unique=True, nullable=False)
    password_hash = Column(Text, nullable=False)
    status = Column("estado", String(20), nullable=False, default="activo")
    created_at = Column("fecha_creacion", DateTime, nullable=False, default=datetime.utcnow)

    role_ref = relationship("Role", back_populates="users")
    exported_reports = relationship("ExportedReport", back_populates="user")
    audit_logs = relationship("AuditLog", back_populates="user")

    @property
    def full_name(self) -> str:
        return f"{self.first_name} {self.last_name}".strip()

    @property
    def role(self) -> str:
        return self.role_ref.name if self.role_ref else ""

    @property
    def is_active(self) -> bool:
        return self.status == "activo"


class Site(Base):
    __tablename__ = "sedes"
    __table_args__ = {"schema": SCHEMA}

    id = Column("id_sede", Integer, primary_key=True, index=True)
    name = Column("nombre_sede", String(100), nullable=False)
    city = Column("ciudad", String(100), nullable=False)
    province = Column("provincia", String(100), nullable=True)
    region = Column("region", String(100), nullable=False, index=True)
    address = Column("direccion", String(150), nullable=False)
    phone = Column("telefono", String(20), nullable=True)
    is_expansion = Column("es_expansion", Boolean, nullable=False, default=False)
    status = Column("estado", String(20), nullable=False, default="activo")

    clients = relationship("Client", back_populates="site")
    contracts = relationship("Contract", back_populates="site")
    incidents = relationship("Incident", back_populates="site")


class ServicePlan(Base):
    __tablename__ = "planes"
    __table_args__ = {"schema": SCHEMA}

    id = Column("id_plan", Integer, primary_key=True, index=True)
    name = Column("nombre_plan", String(100), nullable=False)
    service_type = Column("tipo_servicio", String(30), nullable=False)
    category = Column("categoria_comercial", String(30), nullable=False)
    speed_mbps = Column("velocidad_mbps", Integer, nullable=False)
    monthly_price = Column("precio_mensual", Numeric(10, 2), nullable=False)
    status = Column("estado", String(20), nullable=False, default="activo")

    contracts = relationship("Contract", back_populates="plan")


class Client(Base):
    __tablename__ = "clientes"
    __table_args__ = {"schema": SCHEMA}

    id = Column("id_cliente", Integer, primary_key=True, index=True)
    site_id = Column(
        "id_sede",
        Integer,
        ForeignKey(f"{SCHEMA}.sedes.id_sede"),
        nullable=True,
        index=True,
    )
    dni = Column(String(15), unique=True, nullable=False)
    first_name = Column("nombres", String(80), nullable=False)
    last_name = Column("apellidos", String(80), nullable=False)
    phone = Column("telefono", String(20), nullable=True)
    email = Column(String(100), unique=True, nullable=True)
    address = Column("direccion", String(150), nullable=True)
    customer_type = Column("tipo_cliente", String(20), nullable=False, default="natural")
    status = Column("estado", String(20), nullable=False, default="activo")
    registered_at = Column("fecha_registro", Date, nullable=False, default=date.today)

    site = relationship("Site", back_populates="clients")
    contracts = relationship("Contract", back_populates="client")
    incidents = relationship("Incident", back_populates="client")
    surveys = relationship("SatisfactionSurvey", back_populates="client")
    segmentations = relationship("ClientSegmentation", back_populates="client")
    churn_predictions = relationship("ChurnPrediction", back_populates="client")


class Contract(Base):
    __tablename__ = "contratos"
    __table_args__ = {"schema": SCHEMA}

    id = Column("id_contrato", Integer, primary_key=True, index=True)
    client_id = Column(
        "id_cliente",
        Integer,
        ForeignKey(f"{SCHEMA}.clientes.id_cliente"),
        nullable=False,
        index=True,
    )
    site_id = Column(
        "id_sede",
        Integer,
        ForeignKey(f"{SCHEMA}.sedes.id_sede"),
        nullable=False,
        index=True,
    )
    plan_id = Column(
        "id_plan",
        Integer,
        ForeignKey(f"{SCHEMA}.planes.id_plan"),
        nullable=False,
        index=True,
    )
    start_date = Column("fecha_inicio", Date, nullable=False)
    end_date = Column("fecha_fin", Date, nullable=True)
    status = Column("estado", String(20), nullable=False, default="activo")
    note = Column("observacion", Text, nullable=True)

    client = relationship("Client", back_populates="contracts")
    site = relationship("Site", back_populates="contracts")
    plan = relationship("ServicePlan", back_populates="contracts")
    payments = relationship("Payment", back_populates="contract")
    incidents = relationship("Incident", back_populates="contract")
    surveys = relationship("SatisfactionSurvey", back_populates="contract")


class Payment(Base):
    __tablename__ = "pagos"
    __table_args__ = {"schema": SCHEMA}

    id = Column("id_pago", Integer, primary_key=True, index=True)
    contract_id = Column(
        "id_contrato",
        Integer,
        ForeignKey(f"{SCHEMA}.contratos.id_contrato"),
        nullable=False,
        index=True,
    )
    issued_date = Column("fecha_emision", Date, nullable=False)
    paid_date = Column("fecha_pago", Date, nullable=True)
    amount = Column("monto", Numeric(10, 2), nullable=False)
    payment_method = Column("metodo_pago", String(30), nullable=True)
    reference = Column("referencia", String(100), nullable=True)
    status = Column("estado", String(20), nullable=False, default="pendiente")

    contract = relationship("Contract", back_populates="payments")


class Incident(Base):
    __tablename__ = "incidencias"
    __table_args__ = {"schema": SCHEMA}

    id = Column("id_incidencia", Integer, primary_key=True, index=True)
    client_id = Column(
        "id_cliente",
        Integer,
        ForeignKey(f"{SCHEMA}.clientes.id_cliente"),
        nullable=False,
        index=True,
    )
    contract_id = Column(
        "id_contrato",
        Integer,
        ForeignKey(f"{SCHEMA}.contratos.id_contrato"),
        nullable=False,
        index=True,
    )
    site_id = Column(
        "id_sede",
        Integer,
        ForeignKey(f"{SCHEMA}.sedes.id_sede"),
        nullable=False,
        index=True,
    )
    reported_at = Column("fecha_reporte", DateTime, nullable=False)
    incident_type = Column("tipo_incidencia", String(50), nullable=False)
    description = Column("descripcion", Text, nullable=False)
    priority = Column("prioridad", String(20), nullable=False, default="media")
    status = Column("estado", String(20), nullable=False, default="registrada")
    resolved_at = Column("fecha_resolucion", DateTime, nullable=True)

    client = relationship("Client", back_populates="incidents")
    contract = relationship("Contract", back_populates="incidents")
    site = relationship("Site", back_populates="incidents")


class SatisfactionSurvey(Base):
    __tablename__ = "encuestas_satisfaccion"
    __table_args__ = {"schema": SCHEMA}

    id = Column("id_encuesta", Integer, primary_key=True, index=True)
    client_id = Column(
        "id_cliente",
        Integer,
        ForeignKey(f"{SCHEMA}.clientes.id_cliente"),
        nullable=False,
        index=True,
    )
    contract_id = Column(
        "id_contrato",
        Integer,
        ForeignKey(f"{SCHEMA}.contratos.id_contrato"),
        nullable=False,
        index=True,
    )
    surveyed_at = Column("fecha_encuesta", Date, nullable=False, default=date.today)
    score = Column("puntaje", Integer, nullable=False)
    comment = Column("comentario", Text, nullable=True)

    client = relationship("Client", back_populates="surveys")
    contract = relationship("Contract", back_populates="surveys")


class SegmentKMeans(Base):
    __tablename__ = "segmentos_kmeans"
    __table_args__ = {"schema": SCHEMA}

    id = Column("id_segmento", Integer, primary_key=True, index=True)
    cluster = Column("cluster_kmeans", Integer, nullable=False, unique=True)
    name = Column("nombre_segmento", String(80), nullable=False)
    description = Column("descripcion", Text, nullable=True)
    marketing_strategy = Column("estrategia_marketing", Text, nullable=True)

    client_segmentations = relationship("ClientSegmentation", back_populates="segment")


class ClientSegmentation(Base):
    __tablename__ = "cliente_segmentacion"
    __table_args__ = {"schema": SCHEMA}

    id = Column("id_cliente_segmentacion", Integer, primary_key=True, index=True)
    client_id = Column(
        "id_cliente",
        Integer,
        ForeignKey(f"{SCHEMA}.clientes.id_cliente"),
        nullable=False,
        index=True,
    )
    segment_id = Column(
        "id_segmento",
        Integer,
        ForeignKey(f"{SCHEMA}.segmentos_kmeans.id_segmento"),
        nullable=False,
        index=True,
    )
    segmented_at = Column("fecha_segmentacion", DateTime, nullable=False, default=datetime.utcnow)
    algorithm = Column("algoritmo", String(50), nullable=False, default="K-Means")
    note = Column("observacion", Text, nullable=True)

    client = relationship("Client", back_populates="segmentations")
    segment = relationship("SegmentKMeans", back_populates="client_segmentations")


class ChurnPrediction(Base):
    __tablename__ = "predicciones_churn"
    __table_args__ = {"schema": SCHEMA}

    id = Column("id_prediccion", Integer, primary_key=True, index=True)
    client_id = Column(
        "id_cliente",
        Integer,
        ForeignKey(f"{SCHEMA}.clientes.id_cliente"),
        nullable=False,
        index=True,
    )
    predicted_at = Column("fecha_prediccion", DateTime, nullable=False, default=datetime.utcnow)
    probability_churn = Column("probabilidad_churn", Numeric(5, 2), nullable=False)
    risk_level = Column("nivel_riesgo", String(20), nullable=False)
    algorithm = Column("algoritmo", String(50), nullable=False, default="Random Forest")
    recommendation = Column("recomendacion", Text, nullable=True)

    client = relationship("Client", back_populates="churn_predictions")


class ExportedReport(Base):
    __tablename__ = "reportes_exportados"
    __table_args__ = {"schema": SCHEMA}

    id = Column("id_reporte", Integer, primary_key=True, index=True)
    user_id = Column(
        "id_usuario",
        Integer,
        ForeignKey(f"{SCHEMA}.usuarios.id_usuario"),
        nullable=False,
        index=True,
    )
    report_type = Column("tipo_reporte", String(80), nullable=False)
    format = Column("formato", String(20), nullable=False)
    exported_at = Column("fecha_exportacion", DateTime, nullable=False, default=datetime.utcnow)
    filters = Column("filtros", JSON, nullable=True)

    user = relationship("User", back_populates="exported_reports")


class AuditLog(Base):
    __tablename__ = "auditoria"
    __table_args__ = {"schema": SCHEMA}

    id = Column("id_auditoria", Integer, primary_key=True, index=True)
    user_id = Column(
        "id_usuario",
        Integer,
        ForeignKey(f"{SCHEMA}.usuarios.id_usuario"),
        nullable=True,
        index=True,
    )
    table_name = Column("tabla_afectada", String(80), nullable=False)
    action = Column("accion", String(20), nullable=False)
    record_id = Column("registro_id", Integer, nullable=True)
    previous_data = Column("datos_anteriores", JSON, nullable=True)
    new_data = Column("datos_nuevos", JSON, nullable=True)
    acted_at = Column("fecha_accion", DateTime, nullable=False, default=datetime.utcnow)

    user = relationship("User", back_populates="audit_logs")
