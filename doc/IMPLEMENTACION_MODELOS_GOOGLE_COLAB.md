# Implementacion de modelos CableBI en Google Colab

Este documento explica como ejecutar los modelos de machine learning de CableBI en Google Colab usando un archivo Excel exportado desde la base de datos.

## 1. Que archivo debes preparar

Debes crear un solo archivo Excel, por ejemplo `cablebi_datos.xlsx`.

Cada hoja del Excel debe llamarse exactamente igual que la tabla:

- `clientes`
- `contratos`
- `planes`
- `pagos`
- `incidencias`
- `sedes`

Las columnas minimas que debe tener cada hoja son estas:

- `clientes`: `id_cliente`, `nombres`, `apellidos`, `tipo_cliente`, `fecha_registro`, `estado`
- `contratos`: `id_contrato`, `id_cliente`, `id_sede`, `id_plan`, `fecha_inicio`, `estado`
- `planes`: `id_plan`, `categoria_comercial`, `velocidad_mbps`, `precio_mensual`, `estado`
- `pagos`: `id_pago`, `id_contrato`, `fecha_emision`, `fecha_pago`, `monto`, `estado`
- `incidencias`: `id_incidencia`, `id_cliente`, `id_contrato`, `id_sede`, `fecha_reporte`, `estado`
- `sedes`: `id_sede`, `nombre_sede`, `estado`

Importante:

- Los nombres de columnas siguen la estructura de `backend/database/cablebi_database.sql`.
- Puedes tener columnas adicionales. El script solo toma las necesarias.
- No necesitas exportar las tablas de insercion analitica como `predicciones_churn` o `cliente_segmentacion`, porque el script las vuelve a calcular.

## 2. Que modelos usa el proyecto

El script replica la logica real del backend:

- Segmentacion de clientes: `K-Means`
- Riesgo de baja: `Random Forest`
- Libreria usada: `scikit-learn`
- Preparacion de datos: `pandas`

Los mismos modelos salen de esta parte del proyecto:

- `backend/app/services/ml.py`

## 3. Script que debes usar

Dentro de esta carpeta ya tienes el archivo:

- `doc/google_colab_modelos_cablebi.py`

Ese script:

- Lee el Excel
- Une clientes, contratos, planes, pagos, incidencias y sedes
- Construye las variables del modelo
- Ejecuta la segmentacion K-Means
- Ejecuta el Random Forest para riesgo de baja
- Genera un Excel final con resultados

## 4. Como ejecutarlo en Google Colab

Abre un notebook nuevo en Google Colab y ejecuta estas celdas.

### Celda 1: instalar librerias

```python
!pip install pandas openpyxl scikit-learn
```

### Celda 2: subir archivos

Sube estos dos archivos a Colab:

- `cablebi_datos.xlsx`
- `google_colab_modelos_cablebi.py`

Puedes hacerlo con esta celda:

```python
from google.colab import files
files.upload()
```

### Celda 3: ejecutar el modelo

```python
!python google_colab_modelos_cablebi.py --excel /content/cablebi_datos.xlsx --output /content/resultados_ml_cablebi.xlsx
```

### Celda 4: descargar resultados

```python
from google.colab import files
files.download("/content/resultados_ml_cablebi.xlsx")
```

## 5. Que resultados obtendras

El archivo `resultados_ml_cablebi.xlsx` tendra estas hojas:

- `segmentos_resumen`: cuantos clientes hay por segmento
- `segmentos_clientes`: lista de clientes con su segmento
- `churn_predicciones`: clientes activos con probabilidad de baja
- `variables_clave`: importancia de variables del Random Forest
- `metricas_modelo`: resumen general del proceso

## 6. Recomendacion de exportacion desde pgAdmin

Cuando exportes la base a Excel:

- Usa una hoja por tabla
- Conserva exactamente los nombres de columnas
- No cambies nombres como `id_cliente`, `fecha_inicio`, `categoria_comercial`, `precio_mensual`
- Si una fecha no existe, dejala vacia

## 7. Resultado alineado con tu proyecto

Esta implementacion mantiene la misma idea del sistema actual:

- Usa la estructura de `cablebi_database.sql`
- Usa las mismas reglas de negocio del backend
- Usa los mismos modelos de machine learning del aplicativo

Si luego quieres, tambien te puedo dejar en `doc` una version en `ipynb` lista para abrir directamente en Google Colab.
