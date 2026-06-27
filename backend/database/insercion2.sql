-- =========================================================
-- INSERCION 2 - DATASET ADICIONAL PARA CABLEBI
-- Compatible con la estructura y la semilla base de:
-- backend/database/cablebi_database.sql
--
-- Recomendacion:
-- 1. Ejecutar primero cablebi_database.sql
-- 2. Ejecutar despues este archivo
-- =========================================================

BEGIN;

SET search_path TO cablebi, public;

-- ---------------------------------------------------------
-- 1. APOYO PARA LOOKUPS
-- ---------------------------------------------------------

CREATE TEMP TABLE tmp_site_lookup AS
SELECT
    id_sede,
    lower(translate(nombre_sede, 'ÁÉÍÓÚáéíóúÑñ', 'AEIOUaeiounn')) AS site_key
FROM sedes;

CREATE TEMP TABLE tmp_plan_lookup AS
SELECT
    id_plan,
    lower(translate(nombre_plan, 'ÁÉÍÓÚáéíóúÑñ', 'AEIOUaeiounn')) AS plan_key,
    precio_mensual
FROM planes
WHERE estado = 'activo';

CREATE TEMP TABLE tmp_user_lookup AS
SELECT
    id_usuario,
    usuario
FROM usuarios;

INSERT INTO segmentos_kmeans (
    cluster_kmeans,
    nombre_segmento,
    descripcion,
    estrategia_marketing
)
VALUES
    (1, 'Residencial Economico', 'Clientes con planes basicos o estandar y pagos ordenados.', 'Programas de fidelizacion y renovacion.'),
    (2, 'Residencial Alto Consumo', 'Clientes de mayor velocidad con potencial de upgrade.', 'Campanas de upselling y mejora de equipos.'),
    (3, 'Empresarial / Corporativo', 'Clientes de alto ticket y relacion sostenida.', 'Atencion preferente y seguimiento comercial.'),
    (4, 'En Riesgo', 'Clientes con mora, reclamos o alta probabilidad de fuga.', 'Retencion preventiva y recuperacion comercial.')
ON CONFLICT (cluster_kmeans) DO NOTHING;

-- ---------------------------------------------------------
-- 2. CLIENTES NUEVOS
-- ---------------------------------------------------------

CREATE TEMP TABLE tmp_seed_clients (
    site_key VARCHAR(100),
    dni VARCHAR(15),
    nombres VARCHAR(80),
    apellidos VARCHAR(80),
    telefono VARCHAR(20),
    email VARCHAR(100),
    direccion VARCHAR(150),
    tipo_cliente VARCHAR(20),
    fecha_registro DATE,
    estado VARCHAR(20)
);

INSERT INTO tmp_seed_clients (
    site_key,
    dni,
    nombres,
    apellidos,
    telefono,
    email,
    direccion,
    tipo_cliente,
    fecha_registro,
    estado
)
VALUES
    ('san ramon', '72000001', 'Rosa Elvira', 'Medina Paredes', '961101001', 'rosa.medina@cablebi.pe', 'Jr. Los Cedros 145', 'natural', '2025-11-12', 'activo'),
    ('la merced', '72000002', 'Julio Cesar', 'Chavez Rios', '961101002', 'julio.chavez@cablebi.pe', 'Av. Comercio 248', 'natural', '2025-12-05', 'activo'),
    ('llacta', '72000003', 'Patricia', 'Torres Huaman', '961101003', 'patricia.torres@cablebi.pe', 'Psje. Santa Rosa 410', 'natural', '2026-01-08', 'activo'),
    ('pichanaqui', '72000004', 'Distribuidora Selva SAC', 'Representante Legal', '961101004', 'contacto@distribuidoraselva.pe', 'Av. Peru 880', 'juridico', '2025-10-22', 'activo'),
    ('san ramon', '72000005', 'Mario Andres', 'Espinoza Quispe', '961101005', 'mario.espinoza@cablebi.pe', 'Jr. Tarma 612', 'natural', '2026-02-14', 'activo'),
    ('la merced', '72000006', 'Elena', 'Salazar Soto', '961101006', 'elena.salazar@cablebi.pe', 'Av. Miraflores 355', 'natural', '2025-09-30', 'inactivo'),
    ('llacta', '72000007', 'Josue', 'Leon Vargas', '961101007', 'josue.leon@cablebi.pe', 'Calle Progreso 129', 'natural', '2026-01-20', 'activo'),
    ('pichanaqui', '72000008', 'AgroAndes EIRL', 'Representante Comercial', '961101008', 'gerencia@agroandes.pe', 'Av. Circunvalacion 150', 'juridico', '2025-12-19', 'activo'),
    ('san ramon', '72000009', 'Cinthia', 'Rojas Palomino', '961101009', 'cinthia.rojas@cablebi.pe', 'Jr. Union 477', 'natural', '2026-03-04', 'activo'),
    ('la merced', '72000010', 'Victor Raul', 'Ponce Navarro', '961101010', 'victor.ponce@cablebi.pe', 'Jr. Las Palmas 900', 'natural', '2025-11-28', 'inactivo'),
    ('llacta', '72000011', 'Ferreteria Oriente SAC', 'Administracion', '961101011', 'admin@ferreteriaoriente.pe', 'Av. Selva Central 501', 'juridico', '2025-08-18', 'activo'),
    ('pichanaqui', '72000012', 'Nadia', 'Huerta Campos', '961101012', 'nadia.huerta@cablebi.pe', 'Calle Lima 222', 'natural', '2026-04-10', 'activo');

INSERT INTO clientes (
    id_sede,
    dni,
    nombres,
    apellidos,
    telefono,
    email,
    direccion,
    tipo_cliente,
    fecha_registro,
    estado
)
SELECT
    sl.id_sede,
    sc.dni,
    sc.nombres,
    sc.apellidos,
    sc.telefono,
    sc.email,
    sc.direccion,
    sc.tipo_cliente,
    sc.fecha_registro,
    sc.estado
FROM tmp_seed_clients sc
JOIN tmp_site_lookup sl
    ON sl.site_key = sc.site_key
ON CONFLICT (dni) DO NOTHING;

-- ---------------------------------------------------------
-- 3. CONTRATOS ADICIONALES
-- ---------------------------------------------------------

CREATE TEMP TABLE tmp_seed_contracts (
    client_dni VARCHAR(15),
    site_key VARCHAR(100),
    plan_key VARCHAR(120),
    fecha_inicio DATE,
    fecha_fin DATE,
    estado VARCHAR(20),
    observacion TEXT,
    payment_profile VARCHAR(20)
);

INSERT INTO tmp_seed_contracts (
    client_dni,
    site_key,
    plan_key,
    fecha_inicio,
    fecha_fin,
    estado,
    observacion,
    payment_profile
)
VALUES
    ('72000001', 'san ramon', 'internet basico 100 mbps', '2025-11-15', NULL, 'activo', 'Cliente residencial con comportamiento estable.', 'stable'),
    ('72000002', 'la merced', 'premium 500 mbps', '2025-12-10', NULL, 'activo', 'Upgrade reciente a plan premium.', 'late'),
    ('72000002', 'la merced', 'internet estandar 200 mbps', '2025-08-02', '2025-12-09', 'inactivo', 'Plan historico anterior al upgrade.', 'stable'),
    ('72000003', 'llacta', 'combo plus 300 mbps', '2026-01-10', NULL, 'activo', 'Cliente con alto consumo residencial.', 'stable'),
    ('72000004', 'pichanaqui', 'empresarial 1000 mbps', '2025-10-25', NULL, 'activo', 'Cuenta empresarial en expansion.', 'corp'),
    ('72000005', 'san ramon', 'internet estandar 200 mbps', '2026-02-18', NULL, 'activo', 'Cliente con pagos irregulares recientes.', 'late'),
    ('72000006', 'la merced', 'internet estandar 200 mbps', '2025-10-04', '2026-04-28', 'cancelado', 'Cliente cancelado por reclamos recurrentes.', 'churn'),
    ('72000007', 'llacta', 'premium 500 mbps', '2026-01-25', NULL, 'activo', 'Cliente sensible a incidencias tecnicas.', 'risk'),
    ('72000007', 'llacta', 'internet basico 100 mbps', '2025-09-01', '2026-01-24', 'inactivo', 'Contrato previo antes de migracion.', 'late'),
    ('72000008', 'pichanaqui', 'empresarial 1000 mbps', '2025-12-22', NULL, 'suspendido', 'Cuenta en seguimiento de cobranza.', 'risk'),
    ('72000009', 'san ramon', 'combo plus 300 mbps', '2026-03-08', NULL, 'activo', 'Cliente con buena adopcion del servicio.', 'stable'),
    ('72000010', 'la merced', 'premium 500 mbps', '2025-12-01', '2026-05-02', 'inactivo', 'Cliente inactivo por baja demanda.', 'churn'),
    ('72000011', 'llacta', 'corporativo 1500 mbps', '2025-08-21', NULL, 'activo', 'Cliente corporativo de mayor ticket.', 'corp'),
    ('72000011', 'llacta', 'empresarial 1000 mbps', '2025-03-10', '2025-08-20', 'inactivo', 'Plan historico anterior.', 'corp'),
    ('72000012', 'pichanaqui', 'internet estandar 200 mbps', '2026-04-14', NULL, 'activo', 'Cliente nuevo en sede de expansion.', 'stable');

INSERT INTO contratos (
    id_cliente,
    id_sede,
    id_plan,
    fecha_inicio,
    fecha_fin,
    estado,
    observacion
)
SELECT
    c.id_cliente,
    sl.id_sede,
    pl.id_plan,
    sc.fecha_inicio,
    sc.fecha_fin,
    sc.estado,
    sc.observacion
FROM tmp_seed_contracts sc
JOIN clientes c
    ON c.dni = sc.client_dni
JOIN tmp_site_lookup sl
    ON sl.site_key = sc.site_key
JOIN tmp_plan_lookup pl
    ON pl.plan_key = sc.plan_key
WHERE NOT EXISTS (
    SELECT 1
    FROM contratos co
    WHERE co.id_cliente = c.id_cliente
      AND co.id_plan = pl.id_plan
      AND co.fecha_inicio = sc.fecha_inicio
);

CREATE TEMP TABLE tmp_contract_targets AS
SELECT
    co.id_contrato,
    c.id_cliente,
    c.dni,
    sc.fecha_inicio,
    sc.fecha_fin,
    sc.payment_profile,
    pl.precio_mensual
FROM tmp_seed_contracts sc
JOIN clientes c
    ON c.dni = sc.client_dni
JOIN tmp_plan_lookup pl
    ON pl.plan_key = sc.plan_key
JOIN contratos co
    ON co.id_cliente = c.id_cliente
   AND co.id_plan = pl.id_plan
   AND co.fecha_inicio = sc.fecha_inicio;

-- ---------------------------------------------------------
-- 4. PAGOS ADICIONALES
-- ---------------------------------------------------------

INSERT INTO pagos (
    id_contrato,
    fecha_emision,
    fecha_pago,
    monto,
    metodo_pago,
    referencia,
    estado
)
SELECT
    t.id_contrato,
    cycle.issue_date,
    CASE
        WHEN t.payment_profile = 'stable' THEN cycle.issue_date + 2
        WHEN t.payment_profile = 'late' AND cycle.issue_date = DATE '2026-06-01' THEN NULL
        WHEN t.payment_profile = 'late' AND cycle.issue_date = DATE '2026-05-01' THEN cycle.issue_date + 13
        WHEN t.payment_profile = 'late' THEN cycle.issue_date + 5
        WHEN t.payment_profile = 'risk' AND cycle.issue_date IN (DATE '2026-05-01', DATE '2026-06-01') THEN NULL
        WHEN t.payment_profile = 'risk' THEN cycle.issue_date + 9
        WHEN t.payment_profile = 'corp' THEN cycle.issue_date + 1
        WHEN t.payment_profile = 'churn' AND cycle.issue_date >= DATE '2026-05-01' THEN NULL
        ELSE cycle.issue_date + 4
    END AS fecha_pago,
    t.precio_mensual,
    CASE
        WHEN t.payment_profile = 'corp' THEN 'transferencia'
        WHEN t.payment_profile = 'stable' THEN CASE WHEN EXTRACT(MONTH FROM cycle.issue_date)::INT % 2 = 0 THEN 'yape' ELSE 'plin' END
        WHEN t.payment_profile = 'late' THEN 'transferencia'
        WHEN t.payment_profile = 'risk' AND cycle.issue_date < DATE '2026-05-01' THEN 'efectivo'
        WHEN t.payment_profile = 'churn' AND cycle.issue_date < DATE '2026-05-01' THEN 'deposito'
        ELSE NULL
    END AS metodo_pago,
    CONCAT('I2-', t.dni, '-', to_char(cycle.issue_date, 'YYYYMM')) AS referencia,
    CASE
        WHEN t.payment_profile = 'stable' THEN 'pagado'
        WHEN t.payment_profile = 'late' AND cycle.issue_date = DATE '2026-06-01' THEN 'pendiente'
        WHEN t.payment_profile = 'late' THEN 'pagado'
        WHEN t.payment_profile = 'risk' AND cycle.issue_date = DATE '2026-06-01' THEN 'pendiente'
        WHEN t.payment_profile = 'risk' AND cycle.issue_date = DATE '2026-05-01' THEN 'vencido'
        WHEN t.payment_profile = 'risk' THEN 'pagado'
        WHEN t.payment_profile = 'corp' THEN 'pagado'
        WHEN t.payment_profile = 'churn' AND cycle.issue_date = DATE '2026-06-01' THEN 'pendiente'
        WHEN t.payment_profile = 'churn' AND cycle.issue_date = DATE '2026-05-01' THEN 'vencido'
        ELSE 'pagado'
    END AS estado
FROM tmp_contract_targets t
CROSS JOIN LATERAL (
    SELECT gs::date AS issue_date
    FROM generate_series(DATE '2026-03-01', DATE '2026-06-01', INTERVAL '1 month') AS gs
    WHERE gs::date >= date_trunc('month', t.fecha_inicio)::date
      AND (
          t.fecha_fin IS NULL
          OR gs::date <= date_trunc('month', t.fecha_fin)::date
      )
) AS cycle
WHERE NOT EXISTS (
    SELECT 1
    FROM pagos p
    WHERE p.id_contrato = t.id_contrato
      AND p.referencia = CONCAT('I2-', t.dni, '-', to_char(cycle.issue_date, 'YYYYMM'))
);

-- ---------------------------------------------------------
-- 5. INCIDENCIAS Y ENCUESTAS
-- ---------------------------------------------------------

CREATE TEMP TABLE tmp_seed_incidents (
    client_dni VARCHAR(15),
    contract_start_date DATE,
    site_key VARCHAR(100),
    fecha_reporte TIMESTAMP,
    tipo_incidencia VARCHAR(50),
    descripcion TEXT,
    prioridad VARCHAR(20),
    estado VARCHAR(20),
    fecha_resolucion TIMESTAMP,
    survey_date DATE,
    survey_score INT,
    survey_comment TEXT
);

INSERT INTO tmp_seed_incidents (
    client_dni,
    contract_start_date,
    site_key,
    fecha_reporte,
    tipo_incidencia,
    descripcion,
    prioridad,
    estado,
    fecha_resolucion,
    survey_date,
    survey_score,
    survey_comment
)
VALUES
    ('72000001', '2025-11-15', 'san ramon', '2026-04-12 09:20:00', 'internet lento', 'Variacion de velocidad en horas pico.', 'media', 'resuelta', '2026-04-12 18:10:00', '2026-04-13', 4, 'Mejoro despues del ajuste tecnico.'),
    ('72000002', '2025-12-10', 'la merced', '2026-06-08 11:00:00', 'facturacion', 'Consulta por cobro acumulado del ultimo ciclo.', 'media', 'resuelta', '2026-06-09 16:30:00', '2026-06-10', 3, 'Se resolvio, pero con demora.'),
    ('72000002', '2025-12-10', 'la merced', '2026-06-21 19:10:00', 'intermitencia', 'Microcortes en horario nocturno.', 'alta', 'en_proceso', NULL, NULL, NULL, NULL),
    ('72000003', '2026-01-10', 'llacta', '2026-05-18 08:40:00', 'sin servicio', 'Caida total del enlace en la zona.', 'alta', 'resuelta', '2026-05-18 15:00:00', '2026-05-19', 5, 'Atencion rapida y efectiva.'),
    ('72000004', '2025-10-25', 'pichanaqui', '2026-03-14 10:15:00', 'soporte empresarial', 'Ajuste de prioridad para trafico interno.', 'baja', 'cerrada', '2026-03-14 14:45:00', '2026-03-15', 5, 'Buen soporte para operacion empresarial.'),
    ('72000005', '2026-02-18', 'san ramon', '2026-06-02 17:00:00', 'internet lento', 'Cliente percibe baja velocidad en streaming.', 'media', 'cerrada', '2026-06-03 13:30:00', '2026-06-04', 4, 'La visita tecnica resolvio el problema.'),
    ('72000006', '2025-10-04', 'la merced', '2026-04-05 09:00:00', 'instalacion', 'Demoras acumuladas y mala coordinacion de visitas.', 'alta', 'resuelta', '2026-04-07 10:00:00', '2026-04-08', 2, 'La solucion llego demasiado tarde.'),
    ('72000007', '2026-01-25', 'llacta', '2026-06-19 07:50:00', 'sin servicio', 'Servicio interrumpido luego de tormenta.', 'critica', 'en_proceso', NULL, NULL, NULL, NULL),
    ('72000008', '2025-12-22', 'pichanaqui', '2026-06-11 15:10:00', 'facturacion', 'Cuenta suspendida requiere validacion de pago.', 'alta', 'registrada', NULL, NULL, NULL, NULL),
    ('72000009', '2026-03-08', 'san ramon', '2026-05-06 12:00:00', 'router', 'Router reinicia despues de varias horas de uso.', 'media', 'resuelta', '2026-05-06 18:40:00', '2026-05-07', 5, 'Quedo estable con el cambio de equipo.'),
    ('72000010', '2025-12-01', 'la merced', '2026-04-18 08:00:00', 'sin servicio', 'Fallas repetidas antes de la baja definitiva.', 'alta', 'resuelta', '2026-04-21 09:30:00', '2026-04-22', 1, 'A pesar de la solucion, decidio retirarse.'),
    ('72000011', '2025-08-21', 'llacta', '2026-05-28 14:20:00', 'soporte empresarial', 'Validacion de capacidad en ventana de mantenimiento.', 'baja', 'resuelta', '2026-05-28 18:10:00', '2026-05-29', 5, 'Atencion muy profesional y rapida.'),
    ('72000012', '2026-04-14', 'pichanaqui', '2026-06-16 16:30:00', 'instalacion', 'Solicitud de reubicacion del punto de red.', 'media', 'cerrada', '2026-06-17 12:30:00', '2026-06-18', 4, 'La visita fue ordenada y puntual.');

INSERT INTO incidencias (
    id_cliente,
    id_contrato,
    id_sede,
    fecha_reporte,
    tipo_incidencia,
    descripcion,
    prioridad,
    estado,
    fecha_resolucion
)
SELECT
    c.id_cliente,
    co.id_contrato,
    sl.id_sede,
    si.fecha_reporte,
    si.tipo_incidencia,
    si.descripcion,
    si.prioridad,
    si.estado,
    si.fecha_resolucion
FROM tmp_seed_incidents si
JOIN clientes c
    ON c.dni = si.client_dni
JOIN contratos co
    ON co.id_cliente = c.id_cliente
   AND co.fecha_inicio = si.contract_start_date
JOIN tmp_site_lookup sl
    ON sl.site_key = si.site_key
WHERE NOT EXISTS (
    SELECT 1
    FROM incidencias i
    WHERE i.id_cliente = c.id_cliente
      AND i.id_contrato = co.id_contrato
      AND i.fecha_reporte = si.fecha_reporte
);

INSERT INTO encuestas_satisfaccion (
    id_cliente,
    id_contrato,
    fecha_encuesta,
    puntaje,
    comentario
)
SELECT
    c.id_cliente,
    co.id_contrato,
    si.survey_date,
    si.survey_score,
    si.survey_comment
FROM tmp_seed_incidents si
JOIN clientes c
    ON c.dni = si.client_dni
JOIN contratos co
    ON co.id_cliente = c.id_cliente
   AND co.fecha_inicio = si.contract_start_date
WHERE si.survey_score IS NOT NULL
  AND NOT EXISTS (
      SELECT 1
      FROM encuestas_satisfaccion es
      WHERE es.id_cliente = c.id_cliente
        AND es.id_contrato = co.id_contrato
        AND es.fecha_encuesta = si.survey_date
  );

-- ---------------------------------------------------------
-- 6. SEGMENTACION Y PREDICCION DE CHURN
-- ---------------------------------------------------------

CREATE TEMP TABLE tmp_seed_ml (
    client_dni VARCHAR(15),
    cluster_kmeans INT,
    probability_churn NUMERIC(5, 2),
    nivel_riesgo VARCHAR(20),
    recomendacion TEXT
);

INSERT INTO tmp_seed_ml (
    client_dni,
    cluster_kmeans,
    probability_churn,
    nivel_riesgo,
    recomendacion
)
VALUES
    ('72000001', 1, 14.50, 'bajo', 'Mantener seguimiento comercial basico.'),
    ('72000002', 2, 43.00, 'medio', 'Ofrecer mejora de plan y revisar experiencia de pagos.'),
    ('72000003', 2, 18.00, 'bajo', 'Promover upgrade por buen uso del servicio.'),
    ('72000004', 3, 12.00, 'bajo', 'Conservar soporte preferente empresarial.'),
    ('72000005', 1, 38.00, 'medio', 'Aplicar recordatorios de cobranza preventiva.'),
    ('72000006', 4, 86.00, 'alto', 'Usar campana de recuperacion y encuesta de salida.'),
    ('72000007', 4, 67.00, 'medio', 'Priorizar soporte tecnico y seguimiento a incidencias.'),
    ('72000008', 4, 72.00, 'alto', 'Combinar cobranza preventiva con contacto comercial.'),
    ('72000009', 2, 11.00, 'bajo', 'Mantener comunicacion de fidelizacion.'),
    ('72000010', 4, 91.00, 'alto', 'Analizar causas de fuga y oferta de retorno.'),
    ('72000011', 3, 9.00, 'bajo', 'Conservar SLA y relacion ejecutiva.'),
    ('72000012', 1, 16.00, 'bajo', 'Acompanamiento post instalacion.');

INSERT INTO cliente_segmentacion (
    id_cliente,
    id_segmento,
    fecha_segmentacion,
    algoritmo,
    observacion
)
SELECT
    c.id_cliente,
    sk.id_segmento,
    TIMESTAMP '2026-06-25 10:00:00',
    'Seed insercion2',
    'Carga adicional coherente con cablebi_database.sql.'
FROM tmp_seed_ml ml
JOIN clientes c
    ON c.dni = ml.client_dni
JOIN segmentos_kmeans sk
    ON sk.cluster_kmeans = ml.cluster_kmeans
WHERE NOT EXISTS (
    SELECT 1
    FROM cliente_segmentacion cs
    WHERE cs.id_cliente = c.id_cliente
      AND cs.algoritmo = 'Seed insercion2'
);

INSERT INTO predicciones_churn (
    id_cliente,
    fecha_prediccion,
    probabilidad_churn,
    nivel_riesgo,
    algoritmo,
    recomendacion
)
SELECT
    c.id_cliente,
    TIMESTAMP '2026-06-25 11:30:00',
    ml.probability_churn,
    ml.nivel_riesgo,
    'Seed insercion2',
    ml.recomendacion
FROM tmp_seed_ml ml
JOIN clientes c
    ON c.dni = ml.client_dni
WHERE NOT EXISTS (
    SELECT 1
    FROM predicciones_churn pc
    WHERE pc.id_cliente = c.id_cliente
      AND pc.algoritmo = 'Seed insercion2'
);

-- ---------------------------------------------------------
-- 7. REPORTES Y AUDITORIA
-- ---------------------------------------------------------

INSERT INTO reportes_exportados (
    id_usuario,
    tipo_reporte,
    formato,
    fecha_exportacion,
    filtros
)
SELECT
    u.id_usuario,
    'Reporte regional junio 2026',
    'excel',
    TIMESTAMP '2026-06-20 09:15:00',
    '{"region":"Junin","periodo":"2026-06"}'::jsonb
FROM tmp_user_lookup u
WHERE u.usuario = 'admin'
  AND NOT EXISTS (
      SELECT 1
      FROM reportes_exportados re
      WHERE re.id_usuario = u.id_usuario
        AND re.tipo_reporte = 'Reporte regional junio 2026'
        AND re.fecha_exportacion = TIMESTAMP '2026-06-20 09:15:00'
  );

INSERT INTO reportes_exportados (
    id_usuario,
    tipo_reporte,
    formato,
    fecha_exportacion,
    filtros
)
SELECT
    u.id_usuario,
    'Seguimiento churn cartera comercial',
    'pdf',
    TIMESTAMP '2026-06-24 18:20:00',
    '{"modulo":"ml","riesgo_minimo":"medio"}'::jsonb
FROM tmp_user_lookup u
WHERE u.usuario = 'admin'
  AND NOT EXISTS (
      SELECT 1
      FROM reportes_exportados re
      WHERE re.id_usuario = u.id_usuario
        AND re.tipo_reporte = 'Seguimiento churn cartera comercial'
        AND re.fecha_exportacion = TIMESTAMP '2026-06-24 18:20:00'
  );

INSERT INTO auditoria (
    id_usuario,
    tabla_afectada,
    accion,
    registro_id,
    datos_anteriores,
    datos_nuevos,
    fecha_accion
)
SELECT
    u.id_usuario,
    'clientes',
    'INSERT',
    c.id_cliente,
    NULL,
    jsonb_build_object('dni', c.dni, 'estado', c.estado),
    TIMESTAMP '2026-06-25 08:30:00'
FROM tmp_user_lookup u
JOIN clientes c
    ON c.dni = '72000012'
WHERE u.usuario = 'admin'
  AND NOT EXISTS (
      SELECT 1
      FROM auditoria a
      WHERE a.tabla_afectada = 'clientes'
        AND a.accion = 'INSERT'
        AND a.registro_id = c.id_cliente
        AND a.fecha_accion = TIMESTAMP '2026-06-25 08:30:00'
  );

INSERT INTO auditoria (
    id_usuario,
    tabla_afectada,
    accion,
    registro_id,
    datos_anteriores,
    datos_nuevos,
    fecha_accion
)
SELECT
    u.id_usuario,
    'reportes_exportados',
    'EXPORT',
    NULL,
    NULL,
    '{"tipo":"Seguimiento churn cartera comercial","formato":"pdf"}'::jsonb,
    TIMESTAMP '2026-06-24 18:21:00'
FROM tmp_user_lookup u
WHERE u.usuario = 'admin'
  AND NOT EXISTS (
      SELECT 1
      FROM auditoria a
      WHERE a.tabla_afectada = 'reportes_exportados'
        AND a.accion = 'EXPORT'
        AND a.fecha_accion = TIMESTAMP '2026-06-24 18:21:00'
  );

COMMIT;

-- Verificaciones sugeridas:
-- SELECT COUNT(*) FROM cablebi.clientes;
-- SELECT COUNT(*) FROM cablebi.contratos;
-- SELECT COUNT(*) FROM cablebi.pagos;
-- SELECT COUNT(*) FROM cablebi.incidencias;
-- SELECT COUNT(*) FROM cablebi.encuestas_satisfaccion;
-- SELECT COUNT(*) FROM cablebi.predicciones_churn;
