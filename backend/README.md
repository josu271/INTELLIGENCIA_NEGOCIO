# Backend CableBI

API FastAPI para:

- autenticación básica,
- clientes, contratos, pagos e incidencias,
- KPIs gerenciales,
- reportes regionales,
- segmentación K-Means,
- predicción de churn con Random Forest.

## Ejecutar

```powershell
python -m uvicorn app.main:app --reload
```

## Credenciales demo

- Usuario: `admin`
- Contraseña: `admin123`

## PostgreSQL

Variables activas en `.env`:

```env
DB_HOST=localhost
DB_PORT=5432
DB_NAME=cablebi
DB_SCHEMA=cablebi
DB_USER=postgres
DB_PASSWORD=postgres
BACKEND_CORS_ORIGINS=http://localhost:5173,http://127.0.0.1:5173
DB_FALLBACK_TO_SQLITE=true
SQLITE_PATH=backend/cablebi_demo.db
```

Si `sulla` no puede crear la base o el esquema, se usa `cablebi_demo.db` como fallback local.
