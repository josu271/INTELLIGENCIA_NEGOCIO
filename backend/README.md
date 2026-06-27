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
DB_NAME=CableBI
DB_USER=sulla
DB_PASSWORD=sulla123
```

Si `sulla` no puede crear la base o el esquema, se usa `cablebi_demo.db` como fallback local.
