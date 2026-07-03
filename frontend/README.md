# Frontend CableBI

SPA en React para:

- login básico,
- dashboard de KPIs,
- CRUD de clientes, contratos, pagos e incidencias,
- reportes regionales,
- segmentación y churn.

## Ejecutar

```powershell
npm install
npm run dev
```

## Variable de entorno

```env
VITE_API_BASE_URL=
VITE_BACKEND_TARGET=http://localhost:8000
```

## Estructura

- `src/pages/`: pantallas del sistema (`dashboard`, `clientes`, `contratos`, `pagos`, `incidencias`, `reportes`, `ml`).
- `src/api/client.js`: cliente HTTP base para conectar React con FastAPI.
- `src/api/cablebi.js`: endpoints concretos consumidos por el frontend.
- `src/components/ui.jsx`: componentes visuales reutilizables.

## Navegacion

La SPA usa navegacion por hash:

- `#/dashboard`
- `#/clientes`
- `#/contratos`
- `#/pagos`
- `#/incidencias`
- `#/reportes`
- `#/ml`
