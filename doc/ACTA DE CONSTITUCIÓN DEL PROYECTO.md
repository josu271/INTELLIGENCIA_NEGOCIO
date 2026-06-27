**CableBI**	Acta de Constitución del Proyecto

**ACTA DE CONSTITUCIÓN DEL PROYECTO**

*(Project Charter)*

**Sistema Web de Inteligencia de Negocios y Análisis Predictivo para una Empresa de Telecomunicaciones**
# **1. Información General del Proyecto**

|**Campo**|**Detalle**|
| :- | :- |
|Nombre del proyecto|Sistema Web de Inteligencia de Negocios y Análisis Predictivo para una Empresa de Telecomunicaciones|
|Nombre corto|CableBI|
|Duración estimada|2 semanas (24 de junio – 4 de julio de 2026)|
|Tecnologías base|React (frontend), Python (Machine Learning), PostgreSQL (base de datos)|
|Sector / Rubro|Telecomunicaciones (TV por cable / servicios de cable)|
# **2. Objetivo General**
Desarrollar un sistema web que centralice la información de clientes, contratos, pagos e incidencias de una empresa de telecomunicaciones, incorporando KPIs y modelos de Machine Learning para apoyar la toma de decisiones gerenciales.
# **3. Objetivos Específicos**

|**Código**|**Objetivo**|
| :- | :- |
|OE1|Gestionar la información de clientes (datos, contratos, pagos e incidencias).|
|OE2|Visualizar indicadores de negocio (KPIs) mediante dashboards interactivos.|
|OE3|Segmentar clientes utilizando el algoritmo de Machine Learning K-Means.|
|OE4|Predecir el riesgo de cancelación (churn) de clientes mediante el algoritmo Random Forest.|
# **4. Alcance del Proyecto**
## **4.1 Incluye (Dentro del alcance)**
- Módulo de gestión de clientes: registro, edición, consulta y baja de clientes, contratos, pagos e incidencias.
- Dashboard gerencial interactivo con los 4 KPIs definidos: Tasa de Crecimiento de Clientes, Tasa de Cancelación (Churn Rate), Nivel de Satisfacción del Cliente y Tiempo Promedio de Resolución de Incidencias.
- Modelo de segmentación de clientes (K-Means) basado en los datos disponibles (consumo, pagos, incidencias, antigüedad, etc.).
- Modelo predictivo de riesgo de cancelación (churn) de clientes mediante Random Forest, entrenado con los datos del proyecto.
- Base de datos relacional en PostgreSQL para almacenar clientes, contratos, pagos e incidencias.
- Backend en Python para el procesamiento de datos y exposición de los modelos de Machine Learning (API).
- Frontend en React para la interacción del usuario, el CRUD de clientes y la visualización del dashboard.
- Autenticación básica de acceso al sistema (usuario gerencial).
- Carga de datos de prueba / dataset representativo para entrenar y demostrar los modelos.
## **4.2 No incluye (Fuera del alcance)**
- Integración con sistemas reales de facturación, CRM o ERP de la empresa de telecomunicaciones.
- Procesamiento de pagos en línea o pasarelas de pago reales.
- Aplicación móvil nativa (solo se considera la versión web).
- Múltiples roles y niveles de permisos granulares (solo se contempla un perfil gerencial/administrativo básico).
- Despliegue en infraestructura productiva en la nube ni mantenimiento posterior a la entrega.
- Reentrenamiento automático o monitoreo continuo (MLOps) de los modelos de Machine Learning.
- Pruebas de carga, auditorías de seguridad o certificaciones de cumplimiento normativo.
# **5. Stakeholders del Proyecto**

|**Stakeholder**|**Tipo**|**Rol / Interés en el proyecto**|
| :- | :- | :- |
|Docente del curso|Cliente / Evaluador|Define los requisitos académicos del proyecto, evalúa los entregables y valida que se cumplan los objetivos planteados (KPIs, dashboard y modelo predictivo).|
|Equipo de desarrollo (5 integrantes)|Equipo del proyecto|Responsable de planificar, diseñar, programar, analizar los datos y entregar el sistema CableBI en el plazo establecido.|
|Gerente de la empresa de telecomunicaciones (simulado)|Usuario final|Usuario que consulta el dashboard gerencial y los KPIs para apoyar la toma de decisiones del negocio.|
|Personal de atención al cliente (simulado)|Usuario final|Usuario que registra y consulta la información de clientes, contratos, pagos e incidencias en el sistema.|
# **6. Equipo del Proyecto y Roles**

|**Integrante**|**Rol en el proyecto**|**Responsabilidad principal**|
| :- | :- | :- |
|Reyes Mendoza, Harol Jesús|Gestión de Proyecto|Planificación, cronograma, coordinación del equipo y seguimiento de entregables.|
|Olazo Lope, Jair Sebastián|Requerimientos|Levantamiento, análisis y documentación de los requerimientos funcionales y no funcionales.|
|Dictra Centeno, Jhonatan|Diseño (Arquitectura + Datos)|Diseño de la arquitectura del sistema y del modelo de base de datos en PostgreSQL.|
|Ortiz Gil, Breitner Jyuurio|BI + Machine Learning|Construcción de los KPIs, el dashboard, y los modelos de K-Means y Random Forest.|
|Sulla Corbetta, José Luis|Programación|Desarrollo del frontend en React y del backend en Python, e integración con la base de datos.|
# **7. Restricciones del Proyecto**
## **7.1 Tiempo**
- El proyecto debe planificarse, desarrollarse y entregarse en un plazo máximo de 2 semanas.
## **7.2 Tecnología (obligatoria)**
- Frontend: React.
- Machine Learning / Backend de datos: Python.
- Base de datos: PostgreSQL.
## **7.3 Alcance funcional**
- El producto final debe incluir, como mínimo, el dashboard con los 4 KPIs definidos y un modelo de predicción de cancelación de clientes.
- Por el tiempo disponible, el sistema se limita a las funcionalidades descritas en la sección de Alcance; no se contemplan módulos adicionales no solicitados por el docente.
## **7.4 Recursos y presupuesto**
- Proyecto académico sin presupuesto asignado; se utilizarán únicamente herramientas y servicios de uso gratuito (open source / planes free).
- El equipo de trabajo está conformado por 5 integrantes, sin posibilidad de incorporar personal adicional durante el desarrollo.
# **8. Supuestos del Proyecto**
- Se contará con un dataset (real, simulado o sintético) de clientes, contratos, pagos e incidencias suficiente para calcular los KPIs y entrenar los modelos de K-Means y Random Forest.
- El dataset estará disponible y en condiciones de ser utilizado durante la primera semana del proyecto, para no retrasar el desarrollo de los modelos de Machine Learning.
- Los integrantes del equipo dispondrán del tiempo necesario durante las 2 semanas para cumplir con el rol asignado a cada uno.
- El entorno de desarrollo (React, Python, PostgreSQL) podrá instalarse y ejecutarse correctamente en los equipos de los integrantes del equipo.
- El docente actuará como cliente del proyecto y estará disponible para resolver dudas o validar avances durante el desarrollo.
- Los datos utilizados son únicamente con fines académicos y no corresponden a información real y confidencial de una empresa de telecomunicaciones.
- No se requiere una precisión mínima garantizada de los modelos de Machine Learning; el objetivo es demostrar la aplicación correcta de la metodología (segmentación y predicción).
# **9. Plan de Trabajo / Cronograma**
*Nota sobre fechas: el equipo indicó como hitos el sábado 28 de junio (entrega parcial) y el sábado 4 de julio de 2026 (entrega final). Verificando el calendario, el 4 de julio de 2026 cae efectivamente en sábado, mientras que el 28 de junio de 2026 cae en domingo. Se mantiene la fecha del 28 de junio solicitada por el equipo como hito de avance; si la intención era que cayera en sábado, la fecha correspondiente sería el 27 de junio.*
## **9.1 Fases del Proyecto**
- Requerimientos: levantamiento y documentación de requerimientos funcionales y no funcionales.
- Diseño: arquitectura del sistema y modelo de base de datos (PostgreSQL).
- Desarrollo: construcción del backend (Python), frontend (React), KPIs, dashboard y modelos de Machine Learning (K-Means y Random Forest), dividido en dos sprints.
- Pruebas: validación funcional del CRUD, del dashboard y de los modelos predictivos.
- Cierre: documentación final, acta de cierre y entrega del proyecto.
## **9.2 Hitos Clave**

|**Hito**|**Fecha estimada**|**Responsable**|
| :- | :- | :- |
|Aprobación del Acta de Constitución|24 de junio de 2026|Equipo completo|
|Entrega parcial (avance ~50%): base de datos, CRUD de clientes y dashboard preliminar operativos|28 de junio de 2026|Equipo completo|
|Modelos de Machine Learning completados e integrados (K-Means y Random Forest)|2 de julio de 2026|Ortiz Gil, Breitner Jyuurio|
|Entrega final del proyecto CableBI|4 de julio de 2026|Equipo completo|
## **9.3 Diagrama de Gantt**
Representación visual del cronograma de 2 semanas (24 de junio – 4 de julio de 2026). Las celdas en azul indican el periodo activo de cada fase; las celdas en rojo con ★ marcan los hitos de entrega.

|**Fase / Actividad**|<p>**24 jun**</p><p>**Mié**</p>|<p>**25 jun**</p><p>**Jue**</p>|<p>**26 jun**</p><p>**Vie**</p>|<p>**27 jun**</p><p>**Sáb**</p>|<p>**28 jun**</p><p>**Dom**</p>|<p>**29 jun**</p><p>**Lun**</p>|<p>**30 jun**</p><p>**Mar**</p>|<p>**1 jul**</p><p>**Mié**</p>|<p>**2 jul**</p><p>**Jue**</p>|<p>**3 jul**</p><p>**Vie**</p>|<p>**4 jul**</p><p>**Sáb**</p>|
| :- | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
|Requerimientos|■|■||||||||||
|Diseño (Arquitectura + BD)||■|■|||||||||
|Desarrollo – Sprint 1 (Base, CRUD, dashboard base)|■|■|■|■|■|||||||
|**Entrega parcial (avance 50%)**|||||★|||||||
|Desarrollo – Sprint 2 (Modelos ML + integración)||||||■|■|■|■|||
|Pruebas|||||||||■|■||
|Cierre y entrega final||||||||||■|■|
|**Entrega final del proyecto**|||||||||||★|

*Para un seguimiento más detallado, se recomienda trasladar este cronograma a una herramienta de gestión visual como Trello, ClickUp o Microsoft Project, asignando tarjetas/tareas a cada integrante por fase.*
## **9.4 Entregables por Sprint / Fase**

|**Fase**|**Entregable**|**Fecha**|
| :- | :- | :- |
|Requerimientos|Documento de requerimientos funcionales y no funcionales|25 de junio|
|Diseño|Diagrama entidad-relación de la base de datos y documento de arquitectura del sistema|26 de junio|
|Desarrollo – Sprint 1|Base de datos implementada, CRUD de clientes/contratos/pagos/incidencias y dashboard preliminar (avance 50%)|28 de junio|
|Desarrollo – Sprint 2|Modelos de K-Means y Random Forest integrados, dashboard completo con los 4 KPIs|2 de julio|
|Pruebas|Informe de pruebas funcionales del sistema|3 de julio|
|Cierre|Documentación final, presentación y acta de cierre del proyecto CableBI|4 de julio|
# **10. Matriz de Riesgos**
Se identifican los principales riesgos técnicos, de datos, de equipo y de tiempo que podrían afectar el desarrollo del proyecto CableBI, junto con su probabilidad, impacto, plan de mitigación y responsable de monitoreo.

|**#**|**Riesgo**|**Categoría**|**Prob.**|**Impacto**|**Plan de mitigación**|**Responsable**|
| :- | :- | :- | :- | :- | :- | :- |
|R1|El dataset no esté disponible o completo a tiempo para entrenar los modelos|Datos|Media|Alto|Preparar un dataset sintético de respaldo desde el inicio del proyecto|Ortiz Gil, Breitner Jyuurio|
|R2|El plazo de 2 semanas resulte insuficiente para completar todo el alcance|Tiempo|Alta|Alto|Priorizar el alcance mínimo viable (KPIs + modelo de churn) y aplicar metodología ágil con sprints cortos|Reyes Mendoza, Harol Jesús|
|R3|Bajo desempeño o precisión de los modelos K-Means / Random Forest|Técnico|Media|Medio|Ajustar variables/hiperparámetros y documentar resultados como demostración metodológica, sin exigir una precisión mínima|Ortiz Gil, Breitner Jyuurio|
|R4|Problemas de integración entre el frontend (React) y el backend (Python)|Técnico|Media|Alto|Definir y acordar el contrato de la API (endpoints y formatos) desde la fase de diseño|Sulla Corbetta, José Luis|
|R5|Errores en el modelo de base de datos que generen retrabajo posterior|Datos|Baja|Alto|Validar el diagrama entidad-relación con el equipo antes de implementarlo en PostgreSQL|Dictra Centeno, Jhonatan|
|R6|Indisponibilidad temporal de algún integrante del equipo|Equipo|Media|Alto|Documentación compartida y actualizada, y respaldo de tareas entre integrantes con roles afines|Reyes Mendoza, Harol Jesús|
|R7|Cambios o ampliaciones de requerimientos solicitados por el docente durante el desarrollo|Alcance|Media|Medio|Validar y cerrar el alcance en la primera semana; evaluar el impacto en tiempo antes de aceptar cambios|Olazo Lope, Jair Sebastián|
|R8|Problemas de configuración del entorno de desarrollo (React, Python, PostgreSQL)|Técnico|Media|Medio|Elaborar una guía de instalación estándar para el equipo y, de ser posible, usar contenedores (Docker)|Sulla Corbetta, José Luis|
|R9|El dashboard no refleje correctamente el cálculo de los KPIs|Técnico|Baja|Alto|Validar manualmente el cálculo de cada KPI con datos de prueba antes de conectarlo a la visualización|Ortiz Gil, Breitner Jyuurio|
|R10|Pérdida de información o de avances de código por falta de control de versiones|Equipo|Baja|Alto|Uso obligatorio de Git/GitHub con repositorio compartido y respaldo en la nube|Dictra Centeno, Jhonatan|
# **11. Acuerdo de Roles del Equipo**
## **11.1 Roles y Entregables por Integrante**

|**Integrante**|**Rol**|**Responsabilidades**|**Entregables**|
| :- | :- | :- | :- |
|Reyes Mendoza, Harol Jesús|Gestión de Proyecto|Planificar el cronograma, coordinar al equipo, dar seguimiento a entregables y gestionar riesgos.|Acta de Constitución, cronograma, actas de seguimiento, acta de cierre.|
|Olazo Lope, Jair Sebastián|Requerimientos|Levantar, analizar y documentar los requerimientos funcionales y no funcionales; validar alcance con el docente.|Documento de requerimientos funcionales y no funcionales.|
|Dictra Centeno, Jhonatan|Diseño (Arquitectura + Datos)|Diseñar la arquitectura del sistema y el modelo de base de datos en PostgreSQL; administrar el repositorio de control de versiones.|Diagrama de arquitectura, diagrama entidad-relación, script de base de datos.|
|Ortiz Gil, Breitner Jyuurio|BI + Machine Learning|Construir los 4 KPIs, el dashboard analítico y los modelos de K-Means y Random Forest; validar resultados de los modelos.|Dashboard con KPIs, modelo de segmentación (K-Means), modelo de predicción de churn (Random Forest).|
|Sulla Corbetta, José Luis|Programación|Desarrollar el frontend en React y el backend en Python; integrar la API con la base de datos y los modelos de ML.|Aplicación web (frontend + backend) funcional e integrada.|
## **11.2 Canal de Comunicación**
- Canal principal (día a día): grupo de WhatsApp del equipo “CableBI”, para coordinación rápida y consultas urgentes.
- Canal de trabajo técnico: servidor de Discord (o Google Meet) para reuniones de trabajo, revisión de avances y compartir pantalla.
- Repositorio de código: GitHub, como medio de control de versiones y respaldo del trabajo de cada integrante.
## **11.3 Frecuencia de Reuniones de Seguimiento**
- Reunión diaria breve (15 minutos), tipo daily, para reportar avances, bloqueos y tareas del día.
- Reunión de revisión cada 2 a 3 días (al cierre de cada mini-entregable) para validar el avance contra el cronograma.
- Reunión de cierre de sprint: 28 de junio (entrega parcial) y 3 de julio (previa a la entrega final), para validar entregables antes de presentarlos al docente.
# **12. Aprobación**
El presente Acta de Constitución formaliza el inicio del proyecto CableBI, incorpora el plan de trabajo, la matriz de riesgos y el acuerdo de roles del equipo, y es de conocimiento de todos los integrantes del equipo de trabajo.

Fecha: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

Elaborado por: Equipo de Proyecto CableBI
