**Universidad Continental**

*Aplicación de Inteligencia de Negocios*

*Caso: Cable e Internet Cañari*

**ENTREGABLE — BI + MACHINE LEARNING**

**Responsable: ORTIZ GIL, Breitner Jyuurio**

Asignatura: Inteligencia de Negocio

Huancayo – Perú | 2026


# **1. DICCIONARIO DE KPIs**

El proyecto CableBI define un conjunto de indicadores clave (KPIs) orientados a medir el desempeño comercial, operativo y de satisfacción de Cable e Internet Cañari. Se presentan los 4 KPIs principales del Dashboard Gerencial y 6 KPIs adicionales complementarios.

## **1.1 KPIs Principales (Dashboard Gerencial)**

Los siguientes KPIs provienen directamente del Dashboard Gerencial del proyecto y representan los indicadores estratégicos de primer nivel:

|**KPI**|**Fórmula**|**Fuente de Datos**|**Frecuencia**|**Responsable**|**Meta / Umbral**|
| :-: | :-: | :-: | :-: | :-: | :-: |
|**KPI 1: Tasa de Crecimiento de Clientes**|(Nuevos Clientes / Clientes del Período Anterior) × 100|Tabla FACT\_CONTRATO + DIM\_CLIENTE | Base de datos operativa|Mensual|Área Comercial / Gerencia|≥ 10% mensual en sedes activas; ≥ 15% en Pichanaqui (primeros 6 meses)|
|**KPI 2: Tasa de Cancelación (Churn Rate)**|(Clientes que Cancelan / Clientes Activos) × 100|Tabla FACT\_CONTRATO con estado = 'Inactivo' + DIM\_CLIENTE|Mensual|Área Comercial / Soporte|≤ 5% mensual; alerta si supera 8%|
|**KPI 3: Nivel de Satisfacción del Cliente**|(Clientes Satisfechos / Encuestas Realizadas) × 100|Tabla QUEJA (cuando esté activa) + registros de encuestas de satisfacción|Mensual / Trimestral|Área de Atención al Cliente|≥ 85% de satisfacción; meta ideal ≥ 90%|
|**KPI 4: Tiempo Promedio de Resolución**|Tiempo Total de Resolución / Total de Incidencias|Tabla QUEJA: fecha de registro y fecha de cierre de incidencia|Semanal / Mensual|Soporte Técnico / Atención al Cliente|≤ 24 horas para incidencias técnicas; ≤ 48 horas para reclamos administrativos|

## **1.2 KPIs Adicionales (Complementarios)**

Los siguientes indicadores complementan el análisis de rentabilidad, morosidad y expansión comercial:

|**KPI**|**Fórmula**|**Fuente de Datos**|**Frecuencia**|**Responsable**|**Meta / Umbral**|
| :-: | :-: | :-: | :-: | :-: | :-: |
|**KPI 5: Ticket Promedio Mensual**|Ventas Totales del Período / Número de Clientes Activos|FACT\_PAGO (monto) + DIM\_CLIENTE (estado activo)|Mensual|Área Comercial|≥ S/ 75 (promedio actual); meta S/ 90 en Pichanaqui|
|**KPI 6: Tasa de Morosidad**|(Pagos Pendientes / Total de Pagos Emitidos) × 100|FACT\_PAGO con estado = 'Pendiente' vs. total de pagos|Mensual|Área de Cobranza / Administración|≤ 2%; alerta si supera 5%|
|**KPI 7: Penetración de Planes Premium/Empresarial**|(Contratos Empresarial + Corporativo / Total Contratos) × 100|FACT\_CONTRATO + DIM\_PLAN (categoría comercial)|Trimestral|Área Comercial / Gerencia|≥ 15% del total de contratos|
|**KPI 8: Crecimiento de Ventas por Sede**|((Ventas Mes Actual − Ventas Mes Anterior) / Ventas Mes Anterior) × 100|FACT\_PAGO agrupado por DIM\_SEDE y DIM\_TIEMPO|Mensual|Gerencia Regional / Comercial|≥ 8% mensual por sede; ≥ 20% para Pichanaqui (fase de lanzamiento)|
|**KPI 9: Tasa de Conversión de Prospectos**|(Prospectos Convertidos a Clientes / Total Prospectos) × 100|Registro de prospectos (a implementar) + DIM\_CLIENTE|Mensual|Área Comercial / Marketing|≥ 30% de conversión en campañas de lanzamiento|
|**KPI 10: Ingresos por Segmento**|Suma de MONTO\_PAGO agrupado por categoría de plan (K-Means cluster)|FACT\_PAGO + DIM\_PLAN + resultado del modelo K-Means|Mensual / Trimestral|BI / Gerencia Comercial|Residencial ≥ S/ 9,000; Empresarial ≥ S/ 5,000 mensual|


# **2. MODELO DIMENSIONAL**

El modelo dimensional de CableBI sigue un esquema estrella (Star Schema), organizado alrededor de dos tablas de hechos centrales que registran las transacciones del negocio, rodeadas de tablas de dimensión que proveen contexto de análisis.

## **2.1 Tablas de Hechos**

**FACT\_CONTRATO — Hechos de Contratación**

|**Campo**|**Tipo**|**Relación**|**Descripción**|
| :-: | :-: | :-: | :-: |
|Id\_Contrato|INTEGER|PK|Identificador único del contrato|
|Id\_Cliente|INTEGER|FK → DIM\_CLIENTE|Cliente que suscribe el contrato|
|Id\_Plan|INTEGER|FK → DIM\_PLAN|Plan contratado|
|Id\_Sede|INTEGER|FK → DIM\_SEDE|Sede donde se registra el contrato|
|Id\_Tiempo|INTEGER|FK → DIM\_TIEMPO|Fecha de inicio del contrato|
|Estado\_Contrato|VARCHAR(20)|—|Activo / Inactivo|
|Fecha\_Fin|DATE|—|Fecha de cancelación (si aplica)|

**FACT\_PAGO — Hechos de Facturación y Cobranza**

|**Campo**|**Tipo**|**Relación**|**Descripción**|
| :-: | :-: | :-: | :-: |
|Id\_Pago|INTEGER|PK|Identificador único del pago|
|Id\_Contrato|INTEGER|FK → FACT\_CONTRATO|Contrato al que corresponde el pago|
|Id\_Tiempo|INTEGER|FK → DIM\_TIEMPO|Período de emisión del pago|
|Monto\_Pago|DECIMAL(10,2)|—|Monto cobrado en el período|
|Estado\_Pago|VARCHAR(20)|—|Pagado / Pendiente|
|Fecha\_Emision|DATE|—|Fecha de generación de la factura|
|Fecha\_Pago|DATE|—|Fecha efectiva de pago (NULL si pendiente)|

## **2.2 Tablas de Dimensión**

**DIM\_CLIENTE**

|**Campo**|**Tipo**|**Relación**|**Descripción**|
| :-: | :-: | :-: | :-: |
|Id\_Cliente|INTEGER|PK|Identificador único del cliente|
|Nombre\_Empresa|VARCHAR(200)|—|Razón social o nombre (uso interno agregado)|
|Tipo\_Cliente|VARCHAR(20)|—|Natural / Jurídico|
|Id\_Sede|INTEGER|FK → DIM\_SEDE|Sede de pertenencia del cliente|
|Estado\_Cliente|VARCHAR(20)|—|Activo / Inactivo|
|Segmento\_KMeans|INTEGER|—|Cluster asignado por el modelo (1–4)|

**DIM\_SEDE**

|**Campo**|**Tipo**|**Relación**|**Descripción**|
| :-: | :-: | :-: | :-: |
|Id\_Sede|INTEGER|PK|Identificador de la sede|
|Nombre\_Sede|VARCHAR(100)|—|San Ramón / La Merced / Llacta / Pichanaqui|
|Region|VARCHAR(50)|—|Junín / Huánuco|
|Provincia|VARCHAR(50)|—|Chanchamayo / Huánuco / Leoncio Prado|
|Es\_Expansion|BOOLEAN|—|TRUE si es sede nueva (Pichanaqui)|

**DIM\_PLAN**

|**Campo**|**Tipo**|**Relación**|**Descripción**|
| :-: | :-: | :-: | :-: |
|Id\_Plan|INTEGER|PK|Identificador del plan|
|Nombre\_Plan|VARCHAR(100)|—|Nombre comercial del plan|
|Velocidad\_Mbps|INTEGER|—|Velocidad de descarga en Mbps|
|Precio\_Mensual|DECIMAL(10,2)|—|Precio mensual en soles|
|Categoria\_Comercial|VARCHAR(30)|—|Básico / Estándar / Plus / Premium / Empresarial / Corporativo|
|Tipo\_Servicio|VARCHAR(30)|—|Cable / Internet / Combo|

**DIM\_TIEMPO**

|**Campo**|**Tipo**|**Relación**|**Descripción**|
| :-: | :-: | :-: | :-: |
|Id\_Tiempo|INTEGER|PK|Clave sustituta de tiempo (YYYYMM)|
|Anio|INTEGER|—|Año del período (ej. 2024, 2025)|
|Mes|INTEGER|—|Mes del período (1–12)|
|Nombre\_Mes|VARCHAR(20)|—|Enero, Febrero, … Diciembre|
|Trimestre|INTEGER|—|Q1 / Q2 / Q3 / Q4|
|Semestre|INTEGER|—|S1 / S2|

**DIM\_CATEGORIA (Segmentos K-Means)**

|**Campo**|**Tipo**|**Relación**|**Descripción**|
| :-: | :-: | :-: | :-: |
|Id\_Categoria|INTEGER|PK|Identificador del segmento|
|Nombre\_Segmento|VARCHAR(50)|—|Residencial Económico / Residencial Alto Consumo / Empresarial-Corporativo / En Riesgo|
|Cluster\_KMeans|INTEGER|—|Número de cluster (1, 2, 3, 4)|
|Descripcion|TEXT|—|Perfil de comportamiento del segmento|
|Estrategia\_Marketing|TEXT|—|Acción comercial recomendada para el segmento|

## **2.3 Diagrama de Esquema Estrella**

El modelo sigue la arquitectura de Esquema Estrella con dos tablas de hechos centrales:

|<p>**ESQUEMA ESTRELLA — CableBI**</p><p>─────────────────────────────────────────────────────</p><p>**[ DIM\_TIEMPO ]**</p><p>Id\_Tiempo | Anio | Mes | Trimestre | Semestre</p><p>│</p><p>**[ DIM\_CLIENTE ]────[ FACT\_CONTRATO ]────[ DIM\_SEDE ]**</p><p>`                         `│                          </p><p>`                  `**[ FACT\_PAGO ]**                     </p><p>`                    `/       \                       </p><p>**[ DIM\_PLAN ]         [ DIM\_CATEGORIA ]**              </p><p>─────────────────────────────────────────────────────</p><p>*■ = Tabla de Hechos   □ = Tabla de Dimensión*</p>|
| :-: |


# **3. FICHA TÉCNICA — K-MEANS**

## **3.1 Objetivo del Modelo**

Segmentar la cartera de 96 clientes de Cable e Internet Cañari en grupos de comportamiento homogéneo, con el fin de diseñar campañas de marketing diferenciadas para cada perfil, especialmente orientadas a la expansión hacia Pichanaqui.

## **3.2 Variables de Entrada**

|**Variable**|**Tipo**|**Fuente**|**Descripción**|
| :-: | :-: | :-: | :-: |
|Precio\_Max\_Plan|Numérico continuo|DIM\_PLAN → FACT\_CONTRATO|Precio del plan más alto contratado por el cliente|
|Velocidad\_Max\_Mbps|Numérico continuo|DIM\_PLAN → FACT\_CONTRATO|Velocidad máxima del plan contratado|
|Num\_Contratos|Numérico entero|FACT\_CONTRATO|Cantidad total de contratos del cliente|
|Monto\_Total\_Pagado|Numérico continuo|FACT\_PAGO|Suma acumulada de pagos realizados|
|Num\_Pagos|Numérico entero|FACT\_PAGO|Número total de pagos registrados|
|Pagos\_Pendientes|Numérico entero|FACT\_PAGO (estado=Pendiente)|Número de pagos pendientes o en mora|
|Sede\_Codificada|Numérico (0,1,2)|DIM\_SEDE|Codificación numérica de sede: 0=San Ramón, 1=La Merced, 2=Llacta|

## **3.3 Preprocesamiento**

- Tratamiento de valores nulos: se excluyeron 3 clientes sin datos completos, quedando 96 observaciones válidas para el modelo.
- Normalización con StandardScaler (sklearn.preprocessing): todas las variables fueron estandarizadas a media = 0 y desviación estándar = 1, para evitar que variables con rangos grandes (como Velocidad\_Max\_Mbps o Monto\_Total\_Pagado) dominen el cálculo de distancias euclideas.
- Codificación de variables categóricas: la variable 'Sede' fue transformada en valores numéricos (Label Encoding) dado que K-Means no admite variables de texto.
- Herramienta utilizada: Python 3.x con librerías scikit-learn, pandas y matplotlib.

## **3.4 Selección del Número de Clusters (K óptimo)**

Se evaluaron valores de K entre 2 y 6 utilizando dos criterios complementarios:

|**Criterio**|**Descripción**|**Resultado**|
| :-: | :-: | :-: |
|Método del Codo (Elbow Method)|Se grafica la inercia (suma de distancias cuadradas intra-cluster) en función de K. El 'codo' visual indica el punto donde agregar más clusters deja de reducir significativamente la inercia.|K = 4 (quiebre visible en la curva de inercia)|
|Índice de Silueta (Silhouette Score)|Mide qué tan bien separados están los clusters. Valores cercanos a 1 indican clusters bien definidos; valores cercanos a 0 indican solapamiento.|K = 4 (silhouette score ≈ 0.53, el valor más alto evaluado entre K=2 y K=6)|

**Conclusión: ambos métodos convergieron en K = 4 como el número óptimo de clusters para esta base de datos.**

## **3.5 Métricas de Evaluación**

|**Métrica**|**Valor**|**Interpretación**|
| :-: | :-: | :-: |
|Silhouette Score Global|0\.53 (K=4)|Separación moderada-alta entre clusters; aceptable para base de 96 registros|
|Inercia Final|~245 (valores normalizados)|Reducción del 61% respecto a K=1; estabilización a partir de K=4|
|Número de iteraciones|Máximo 300 (convergió antes)|El algoritmo convergió sin agotar el límite de iteraciones|

## **3.6 Resultados: Interpretación de Segmentos**

|**Cluster**|**Segmento**|**Clientes**|**Precio Prom.**|**Velocidad Prom.**|**Monto Total Prom.**|**Pagos Pend.**|**Estrategia**|
| :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
|1|Residencial Económico|34|S/ 61|178 Mbps|S/ 290|0|Clientes con planes Básico/Estándar y buen historial de pago. Base de demanda masiva. CAMPAÑA: lanzamiento en Pichanaqui con plan Básico a S/ 50 + instalación gratuita.|
|2|Residencial Alto Consumo|49|S/ 83|317 Mbps|S/ 188|0|Clientes más recientes con planes de mayor velocidad. Monto acumulado bajo por antigüedad. CAMPAÑA: upselling hacia Plus/Premium; énfasis en teletrabajo y streaming.|
|3|Empresarial / Corporativo|10|S/ 219|1,340 Mbps|S/ 825|0|Alto ticket promedio, bajo volumen. Importancia estratégica para rentabilidad. CAMPAÑA: visitas comerciales a negocios, oficinas e instituciones en Pichanaqui.|
|4|En Riesgo|3|S/ 53|117 Mbps|S/ 137|1|Clientes con pagos pendientes e inactividad. ACCIÓN: alertas de cobranza preventiva y protocolo de retención antes de que cancelen.|


# **4. FICHA TÉCNICA — RANDOM FOREST (Predicción de Churn)**

## **4.1 Objetivo del Modelo**

Predecir qué clientes tienen alta probabilidad de cancelar su contrato (churn) en los próximos 30-60 días, permitiendo intervenciones preventivas antes de que se produzca la baja definitiva.

## **4.2 Variable Objetivo (Target)**

|**Variable**|**Tipo**|**Fuente**|**Descripción**|
| :-: | :-: | :-: | :-: |
|Churn|Binaria (0/1)|FACT\_CONTRATO (estado='Inactivo' en período t+1)|1 = cliente que canceló en el período siguiente; 0 = cliente activo|

## **4.3 Variables de Entrada (Features)**

|**Feature**|**Tipo**|**Fuente**|**Descripción**|
| :-: | :-: | :-: | :-: |
|Antiguedad\_Meses|Numérico|DIM\_TIEMPO + FACT\_CONTRATO|Meses transcurridos desde la firma del primer contrato|
|Precio\_Plan|Numérico|DIM\_PLAN|Precio mensual del plan activo|
|Velocidad\_Plan|Numérico|DIM\_PLAN|Velocidad contratada en Mbps|
|Pagos\_Pendientes|Entero|FACT\_PAGO|Número de pagos sin cancelar|
|Dias\_Ultimo\_Pago|Entero|FACT\_PAGO|Días transcurridos desde el último pago registrado|
|Num\_Contratos\_Historico|Entero|FACT\_CONTRATO|Total de contratos del cliente (incluyendo cancelados)|
|Categoria\_Plan|Ordinal (0–5)|DIM\_PLAN|Básico=0, Estándar=1, Plus=2, Premium=3, Empresarial=4, Corporativo=5|
|Sede|Categórica codificada|DIM\_SEDE|San Ramón=0, La Merced=1, Llacta=2, Pichanaqui=3|
|Segmento\_KMeans|Entero (1–4)|Salida del modelo K-Means|Cluster asignado al cliente por el modelo de segmentación|
|Contratos\_Activos|Entero|FACT\_CONTRATO|Número de contratos actualmente vigentes|

## **4.4 Preprocesamiento**

- Codificación de variables categóricas: la variable Categoria\_Plan se codifica como ordinal (0–5) respetando la jerarquía de precio. La variable Sede se codifica con Label Encoding (0–3).
- Tratamiento de valores nulos: campos vacíos en Fecha\_Pago se imputan con la mediana de días entre pagos del mismo segmento.
- Balanceo de clases: dado que la tasa de churn actual es ~1.1% (4 contratos inactivos sobre 105), se aplicará técnica SMOTE (Synthetic Minority Over-sampling Technique) para balancear las clases antes del entrenamiento.
- División del dataset: 70% entrenamiento / 15% validación / 15% prueba, con estratificación por la variable objetivo.
- Escala: Random Forest no requiere normalización, ya que trabaja con árboles de decisión que son invariantes a la escala de las variables.

## **4.5 Hiperparámetros del Modelo**

|**Hiperparámetro**|**Valor**|**Justificación**|
| :-: | :-: | :-: |
|n\_estimators|200|Número de árboles en el bosque. Mayor número reduce la varianza sin aumentar el sesgo significativamente.|
|max\_depth|10|Profundidad máxima de cada árbol. Controla el sobreajuste; valor moderado para dataset pequeño.|
|min\_samples\_split|5|Mínimo de muestras requeridas para dividir un nodo. Previene divisiones en subconjuntos muy pequeños.|
|min\_samples\_leaf|2|Mínimo de muestras en cada hoja. Suaviza el modelo y mejora la generalización.|
|max\_features|'sqrt'|Número de features consideradas por árbol = raíz cuadrada del total. Estándar para clasificación.|
|class\_weight|'balanced'|Ajuste automático de pesos para compensar el desbalanceo de clases (pocos casos de churn).|
|random\_state|42|Semilla de aleatoriedad para reproducibilidad de resultados.|
|criterion|'gini'|Índice de Gini como criterio de impureza para la división de nodos.|

## **4.6 Métricas de Evaluación Esperadas**

|**Métrica**|**Meta**|**Interpretación**|
| :-: | :-: | :-: |
|Accuracy (Exactitud)|> 90%|Porcentaje total de predicciones correctas. Alta debido al desbalanceo.|
|Precision (Precisión)|> 75%|De los clientes predichos como churn, cuántos realmente cancelaron. Relevante para no desperdiciar recursos de retención.|
|Recall (Sensibilidad)|> 70%|De los clientes que realmente cancelaron, cuántos fueron detectados. Crítico para no perder clientes en riesgo.|
|F1-Score|> 72%|Media armónica de Precision y Recall. Métrica principal dado el desbalanceo de clases.|
|AUC-ROC|> 0.85|Capacidad discriminativa del modelo entre clientes que cancelan y los que no.|
|Matriz de Confusión|Ver tabla abajo|Distribución de Verdaderos/Falsos Positivos y Negativos.|

**Estructura de la Matriz de Confusión esperada:**

| |**Pred: No Churn**|**Pred: Churn**|
| :-: | :-: | :-: |
|**Real: No Churn**|TN (Verdaderos No-Churn)|FP (Falsa Alarma)|
|**Real: Churn**|FN (Churn no detectado)|TP (Churn detectado)|

## **4.7 Justificación de Random Forest sobre otros modelos**

|**Modelo**|**Decisión**|**Justificación**|
| :-: | :-: | :-: |
|Random Forest|✅ SELECCIONADO|Robusto ante valores atípicos, maneja variables mixtas, provee importancia de features, excelente con datasets pequeños (<500 registros), no requiere normalización.|
|Regresión Logística|Descartado|Asume linealidad entre features y log-odds. Poco adecuado para relaciones no lineales entre precio, morosidad y churn.|
|SVM (Support Vector Machine)|Descartado|Requiere tuning extensivo de kernel y no es interpretable. Con datasets pequeños tiende al sobreajuste.|
|Red Neuronal (MLP)|Descartado|Requiere grandes volúmenes de datos para generalizar bien. Con 96 registros, el riesgo de sobreajuste es muy alto.|
|Árbol de Decisión Simple|Alternativa secundaria|Interpretable pero propenso al sobreajuste. Random Forest lo supera siendo un ensamble de árboles.|
|XGBoost / Gradient Boosting|Alternativa futura|Potencialmente mejor con más datos. Se recomienda evaluar cuando la base supere los 500 registros.|


# **5. PLAN DE REENTRENAMIENTO Y MANTENIMIENTO**

## **5.1 Frecuencia de Reentrenamiento**

|**Modelo**|**Frecuencia**|**Justificación**|
| :-: | :-: | :-: |
|K-Means (Segmentación)|Trimestral (cada 3 meses)|Los perfiles de cliente evolucionan lentamente. Un reentrenamiento trimestral captura cambios estacionales sin sobreajustar a ruido temporal.|
|Random Forest (Churn)|Mensual|El comportamiento de pago y cancelación puede cambiar rápidamente, especialmente en la fase de expansión a Pichanaqui.|
|Reentrenamiento de emergencia|Inmediato si se detecta drift|Ver sección 5.2. No esperar al ciclo regular si las métricas degradan más del umbral establecido.|

## **5.2 Criterios de Degradación (Data Drift)**

Se considera que un modelo está degradado cuando se cumple cualquiera de las siguientes condiciones:

|**Modelo**|**Indicador**|**Umbral de Alerta**|**Frecuencia de Monitoreo**|
| :-: | :-: | :-: | :-: |
|K-Means|Silhouette Score|Cae por debajo de 0.40 (descenso > 25% respecto al baseline de 0.53)|Mensual — evaluar sobre nuevos datos acumulados|
|K-Means|Distribución de clusters|Un cluster concentra más del 70% de los clientes (pérdida de segmentación útil)|Trimestral — al ejecutar reentrenamiento|
|Random Forest|F1-Score|Cae por debajo de 0.60 en el conjunto de validación mensual|Mensual — evaluar sobre casos reales del mes anterior|
|Random Forest|Tasa de Falsos Negativos|Supera el 40% (no detectamos más de 4 de cada 10 churns reales)|Mensual — comparar predicciones vs. bajas reales|
|Random Forest|PSI (Population Stability Index)|PSI > 0.20 indica cambio significativo en la distribución de las variables de entrada|Mensual — automatizable con script Python|
|Ambos modelos|Drift de negocio|Ingreso de nueva sede (Pichanaqui) o cambio de catálogo de planes mayor al 30%|En cada evento de cambio organizacional|

## **5.3 Responsables del Monitoreo**

|**Actividad**|**Responsable**|**Frecuencia**|**Descripción de la tarea**|
| :-: | :-: | :-: | :-: |
|Monitoreo de métricas de modelos ML|ORTIZ GIL, Breitner Jyuurio|Mensual|Ejecutar script de evaluación, revisar F1, silhouette y PSI. Emitir reporte a la gerencia.|
|Reentrenamiento K-Means|ORTIZ GIL, Breitner Jyuurio|Trimestral|Ejecutar pipeline de preprocesamiento + K-Means, validar clusters, actualizar DIM\_CATEGORIA.|
|Reentrenamiento Random Forest|ORTIZ GIL, Breitner Jyuurio|Mensual|Incorporar nuevos casos de churn real, reentrenar con datos actualizados, validar métricas.|
|Actualización del dashboard BI|REYES MENDOZA, Harol Jesus|Mensual|Incorporar los nuevos segmentos y scores de churn al Dashboard Gerencial (CableBI).|
|Validación de calidad de datos|DICTRA CENTENO, Jhonatan|Semanal|Verificar que los ETL carguen correctamente los datos al modelo dimensional sin valores nulos críticos.|
|Aprobación de reentrenamiento en producción|Gerencia / Docente a cargo|Según necesidad|Autorizar el cambio de versión del modelo en producción tras validar métricas con el equipo.|

## **5.4 Pipeline de Reentrenamiento Sugerido**

- Paso 1 — Extracción: recuperar nuevos registros desde las tablas FACT\_CONTRATO y FACT\_PAGO desde la última fecha de entrenamiento.
- Paso 2 — Preprocesamiento: aplicar el mismo pipeline de limpieza, imputación y codificación utilizado en el entrenamiento original.
- Paso 3 — Evaluación del modelo vigente: calcular métricas sobre los nuevos datos para determinar si hay degradación.
- Paso 4 — Reentrenamiento condicional: si se detecta drift, reentrenar con el dataset acumulado (histórico + nuevos datos).
- Paso 5 — Validación: comparar las métricas del nuevo modelo con el anterior. Solo reemplazar si el nuevo modelo mejora o iguala.
- Paso 6 — Despliegue: actualizar los scores en la base de datos (campo Segmento\_KMeans en DIM\_CLIENTE, score de churn en FACT\_CONTRATO).
- Paso 7 — Documentación: registrar versión del modelo, fecha, métricas obtenidas y volumen de datos usados.

## **5.5 Herramientas y Entorno**

|**Componente**|**Herramienta / Tecnología**|
| :-: | :-: |
|Lenguaje de programación|Python 3.10+|
|Librerías ML|scikit-learn, imbalanced-learn (SMOTE), pandas, numpy|
|Visualización|matplotlib, seaborn|
|Entorno de desarrollo|Google Colab (actual) → migrar a servidor local o nube|
|Control de versiones|Git + repositorio del equipo|
|Almacenamiento de modelos|joblib (serialización de modelos .pkl)|
|Base de datos|PostgreSQL (modelo dimensional estrella)|


# **6. CONCLUSIONES Y PRÓXIMOS PASOS**

Este entregable consolida los componentes de Business Intelligence y Machine Learning del proyecto CableBI para Cable e Internet Cañari. Los principales aportes son:

- **El Diccionario de KPIs proporciona un marco medible y accionable para monitorear el desempeño comercial, con métricas directamente alineadas al Dashboard Gerencial del proyecto.**
- **El Modelo Dimensional en esquema estrella organiza los datos operativos en una estructura optimizada para consultas analíticas y reportes BI.**
- **La Ficha Técnica K-Means documenta la segmentación en 4 perfiles concretos que permiten diseñar campañas diferenciadas para la expansión hacia Pichanaqui.**
- **La Ficha Técnica Random Forest establece las bases para un sistema predictivo de churn que, una vez implementado, permitirá intervenciones preventivas antes de que los clientes cancelen.**
- **El Plan de Reentrenamiento garantiza que los modelos se mantengan vigentes y precisos conforme la empresa incorpore nuevos clientes y sedes.**

*Referencia al código fuente: https://colab.research.google.com/drive/1IoVzQcdklu8T7aiBqyMyNiziFY42WGCJ?usp=sharing*


*ORTIZ GIL, Breitner Jyuurio  |  Inteligencia de Negocio  |  Universidad Continental  |  2026*
