# CableBI

Implementación base del sistema descrito en `doc/` para Cable e Internet Cañari.

## Qué se construyó

- `frontend/`: SPA en React con login, dashboard, CRUD, reportes y módulo ML.
- `backend/`: API FastAPI con modelos operacionales, KPIs, segmentación y churn.
- `doc/`: documentación fuente original del proyecto.

## Contexto funcional sintetizado

- Gestión de clientes, contratos, pagos e incidencias.
- Dashboard gerencial con crecimiento, churn, satisfacción, morosidad e ingresos.
- Reportes regionales exportables.
- Segmentación de clientes con K-Means.
- Predicción de churn con Random Forest.

## Arranque rápido

### Backend

```powershell
cd backend
python -m uvicorn app.main:app --reload
```

### Frontend

```powershell
cd frontend
npm install
npm run dev
```

## Acceso demo

- Usuario: `admin`
- Contraseña: `admin123`

## Nota sobre PostgreSQL

El backend intenta usar PostgreSQL con:

- `DB_HOST=localhost`
- `DB_PORT=5432`
- `DB_NAME=CableBI`
- `DB_USER=sulla`
- `DB_PASSWORD=sulla123`

Si ese usuario no tiene permisos para crear la base o las tablas, el backend activa un fallback SQLite local para no bloquear el desarrollo. Para dejarlo 100% en PostgreSQL, usa el script `backend/init_postgres.sql` con un usuario administrador.
