-- =========================================================
-- SOLO DATOS DE ACCESS PARA LA BASE CABLEBI
-- Fuente: CABLE(1).accdb
-- Uso: ejecutar DESPUÉS de haber creado la estructura del esquema cablebi.
-- Este script NO crea base de datos, NO crea esquema y NO crea tablas.
-- Solo inserta/actualiza datos en las tablas cablebi existentes.
-- =========================================================

BEGIN;

-- Verifica que el esquema cablebi exista
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.schemata WHERE schema_name = 'cablebi'
    ) THEN
        RAISE EXCEPTION 'No existe el esquema cablebi. Primero ejecuta el script de estructura de CableBI.';
    END IF;
END $$;

SET search_path TO cablebi;

-- IMPORTANTE:
-- Si deseas dejar las tablas vacías antes de cargar los datos de Access,
-- descomenta el siguiente TRUNCATE.
-- TRUNCATE TABLE reportes_exportados, auditoria, predicciones_churn, cliente_segmentacion,
-- encuestas_satisfaccion, incidencias, pagos, contratos, clientes, planes, sedes
-- RESTART IDENTITY CASCADE;


-- =========================================================
-- SEDES
-- =========================================================
INSERT INTO cablebi.sedes
(id_sede, nombre_sede, ciudad, provincia, region, direccion, telefono, es_expansion, estado)
VALUES (2, 'San Ramon', 'San Ramon', 'Chanchamayo', 'Junin', 'No registrada', NULL, FALSE, 'activo')
ON CONFLICT (id_sede) DO UPDATE SET
    nombre_sede = EXCLUDED.nombre_sede,
    ciudad = EXCLUDED.ciudad,
    provincia = EXCLUDED.provincia,
    region = EXCLUDED.region,
    direccion = EXCLUDED.direccion,
    telefono = EXCLUDED.telefono,
    es_expansion = EXCLUDED.es_expansion,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.sedes
(id_sede, nombre_sede, ciudad, provincia, region, direccion, telefono, es_expansion, estado)
VALUES (3, 'La Merced', 'La Merced', 'Chanchamayo', 'Junin', 'No registrada', NULL, FALSE, 'activo')
ON CONFLICT (id_sede) DO UPDATE SET
    nombre_sede = EXCLUDED.nombre_sede,
    ciudad = EXCLUDED.ciudad,
    provincia = EXCLUDED.provincia,
    region = EXCLUDED.region,
    direccion = EXCLUDED.direccion,
    telefono = EXCLUDED.telefono,
    es_expansion = EXCLUDED.es_expansion,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.sedes
(id_sede, nombre_sede, ciudad, provincia, region, direccion, telefono, es_expansion, estado)
VALUES (4, 'Llacta', 'Llacta', 'Huánuco', 'Huanuco', 'No registrada', NULL, FALSE, 'activo')
ON CONFLICT (id_sede) DO UPDATE SET
    nombre_sede = EXCLUDED.nombre_sede,
    ciudad = EXCLUDED.ciudad,
    provincia = EXCLUDED.provincia,
    region = EXCLUDED.region,
    direccion = EXCLUDED.direccion,
    telefono = EXCLUDED.telefono,
    es_expansion = EXCLUDED.es_expansion,
    estado = EXCLUDED.estado;

-- =========================================================
-- PLANES
-- =========================================================
INSERT INTO cablebi.planes
(id_plan, nombre_plan, tipo_servicio, categoria_comercial, velocidad_mbps, precio_mensual, estado)
VALUES (1, 'Basico', 'internet', 'basico', 100, 50.0, 'activo')
ON CONFLICT (id_plan) DO UPDATE SET
    nombre_plan = EXCLUDED.nombre_plan,
    tipo_servicio = EXCLUDED.tipo_servicio,
    categoria_comercial = EXCLUDED.categoria_comercial,
    velocidad_mbps = EXCLUDED.velocidad_mbps,
    precio_mensual = EXCLUDED.precio_mensual,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.planes
(id_plan, nombre_plan, tipo_servicio, categoria_comercial, velocidad_mbps, precio_mensual, estado)
VALUES (2, 'Estandar', 'internet', 'estandar', 150, 60.0, 'activo')
ON CONFLICT (id_plan) DO UPDATE SET
    nombre_plan = EXCLUDED.nombre_plan,
    tipo_servicio = EXCLUDED.tipo_servicio,
    categoria_comercial = EXCLUDED.categoria_comercial,
    velocidad_mbps = EXCLUDED.velocidad_mbps,
    precio_mensual = EXCLUDED.precio_mensual,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.planes
(id_plan, nombre_plan, tipo_servicio, categoria_comercial, velocidad_mbps, precio_mensual, estado)
VALUES (3, 'Plus', 'internet', 'plus', 300, 80.0, 'activo')
ON CONFLICT (id_plan) DO UPDATE SET
    nombre_plan = EXCLUDED.nombre_plan,
    tipo_servicio = EXCLUDED.tipo_servicio,
    categoria_comercial = EXCLUDED.categoria_comercial,
    velocidad_mbps = EXCLUDED.velocidad_mbps,
    precio_mensual = EXCLUDED.precio_mensual,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.planes
(id_plan, nombre_plan, tipo_servicio, categoria_comercial, velocidad_mbps, precio_mensual, estado)
VALUES (4, 'Premium', 'internet', 'premium', 500, 100.0, 'activo')
ON CONFLICT (id_plan) DO UPDATE SET
    nombre_plan = EXCLUDED.nombre_plan,
    tipo_servicio = EXCLUDED.tipo_servicio,
    categoria_comercial = EXCLUDED.categoria_comercial,
    velocidad_mbps = EXCLUDED.velocidad_mbps,
    precio_mensual = EXCLUDED.precio_mensual,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.planes
(id_plan, nombre_plan, tipo_servicio, categoria_comercial, velocidad_mbps, precio_mensual, estado)
VALUES (5, 'Empresarial Basico', 'internet', 'empresarial', 700, 150.0, 'activo')
ON CONFLICT (id_plan) DO UPDATE SET
    nombre_plan = EXCLUDED.nombre_plan,
    tipo_servicio = EXCLUDED.tipo_servicio,
    categoria_comercial = EXCLUDED.categoria_comercial,
    velocidad_mbps = EXCLUDED.velocidad_mbps,
    precio_mensual = EXCLUDED.precio_mensual,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.planes
(id_plan, nombre_plan, tipo_servicio, categoria_comercial, velocidad_mbps, precio_mensual, estado)
VALUES (6, 'Empresarial Estandar', 'internet', 'empresarial', 1000, 200.0, 'activo')
ON CONFLICT (id_plan) DO UPDATE SET
    nombre_plan = EXCLUDED.nombre_plan,
    tipo_servicio = EXCLUDED.tipo_servicio,
    categoria_comercial = EXCLUDED.categoria_comercial,
    velocidad_mbps = EXCLUDED.velocidad_mbps,
    precio_mensual = EXCLUDED.precio_mensual,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.planes
(id_plan, nombre_plan, tipo_servicio, categoria_comercial, velocidad_mbps, precio_mensual, estado)
VALUES (7, 'Empresarial Plus', 'internet', 'empresarial', 1500, 250.0, 'activo')
ON CONFLICT (id_plan) DO UPDATE SET
    nombre_plan = EXCLUDED.nombre_plan,
    tipo_servicio = EXCLUDED.tipo_servicio,
    categoria_comercial = EXCLUDED.categoria_comercial,
    velocidad_mbps = EXCLUDED.velocidad_mbps,
    precio_mensual = EXCLUDED.precio_mensual,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.planes
(id_plan, nombre_plan, tipo_servicio, categoria_comercial, velocidad_mbps, precio_mensual, estado)
VALUES (8, 'Empresarial Premium', 'internet', 'empresarial', 2000, 300.0, 'activo')
ON CONFLICT (id_plan) DO UPDATE SET
    nombre_plan = EXCLUDED.nombre_plan,
    tipo_servicio = EXCLUDED.tipo_servicio,
    categoria_comercial = EXCLUDED.categoria_comercial,
    velocidad_mbps = EXCLUDED.velocidad_mbps,
    precio_mensual = EXCLUDED.precio_mensual,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.planes
(id_plan, nombre_plan, tipo_servicio, categoria_comercial, velocidad_mbps, precio_mensual, estado)
VALUES (9, 'Empresarial Premium +', 'internet', 'corporativo', 2500, 350.0, 'activo')
ON CONFLICT (id_plan) DO UPDATE SET
    nombre_plan = EXCLUDED.nombre_plan,
    tipo_servicio = EXCLUDED.tipo_servicio,
    categoria_comercial = EXCLUDED.categoria_comercial,
    velocidad_mbps = EXCLUDED.velocidad_mbps,
    precio_mensual = EXCLUDED.precio_mensual,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.planes
(id_plan, nombre_plan, tipo_servicio, categoria_comercial, velocidad_mbps, precio_mensual, estado)
VALUES (10, 'Empresarial Black', 'internet', 'corporativo', 3000, 400.0, 'activo')
ON CONFLICT (id_plan) DO UPDATE SET
    nombre_plan = EXCLUDED.nombre_plan,
    tipo_servicio = EXCLUDED.tipo_servicio,
    categoria_comercial = EXCLUDED.categoria_comercial,
    velocidad_mbps = EXCLUDED.velocidad_mbps,
    precio_mensual = EXCLUDED.precio_mensual,
    estado = EXCLUDED.estado;

-- =========================================================
-- CLIENTES
-- =========================================================
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (1, 2, '75473846', 'Jose Luis', 'Sulla Corbetta', '906983532', NULL, 'No registrada', 'natural', '2024-05-25', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (2, 2, '73382006', 'Xande', 'Tejed Guevara', '970029524', NULL, 'No registrada', 'natural', '2024-05-26', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (3, 2, '72561380', 'Susan', 'Carol Palacio', '916179523', NULL, 'No registrada', 'natural', '2024-05-27', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (4, 2, '40151234', 'Jenny', 'Corbetta Toscano', '941861398', NULL, 'No registrada', 'natural', '2024-05-28', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (5, 2, '71777298', 'Jennifer', 'Pillhuaman Corbetta', '968288128', NULL, 'No registrada', 'natural', '2024-05-28', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (6, 2, '71777299', 'Hade', 'Pillhuaman Corbetta', '950790537', NULL, 'No registrada', 'natural', '2024-05-28', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (7, 2, '20043464', 'Salome', 'Flores Javier', '973652792', NULL, 'No registrada', 'natural', '2024-05-28', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (8, 2, '43377312', 'John', 'Cañari Bogo', '953462768', NULL, 'No registrada', 'natural', '2024-05-29', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (9, 2, '20546273', 'Arnaldo', 'Corbetta Carranza', '982356145', NULL, 'No registrada', 'natural', '2024-05-29', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (10, 2, '23686921', 'Danny', 'Yaringaño Luis', '976804241', NULL, 'No registrada', 'natural', '2024-05-29', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (11, 2, '20547263', 'Juan Laurel', 'Nieto Pinto', '985662253', NULL, 'No registrada', 'natural', '2024-05-30', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (12, 2, '72867994', 'Jair', 'Caso Hilario', '900764804', NULL, 'No registrada', 'natural', '2024-05-30', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (13, 2, '77036997', 'Helen', 'Revollar Lopez', '977921463', NULL, 'No registrada', 'natural', '2024-06-01', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (14, 2, '20578583', 'Diogenes', 'Sulla Castellanos', '983564275', NULL, 'No registrada', 'natural', '2024-06-01', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (15, 2, '19927004', 'Benigno', 'Palacios Aguilar', '956052657', NULL, 'No registrada', 'natural', '2024-06-02', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (16, 2, '73382029', 'Jhon Luis', 'Pomajambo Chancas', '985646218', NULL, 'No registrada', 'natural', '2024-06-03', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (17, 2, '73382030', 'Jhony', 'Pomajambo Chancas', '965298345', NULL, 'No registrada', 'natural', '2024-06-04', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (18, 2, '20041495', 'Ana Elva', 'Matos Olivera', '986452047', NULL, 'No registrada', 'natural', '2024-06-05', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (19, 2, '76342417', 'Mariela', 'Venegas Sullca', '905001598', NULL, 'No registrada', 'natural', '2024-06-06', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (20, 2, '75901311', 'Reyna', 'Apaza Rondon', '960870552', NULL, 'No registrada', 'natural', '2024-06-27', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (21, 2, '73883528', 'Jose Luis', 'Palomino Aylas', '957793164', NULL, 'No registrada', 'natural', '2024-06-27', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (22, 2, '72867634', 'Shanon', 'Rosas Macuri', '921560784', NULL, 'No registrada', 'natural', '2024-06-28', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (23, 2, '73539085', 'Angie', 'Gago Palpan', '905681048', NULL, 'No registrada', 'natural', '2024-06-28', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (24, 2, '60408348', 'Karen', 'Enciso Napuche', '931746004', NULL, 'No registrada', 'natural', '2024-06-29', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (25, 2, '75660972', 'Lucero', 'Pipa Paucar', '900025654', NULL, 'No registrada', 'natural', '2024-07-31', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (26, 2, '47935444', 'Luis Rafael', 'Gonzales Aliaga', '910406475', NULL, 'No registrada', 'natural', '2024-07-31', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (27, 2, '41396527', 'Ronald Alex', 'Nieto Bogo', '960854382', NULL, 'No registrada', 'natural', '2024-08-01', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (28, 2, '43730130', 'Orlando', 'Minaya Hidalgo', '951593154', NULL, 'No registrada', 'natural', '2024-08-02', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (29, 3, '71135348', 'Antonella', 'Jange Palomino', '974240044', NULL, 'No registrada', 'natural', '2024-08-03', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (30, 3, '46743712', 'Angelina', 'Velazque Cruz', '952555645', NULL, 'No registrada', 'natural', '2024-08-05', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (31, 3, '60754646', 'Abraham', 'Mera Samaniego', '972648999', NULL, 'No registrada', 'natural', '2024-08-06', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (32, 2, '60528946', 'Angelo', 'valencia', '925634887', NULL, 'No registrada', 'natural', '2024-08-07', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (33, 2, '49823541', 'Eduardo', 'Huanquin Sanabria', '985631197', NULL, 'No registrada', 'natural', '2024-08-09', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (34, 2, '46945890', 'Simon', 'Ochandarte Palomino', '982356642', NULL, 'No registrada', 'natural', '2024-08-10', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (35, 2, '76473492', 'Leydi', 'Calero Lopez', '905781643', NULL, 'No registrada', 'natural', '2024-08-12', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (36, 2, '43326084', 'Julio', 'Payano Toscano', '965848734', NULL, 'No registrada', 'natural', '2024-08-13', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (37, 2, '76971479', 'Brad', 'Valencia Valdivia', '942250199', NULL, 'No registrada', 'natural', '2024-08-14', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (38, 3, '20524299', 'Luis', 'Jange Medina', '962453153', NULL, 'No registrada', 'natural', '2024-08-15', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (39, 4, '08541660', 'James', 'Oscco Ortiz', '934567305', NULL, 'No registrada', 'natural', '2024-08-16', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (40, 4, '46248014', 'Julie Medaly', 'Yanac Diaz', '926293483', NULL, 'No registrada', 'natural', '2024-08-17', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (41, 2, '71423448', 'Milagros', 'Campos Leon', '906845028', NULL, 'No registrada', 'natural', '2024-08-19', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (42, 4, '08563456', 'Jreisy', 'Crocco Solano', '908354000', NULL, 'No registrada', 'natural', '2024-08-20', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (43, 2, '20561673', 'Marleny', 'Huaman Sinchez', '926784101', NULL, 'No registrada', 'natural', '2024-08-21', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (44, 4, '72734593', 'Bianca', 'Roman Osco', '972734593', NULL, 'No registrada', 'natural', '2024-08-22', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (45, 2, '76002644', 'Bryan', 'Quispe Eslachin', '976002644', NULL, 'No registrada', 'natural', '2024-08-23', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (46, 4, '41332821', 'Carlos Andres', 'Vilca Toscano', '941332821', NULL, 'No registrada', 'natural', '2024-08-24', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (47, 2, '70303524', 'Pedro', 'Dias Saire', '970303524', NULL, 'No registrada', 'natural', '2024-08-28', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (48, 4, '20993126', 'Javier', 'Llanco Huayta', '920993126', NULL, 'No registrada', 'natural', '2024-08-29', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (49, 4, '41510247', 'Denisse', 'Veliz Bogo', '941104472', NULL, 'No registrada', 'natural', '2024-08-29', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (50, 4, '70320927', 'Jhon Ciro', 'Mercado Galarza', '970320927', NULL, 'No registrada', 'natural', '2024-09-03', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (51, 3, '76420493', 'Jhon Michael', 'Mercado Galarza', '976204932', NULL, 'No registrada', 'natural', '2024-09-04', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (52, 2, '20740173', 'Moises', 'Cuadros Moya', '920740173', NULL, 'No registrada', 'natural', '2024-09-05', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (53, 3, '41057818', 'Maria Eugenia', 'Herrera Cueva', '940578180', NULL, 'No registrada', 'natural', '2024-09-06', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (54, 2, '71850791', 'Josias', 'Poma Huarcaya', '985079171', NULL, 'No registrada', 'natural', '2024-09-07', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (55, 3, '70241042', 'David Ivan', 'Culis Ricaldi', '910427024', NULL, 'No registrada', 'natural', '2024-09-09', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (56, 3, '72082086', 'Piero', 'Alpaca Vaccara', '902568164', NULL, 'No registrada', 'natural', '2024-09-10', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (57, 3, '62101441', 'Juan Carlos', 'Velasquez Hoyos', '962101441', NULL, 'No registrada', 'natural', '2024-09-11', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (58, 3, '74286135', 'Luis Alberto', 'Ramírez Poma', '947582314', NULL, 'No registrada', 'natural', '2024-09-12', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (59, 4, '73195482', 'María Fernanda', 'Quispe Salazar', '973195482', NULL, 'No registrada', 'natural', '2024-09-13', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (60, 4, '76841329', 'José Antonio', 'Huamán Rojas', '976841329', NULL, 'No registrada', 'natural', '2024-09-14', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (61, 4, '71482596', 'Carla Milagros', 'Torres Vega', '965318240', NULL, 'No registrada', 'natural', '2024-09-24', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (62, 4, '75963184', 'Diego Sebastián', 'Flores Aliaga', '912684579', NULL, 'No registrada', 'natural', '2024-09-25', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (63, 3, '72651843', 'Andrea Lucía', 'Mendoza Castro', '972651843', NULL, 'No registrada', 'natural', '2024-09-26', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (64, 3, '74839251', 'Kevin Alexander', 'Paredes León', '974839251', NULL, 'No registrada', 'natural', '2024-09-27', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (65, 3, '73527481', 'Fiorella Nicole', 'Sánchez Ramos', '973527481', NULL, 'No registrada', 'natural', '2024-09-27', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (66, 3, '76194028', 'Renato Javier', 'Gutiérrez Silva', '952045325', NULL, 'No registrada', 'natural', '2024-01-01', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (67, 3, '71948356', 'Paola Estefany', 'Chávez Díaz', '987364921', NULL, 'No registrada', 'natural', '2024-09-28', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (68, 3, '73815264', 'Daniela Alejandra', 'Ortiz Cárdenas', '973815264', NULL, 'No registrada', 'natural', '2024-10-01', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (69, 3, '74593821', 'Miguel Ángel', 'Ríos Palomino', '974593821', NULL, 'No registrada', 'natural', '2024-10-02', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (70, 3, '72964185', 'Valeria Antonella', 'Navarro Soto', '956908435', NULL, 'No registrada', 'natural', '2024-10-03', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (71, 3, '76320517', 'Brayan Steven', 'Castillo Huerta', '976320517', NULL, 'No registrada', 'natural', '2024-10-04', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (72, 3, '71758392', 'Camila Fernanda', 'López Ponce', '971758392', NULL, 'No registrada', 'natural', '2024-10-15', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (73, 3, '75486230', 'Anthony Gabriel', 'Rivera Medina', '975486230', NULL, 'No registrada', 'natural', '2024-10-16', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (74, 3, '73314068', 'Lucero Beatriz', 'Aquino Reyes', '973314068', NULL, 'No registrada', 'natural', '2024-10-17', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (75, 4, '76952413', 'Jean Pierre', 'Delgado Peña', '976952413', NULL, 'No registrada', 'natural', '2024-10-18', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (76, 4, '72183657', 'Rosa Elena', 'Cárdenas Villanueva', '989542730', NULL, 'No registrada', 'natural', '2024-01-01', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (77, 4, '74826139', 'Bryan Alexis', 'Mendoza Rojas', '946217598', NULL, 'No registrada', 'natural', '2024-10-19', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (78, 4, '73251984', 'Katherine Lizbeth', 'Poma Huerta', '973251984', NULL, 'No registrada', 'natural', '2024-10-21', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (79, 3, '76483025', 'Julio César', 'Salas Torres', '923658761', NULL, 'No registrada', 'natural', '2024-10-22', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (80, 3, '71928463', 'Melany Xiomara', 'Díaz Quispe', '958772309', NULL, 'No registrada', 'natural', '2024-10-23', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (81, 3, '75169328', 'Jorge Luis', 'Navarro Peña', '975169328', NULL, 'No registrada', 'natural', '2024-10-24', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (82, 3, '72745091', 'Diana Carolina', 'Flores Castro', '972745091', NULL, 'No registrada', 'natural', '2024-10-25', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (83, 4, '74312856', 'Edwin Renato', 'Vargas Aliaga', '974312856', NULL, 'No registrada', 'natural', '2024-10-26', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (84, 2, '73698214', 'Sharon Nicole', 'Medina León', '965371729', NULL, 'No registrada', 'natural', '2024-10-28', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (85, 2, '75847130', 'Marco Antonio', 'Rojas Silva', '975847130', NULL, 'No registrada', 'natural', '2024-10-28', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (86, 2, '72461587', 'Cinthia Milagros', 'Huamán Vera', '981436298', NULL, 'No registrada', 'natural', '2024-10-30', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (87, 3, '76913524', 'Ángel Sebastián', 'Chávez Paredes', '976913524', NULL, 'No registrada', 'natural', '2024-01-01', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (89, 3, '71896245', 'Tatiana Fernanda', 'Gutiérrez Ramos', '971896245', NULL, 'No registrada', 'natural', '2024-11-04', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (90, 4, '74732068', 'Luis Enrique', 'Palomino Soto', '974732068', NULL, 'No registrada', 'natural', '2024-11-05', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (91, 2, '73428195', 'Andrea Patricia', 'Castillo Núñez', '973428195', NULL, 'No registrada', 'natural', '2024-11-06', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (92, 3, '76205439', 'Sergio Iván', 'Torres Cárdenas', '976205439', NULL, 'No registrada', 'natural', '2024-11-08', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (93, 3, '72148736', 'Pamela Alejandra', 'Ríos Vega', '982645200', NULL, 'No registrada', 'natural', '2024-11-09', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (94, 2, '75369412', 'Jonathan David', 'Rivera Salazar', '932198864', NULL, 'No registrada', 'natural', '2024-11-11', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (95, 3, '73915287', 'Nicole Estefanía', 'Delgado Ponce', '980623715', NULL, 'No registrada', 'natural', '2024-11-12', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (96, 3, '74658193', 'César Augusto', 'Mendoza Chávez', '947351408', NULL, 'No registrada', 'natural', '2024-11-13', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (97, 3, '72834051', 'Lucía Fernanda', 'Aquino Medina', '954886237', NULL, 'No registrada', 'natural', '2024-11-15', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (98, 3, '76192438', 'Ricardo Emanuel', 'Flores Reyes', '979418635', NULL, 'No registrada', 'natural', '2024-11-18', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (99, 3, '71763084', 'Valentina Rocío', 'Quispe León', '979285023', NULL, 'No registrada', 'natural', '2024-11-19', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (100, 3, '73049526', 'María José', 'Cárdenas Silva', '987190642', NULL, 'No registrada', 'natural', '2024-11-25', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;

-- =========================================================
-- CONTRATOS
-- =========================================================
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (1, 1, 2, 3, '2024-05-25', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (2, 1, 2, 1, '2024-05-26', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (3, 2, 2, 2, '2024-05-26', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (4, 3, 2, 3, '2024-05-27', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (5, 3, 2, 1, '2024-05-27', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (6, 4, 2, 1, '2024-05-28', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (7, 5, 2, 1, '2024-05-28', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (8, 6, 2, 1, '2024-05-28', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (9, 7, 2, 1, '2024-05-28', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (10, 8, 2, 4, '2024-05-29', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (11, 9, 2, 2, '2024-05-29', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (12, 10, 2, 3, '2024-05-29', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (13, 11, 2, 1, '2024-05-30', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (14, 12, 2, 1, '2024-05-30', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (15, 13, 2, 1, '2024-06-01', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (16, 14, 2, 1, '2024-06-01', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (17, 15, 2, 3, '2024-06-02', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (18, 15, 2, 1, '2024-06-02', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (19, 16, 2, 1, '2024-06-03', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (20, 17, 2, 1, '2024-06-04', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (21, 18, 2, 2, '2024-06-05', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (22, 19, 2, 1, '2024-06-06', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (23, 20, 2, 1, '2024-06-27', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (24, 21, 2, 4, '2024-06-27', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (25, 22, 2, 2, '2024-06-28', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (26, 23, 2, 1, '2024-06-28', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (27, 24, 2, 1, '2024-06-29', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (28, 25, 2, 1, '2024-07-31', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (29, 26, 2, 6, '2024-07-31', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (30, 27, 2, 6, '2024-08-01', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (31, 27, 2, 2, '2024-08-01', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (32, 28, 2, 4, '2024-08-02', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (33, 29, 3, 1, '2024-08-03', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (34, 30, 3, 1, '2024-08-05', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (35, 31, 3, 2, '2024-08-06', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (36, 32, 2, 7, '2024-08-07', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (37, 32, 2, 2, '2024-08-08', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (38, 33, 2, 5, '2024-08-09', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (39, 34, 2, 1, '2024-08-10', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (40, 35, 2, 1, '2024-08-12', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (41, 36, 2, 1, '2024-08-13', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (42, 37, 2, 7, '2024-08-14', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (43, 37, 2, 1, '2024-08-14', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (44, 38, 3, 1, '2024-08-15', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (45, 39, 4, 3, '2024-08-16', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (46, 40, 4, 1, '2024-08-17', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (47, 41, 2, 1, '2024-08-19', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (48, 42, 4, 1, '2024-08-20', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (49, 43, 2, 1, '2024-08-21', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (50, 44, 4, 1, '2024-08-22', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (51, 45, 2, 2, '2024-08-23', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (52, 46, 4, 4, '2024-08-24', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (53, 47, 2, 1, '2024-08-28', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (54, 48, 4, 1, '2024-08-29', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (55, 49, 4, 5, '2024-08-29', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (56, 50, 4, 3, '2024-09-03', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (57, 51, 3, 1, '2024-09-04', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (58, 52, 2, 1, '2024-09-05', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (59, 53, 3, 2, '2024-09-06', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (60, 54, 2, 1, '2024-09-07', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (61, 55, 3, 6, '2024-09-09', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (62, 56, 3, 1, '2024-09-10', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (63, 57, 3, 2, '2024-09-11', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (64, 58, 3, 2, '2024-09-12', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (65, 59, 4, 3, '2024-09-13', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (66, 60, 4, 3, '2024-09-14', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (67, 61, 4, 2, '2024-09-24', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (68, 62, 4, 1, '2024-09-25', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (69, 63, 3, 1, '2024-09-26', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (70, 64, 3, 4, '2024-09-27', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (71, 65, 3, 2, '2024-09-27', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (72, 67, 3, 2, '2024-09-28', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (73, 68, 3, 2, '2024-10-01', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (74, 69, 3, 3, '2024-10-02', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (75, 70, 3, 2, '2024-10-03', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (76, 71, 3, 2, '2024-10-04', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (77, 72, 3, 1, '2024-10-15', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (78, 73, 3, 1, '2024-10-16', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (79, 74, 3, 8, '2024-10-17', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (80, 75, 4, 6, '2024-10-18', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (81, 77, 4, 1, '2024-10-19', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (82, 78, 4, 1, '2024-10-21', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (83, 79, 3, 10, '2024-10-22', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (84, 79, 3, 2, '2024-10-22', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (85, 80, 3, 2, '2024-10-23', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (86, 81, 3, 3, '2024-10-24', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (87, 82, 3, 3, '2024-10-25', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (88, 83, 4, 2, '2024-10-26', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (89, 84, 2, 1, '2024-10-28', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (90, 85, 2, 4, '2024-10-28', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (91, 86, 2, 5, '2024-10-30', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (92, 89, 3, 7, '2024-11-04', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (93, 90, 4, 1, '2024-11-05', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (94, 91, 2, 8, '2024-11-06', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (95, 91, 2, 1, '2024-11-07', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (96, 92, 3, 8, '2024-11-08', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (97, 93, 3, 1, '2024-11-09', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (98, 94, 2, 1, '2024-11-11', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (99, 95, 3, 2, '2024-11-12', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (100, 96, 3, 7, '2024-11-13', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (101, 96, 3, 1, '2024-11-13', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (102, 97, 3, 3, '2024-11-15', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (103, 98, 3, 1, '2024-11-18', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (104, 99, 3, 2, '2024-11-19', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (105, 100, 3, 4, '2024-11-25', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;

-- =========================================================
-- PAGOS
-- =========================================================
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (1, 1, '2024-05-25', '2024-05-25', 80.0, NULL, 'ACCESS-1', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (2, 1, '2024-06-25', '2024-06-25', 80.0, NULL, 'ACCESS-2', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (3, 1, '2024-07-25', '2024-07-25', 80.0, NULL, 'ACCESS-3', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (4, 1, '2024-08-25', '2024-08-25', 80.0, NULL, 'ACCESS-4', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (5, 1, '2024-09-25', '2024-09-25', 80.0, NULL, 'ACCESS-5', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (6, 1, '2024-10-25', '2024-10-25', 80.0, NULL, 'ACCESS-6', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (7, 1, '2024-11-25', '2024-11-25', 80.0, NULL, 'ACCESS-7', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (8, 2, '2024-05-26', '2024-05-26', 50.0, NULL, 'ACCESS-8', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (9, 2, '2024-06-26', '2024-06-26', 50.0, NULL, 'ACCESS-9', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (10, 2, '2024-07-26', '2024-07-26', 50.0, NULL, 'ACCESS-10', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (11, 2, '2024-08-26', '2024-08-26', 50.0, NULL, 'ACCESS-11', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (12, 2, '2024-09-26', '2024-09-26', 50.0, NULL, 'ACCESS-12', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (13, 2, '2024-10-26', '2024-10-26', 50.0, NULL, 'ACCESS-13', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (14, 2, '2024-11-26', '2024-11-26', 50.0, NULL, 'ACCESS-14', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (15, 3, '2024-05-26', '2024-05-26', 60.0, NULL, 'ACCESS-15', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (16, 3, '2024-06-26', '2024-06-26', 60.0, NULL, 'ACCESS-16', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (17, 3, '2024-07-26', '2024-07-26', 60.0, NULL, 'ACCESS-17', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (18, 3, '2024-08-26', '2024-08-26', 60.0, NULL, 'ACCESS-18', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (19, 3, '2024-09-26', '2024-09-26', 60.0, NULL, 'ACCESS-19', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (20, 3, '2024-10-26', '2024-10-26', 60.0, NULL, 'ACCESS-20', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (21, 3, '2024-11-26', '2024-11-26', 60.0, NULL, 'ACCESS-21', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (22, 2, '2024-12-26', '2024-12-26', 0.0, NULL, 'ACCESS-22', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (23, 4, '2024-05-27', '2024-05-27', 80.0, NULL, 'ACCESS-23', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (24, 4, '2024-06-27', '2024-06-27', 80.0, NULL, 'ACCESS-24', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (25, 4, '2024-07-27', '2024-07-27', 80.0, NULL, 'ACCESS-25', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (26, 4, '2024-08-27', '2024-08-27', 80.0, NULL, 'ACCESS-26', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (27, 4, '2024-09-27', '2024-09-27', 80.0, NULL, 'ACCESS-27', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (28, 4, '2024-10-27', '2024-10-27', 80.0, NULL, 'ACCESS-28', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (29, 4, '2024-11-27', '2024-11-27', 80.0, NULL, 'ACCESS-29', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (30, 5, '2024-05-27', '2024-05-27', 50.0, NULL, 'ACCESS-30', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (31, 5, '2024-06-27', '2024-06-27', 50.0, NULL, 'ACCESS-31', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (32, 5, '2024-07-27', '2024-07-27', 50.0, NULL, 'ACCESS-32', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (33, 5, '2024-08-27', '2024-08-27', 50.0, NULL, 'ACCESS-33', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (34, 5, '2024-09-27', '2024-09-27', 50.0, NULL, 'ACCESS-34', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (35, 5, '2024-10-27', '2024-10-27', 50.0, NULL, 'ACCESS-35', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (36, 5, '2024-11-27', '2024-11-27', 50.0, NULL, 'ACCESS-36', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (37, 6, '2024-05-28', '2024-05-28', 50.0, NULL, 'ACCESS-37', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (38, 6, '2024-06-28', '2024-06-28', 50.0, NULL, 'ACCESS-38', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (39, 6, '2024-07-28', '2024-07-28', 50.0, NULL, 'ACCESS-39', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (40, 6, '2024-08-28', '2024-08-28', 50.0, NULL, 'ACCESS-40', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (41, 6, '2024-09-28', '2024-09-28', 50.0, NULL, 'ACCESS-41', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (42, 6, '2024-10-28', '2024-10-28', 50.0, NULL, 'ACCESS-42', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (43, 6, '2024-11-28', '2024-11-28', 50.0, NULL, 'ACCESS-43', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (44, 7, '2024-05-28', '2024-05-28', 50.0, NULL, 'ACCESS-44', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (45, 7, '2024-06-28', '2024-06-28', 50.0, NULL, 'ACCESS-45', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (46, 7, '2024-07-28', '2024-07-28', 50.0, NULL, 'ACCESS-46', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (47, 7, '2024-08-28', '2024-08-28', 50.0, NULL, 'ACCESS-47', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (48, 7, '2024-09-28', '2024-09-28', 50.0, NULL, 'ACCESS-48', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (49, 7, '2024-10-28', '2024-10-28', 50.0, NULL, 'ACCESS-49', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (50, 7, '2024-11-28', '2024-11-28', 50.0, NULL, 'ACCESS-50', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (51, 8, '2024-05-28', '2024-05-28', 50.0, NULL, 'ACCESS-51', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (52, 8, '2024-06-28', '2024-06-28', 50.0, NULL, 'ACCESS-52', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (53, 8, '2024-07-28', '2024-07-28', 50.0, NULL, 'ACCESS-53', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (54, 8, '2024-08-28', '2024-08-28', 50.0, NULL, 'ACCESS-54', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (55, 8, '2024-09-28', '2024-09-28', 50.0, NULL, 'ACCESS-55', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (56, 8, '2024-10-28', '2024-10-28', 50.0, NULL, 'ACCESS-56', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (57, 8, '2024-11-28', '2024-11-28', 50.0, NULL, 'ACCESS-57', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (58, 9, '2024-05-28', '2024-05-28', 50.0, NULL, 'ACCESS-58', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (59, 9, '2024-06-28', '2024-06-28', 50.0, NULL, 'ACCESS-59', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (60, 9, '2024-07-28', '2024-07-28', 50.0, NULL, 'ACCESS-60', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (61, 9, '2024-08-28', '2024-08-28', 50.0, NULL, 'ACCESS-61', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (62, 9, '2024-09-28', '2024-09-28', 50.0, NULL, 'ACCESS-62', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (63, 9, '2024-10-28', '2024-10-28', 50.0, NULL, 'ACCESS-63', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (64, 9, '2024-11-28', '2024-11-28', 50.0, NULL, 'ACCESS-64', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (65, 10, '2024-05-29', '2024-05-29', 100.0, NULL, 'ACCESS-65', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (66, 10, '2024-06-29', '2024-06-29', 100.0, NULL, 'ACCESS-66', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (67, 10, '2024-07-29', '2024-07-29', 100.0, NULL, 'ACCESS-67', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (68, 10, '2024-08-29', '2024-08-29', 100.0, NULL, 'ACCESS-68', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (69, 10, '2024-09-29', '2024-09-29', 100.0, NULL, 'ACCESS-69', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (70, 10, '2024-10-29', '2024-10-29', 100.0, NULL, 'ACCESS-70', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (71, 10, '2024-11-29', '2024-11-29', 100.0, NULL, 'ACCESS-71', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (72, 11, '2024-05-29', '2024-05-29', 60.0, NULL, 'ACCESS-72', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (73, 11, '2024-06-29', '2024-06-29', 60.0, NULL, 'ACCESS-73', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (74, 11, '2024-07-29', '2024-07-29', 60.0, NULL, 'ACCESS-74', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (75, 11, '2024-08-29', '2024-08-29', 60.0, NULL, 'ACCESS-75', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (76, 11, '2024-09-29', '2024-09-29', 60.0, NULL, 'ACCESS-76', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (77, 11, '2024-10-29', '2024-10-29', 60.0, NULL, 'ACCESS-77', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (78, 11, '2024-11-29', '2024-11-29', 60.0, NULL, 'ACCESS-78', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (79, 12, '2024-05-29', '2024-05-29', 80.0, NULL, 'ACCESS-79', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (80, 12, '2024-06-29', '2024-06-29', 80.0, NULL, 'ACCESS-80', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (81, 12, '2024-07-29', '2024-07-29', 80.0, NULL, 'ACCESS-81', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (82, 12, '2024-08-29', '2024-08-29', 80.0, NULL, 'ACCESS-82', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (83, 12, '2024-09-29', '2024-09-29', 80.0, NULL, 'ACCESS-83', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (84, 12, '2024-10-29', '2024-10-29', 80.0, NULL, 'ACCESS-84', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (85, 12, '2024-11-29', '2024-11-29', 80.0, NULL, 'ACCESS-85', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (86, 13, '2024-05-30', '2024-05-30', 50.0, NULL, 'ACCESS-86', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (87, 13, '2024-06-30', '2024-06-30', 50.0, NULL, 'ACCESS-87', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (88, 13, '2024-07-30', '2024-07-30', 50.0, NULL, 'ACCESS-88', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (89, 13, '2024-08-30', '2024-08-30', 50.0, NULL, 'ACCESS-89', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (90, 13, '2024-09-30', '2024-09-30', 50.0, NULL, 'ACCESS-90', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (91, 13, '2024-10-30', '2024-10-30', 50.0, NULL, 'ACCESS-91', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (92, 13, '2024-11-30', '2024-11-30', 50.0, NULL, 'ACCESS-92', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (93, 14, '2024-05-30', '2024-05-30', 50.0, NULL, 'ACCESS-93', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (94, 14, '2024-06-30', '2024-06-30', 50.0, NULL, 'ACCESS-94', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (95, 14, '2024-07-30', '2024-07-30', 50.0, NULL, 'ACCESS-95', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (96, 14, '2024-08-30', '2024-08-30', 50.0, NULL, 'ACCESS-96', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (97, 14, '2024-09-30', '2024-09-30', 50.0, NULL, 'ACCESS-97', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (98, 14, '2024-10-30', '2024-10-30', 50.0, NULL, 'ACCESS-98', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (99, 14, '2024-11-30', '2024-11-30', 50.0, NULL, 'ACCESS-99', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (100, 15, '2024-06-01', '2024-06-01', 50.0, NULL, 'ACCESS-100', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (101, 15, '2024-07-01', '2024-07-01', 50.0, NULL, 'ACCESS-101', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (102, 15, '2024-08-01', '2024-08-01', 50.0, NULL, 'ACCESS-102', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (103, 15, '2024-09-01', '2024-09-01', 50.0, NULL, 'ACCESS-103', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (104, 15, '2024-10-01', '2024-10-01', 50.0, NULL, 'ACCESS-104', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (105, 15, '2024-11-01', '2024-11-01', 50.0, NULL, 'ACCESS-105', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (106, 15, '2024-11-01', '2024-12-01', 50.0, NULL, 'ACCESS-106', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (107, 16, '2024-06-01', '2024-06-01', 50.0, NULL, 'ACCESS-107', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (108, 16, '2024-07-01', '2024-07-01', 50.0, NULL, 'ACCESS-108', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (109, 16, '2024-08-01', '2024-08-01', 50.0, NULL, 'ACCESS-109', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (110, 16, '2024-09-01', '2024-09-01', 50.0, NULL, 'ACCESS-110', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (111, 16, '2024-10-01', '2024-10-01', 50.0, NULL, 'ACCESS-111', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (112, 16, '2024-11-01', '2024-11-01', 50.0, NULL, 'ACCESS-112', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (113, 16, '2024-11-01', '2024-11-01', 50.0, NULL, 'ACCESS-113', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (114, 17, '2024-06-02', '2024-06-02', 80.0, NULL, 'ACCESS-114', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (115, 17, '2024-07-02', '2024-07-02', 80.0, NULL, 'ACCESS-115', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (116, 17, '2024-08-02', '2024-08-02', 80.0, NULL, 'ACCESS-116', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (117, 17, '2024-09-02', '2024-09-02', 80.0, NULL, 'ACCESS-117', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (118, 17, '2024-10-02', '2024-10-02', 80.0, NULL, 'ACCESS-118', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (119, 17, '2024-11-02', '2024-11-02', 80.0, NULL, 'ACCESS-119', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (120, 18, '2024-06-02', '2024-06-02', 50.0, NULL, 'ACCESS-120', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (121, 18, '2024-07-02', '2024-07-02', 50.0, NULL, 'ACCESS-121', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (122, 18, '2024-08-02', '2024-08-02', 50.0, NULL, 'ACCESS-122', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (123, 18, '2024-09-02', '2024-09-02', 50.0, NULL, 'ACCESS-123', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (124, 18, '2024-10-02', '2024-10-02', 50.0, NULL, 'ACCESS-124', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (125, 18, '2024-11-02', '2024-11-02', 50.0, NULL, 'ACCESS-125', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (126, 19, '2024-06-03', '2024-06-03', 50.0, NULL, 'ACCESS-126', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (127, 19, '2024-07-03', '2024-07-03', 50.0, NULL, 'ACCESS-127', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (128, 19, '2024-08-03', '2024-08-03', 50.0, NULL, 'ACCESS-128', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (129, 20, '2024-06-03', '2024-06-03', 50.0, NULL, 'ACCESS-129', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (130, 20, '2024-07-03', '2024-07-03', 50.0, NULL, 'ACCESS-130', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (131, 20, '2024-08-03', '2024-08-03', 50.0, NULL, 'ACCESS-131', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (132, 20, '2024-09-03', '2024-09-03', 50.0, NULL, 'ACCESS-132', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (133, 21, '2024-06-05', '2024-06-05', 60.0, NULL, 'ACCESS-133', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (134, 21, '2024-07-05', '2024-07-05', 60.0, NULL, 'ACCESS-134', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (135, 21, '2024-08-05', '2024-08-05', 60.0, NULL, 'ACCESS-135', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (136, 21, '2024-09-05', '2024-09-05', 60.0, NULL, 'ACCESS-136', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (137, 21, '2024-10-05', '2024-10-05', 60.0, NULL, 'ACCESS-137', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (138, 21, '2024-11-05', '2024-11-05', 60.0, NULL, 'ACCESS-138', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (139, 22, '2024-06-06', '2024-06-06', 50.0, NULL, 'ACCESS-139', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (140, 22, '2024-07-06', '2024-07-06', 50.0, NULL, 'ACCESS-140', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (141, 22, '2024-08-06', '2024-08-06', 50.0, NULL, 'ACCESS-141', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (142, 22, '2024-09-06', '2024-09-06', 50.0, NULL, 'ACCESS-142', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (143, 22, '2024-10-06', '2024-10-06', 50.0, NULL, 'ACCESS-143', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (144, 22, '2024-11-06', '2024-11-06', 50.0, NULL, 'ACCESS-144', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (145, 23, '2024-06-27', '2024-06-27', 50.0, NULL, 'ACCESS-145', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (146, 23, '2024-07-27', '2024-07-27', 50.0, NULL, 'ACCESS-146', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (147, 23, '2024-08-27', '2024-08-27', 50.0, NULL, 'ACCESS-147', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (148, 23, '2024-09-27', '2024-09-27', 50.0, NULL, 'ACCESS-148', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (149, 23, '2024-10-27', NULL, 50.0, NULL, 'ACCESS-149', 'pendiente')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (150, 24, '2024-06-27', '2024-06-27', 100.0, NULL, 'ACCESS-150', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (151, 24, '2024-07-27', '2024-07-27', 100.0, NULL, 'ACCESS-151', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (152, 24, '2024-08-27', '2024-08-27', 100.0, NULL, 'ACCESS-152', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (153, 24, '2024-09-27', '2024-09-27', 100.0, NULL, 'ACCESS-153', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (154, 24, '2024-10-27', '2024-10-27', 100.0, NULL, 'ACCESS-154', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (155, 24, '2024-11-27', '2024-11-27', 100.0, NULL, 'ACCESS-155', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (156, 25, '2024-06-28', '2024-06-28', 60.0, NULL, 'ACCESS-156', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (157, 25, '2024-07-28', '2024-07-28', 60.0, NULL, 'ACCESS-157', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (158, 26, '2024-06-28', '2024-06-28', 50.0, NULL, 'ACCESS-158', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (159, 26, '2024-07-28', '2024-07-28', 50.0, NULL, 'ACCESS-159', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (160, 26, '2024-08-28', '2024-08-28', 50.0, NULL, 'ACCESS-160', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (161, 26, '2024-09-28', '2024-09-28', 50.0, NULL, 'ACCESS-161', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (162, 26, '2024-10-28', '2024-10-28', 50.0, NULL, 'ACCESS-162', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (163, 26, '2024-11-28', '2024-11-28', 50.0, NULL, 'ACCESS-163', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (164, 27, '2024-06-29', '2024-06-29', 50.0, NULL, 'ACCESS-164', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (165, 27, '2024-07-29', '2024-07-29', 50.0, NULL, 'ACCESS-165', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (166, 27, '2024-08-29', '2024-08-29', 50.0, NULL, 'ACCESS-166', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (167, 27, '2024-09-29', '2024-09-29', 50.0, NULL, 'ACCESS-167', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (168, 27, '2024-10-29', '2024-10-29', 50.0, NULL, 'ACCESS-168', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (169, 27, '2024-11-29', '2024-11-29', 50.0, NULL, 'ACCESS-169', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (170, 28, '2024-07-31', '2024-07-31', 50.0, NULL, 'ACCESS-170', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (171, 28, '2024-08-31', '2024-08-31', 50.0, NULL, 'ACCESS-171', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (172, 29, '2024-07-31', '2024-07-31', 200.0, NULL, 'ACCESS-172', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (173, 30, '2024-08-01', '2024-08-01', 200.0, NULL, 'ACCESS-173', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (174, 30, '2024-09-01', '2024-09-01', 200.0, NULL, 'ACCESS-174', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (175, 30, '2024-10-01', '2024-10-01', 200.0, NULL, 'ACCESS-175', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (176, 30, '2024-11-01', '2024-11-01', 200.0, NULL, 'ACCESS-176', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (177, 31, '2024-08-01', '2024-08-01', 60.0, NULL, 'ACCESS-177', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (178, 31, '2024-09-01', '2024-09-01', 60.0, NULL, 'ACCESS-178', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (179, 31, '2024-10-01', '2024-10-01', 60.0, NULL, 'ACCESS-179', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (180, 31, '2024-11-01', '2024-11-01', 60.0, NULL, 'ACCESS-180', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (181, 32, '2024-08-02', '2024-08-02', 100.0, NULL, 'ACCESS-181', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (182, 32, '2024-09-02', '2024-09-02', 100.0, NULL, 'ACCESS-182', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (183, 32, '2024-10-02', '2024-10-02', 100.0, NULL, 'ACCESS-183', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (184, 32, '2024-11-02', '2024-11-02', 100.0, NULL, 'ACCESS-184', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (185, 33, '2024-08-03', '2024-08-03', 50.0, NULL, 'ACCESS-185', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (186, 33, '2024-09-03', '2024-09-03', 50.0, NULL, 'ACCESS-186', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (187, 33, '2024-10-03', '2024-10-03', 50.0, NULL, 'ACCESS-187', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (188, 33, '2024-11-03', '2024-11-03', 50.0, NULL, 'ACCESS-188', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (189, 34, '2024-08-03', '2024-08-03', 50.0, NULL, 'ACCESS-189', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (190, 34, '2024-09-05', '2024-09-05', 50.0, NULL, 'ACCESS-190', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (191, 34, '2024-10-05', '2024-10-05', 50.0, NULL, 'ACCESS-191', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (192, 34, '2024-11-05', '2024-11-05', 50.0, NULL, 'ACCESS-192', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (193, 35, '2024-08-06', '2024-08-06', 60.0, NULL, 'ACCESS-193', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (194, 35, '2024-09-06', '2024-09-06', 60.0, NULL, 'ACCESS-194', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (195, 35, '2024-10-06', '2024-10-06', 60.0, NULL, 'ACCESS-195', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (196, 35, '2024-11-06', '2024-11-06', 60.0, NULL, 'ACCESS-196', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (197, 36, '2024-08-07', '2024-08-07', 250.0, NULL, 'ACCESS-197', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (198, 36, '2024-09-07', '2024-09-07', 250.0, NULL, 'ACCESS-198', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (199, 36, '2024-10-07', '2024-10-07', 250.0, NULL, 'ACCESS-199', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (200, 36, '2024-11-07', '2024-11-07', 250.0, NULL, 'ACCESS-200', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (201, 37, '2024-08-08', '2024-08-08', 60.0, NULL, 'ACCESS-201', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (202, 37, '2024-09-08', '2024-09-08', 60.0, NULL, 'ACCESS-202', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (203, 37, '2024-10-08', '2024-10-08', 60.0, NULL, 'ACCESS-203', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (204, 37, '2024-11-08', '2024-11-08', 60.0, NULL, 'ACCESS-204', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (205, 38, '2024-08-09', '2024-08-09', 150.0, NULL, 'ACCESS-205', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (206, 39, '2024-08-10', '2024-08-10', 50.0, NULL, 'ACCESS-206', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (207, 39, '2024-09-10', '2024-09-10', 50.0, NULL, 'ACCESS-207', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (208, 39, '2024-10-10', '2024-10-10', 50.0, NULL, 'ACCESS-208', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (209, 39, '2024-11-10', '2024-11-10', 50.0, NULL, 'ACCESS-209', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (210, 40, '2024-08-12', '2024-08-12', 50.0, NULL, 'ACCESS-210', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (211, 40, '2024-09-12', '2024-09-12', 50.0, NULL, 'ACCESS-211', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (212, 40, '2024-10-12', '2024-10-12', 50.0, NULL, 'ACCESS-212', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (213, 40, '2024-11-12', '2024-11-12', 50.0, NULL, 'ACCESS-213', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (214, 41, '2024-08-13', '2024-08-13', 50.0, NULL, 'ACCESS-214', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (215, 41, '2024-09-13', '2024-09-13', 50.0, NULL, 'ACCESS-215', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (216, 41, '2024-10-13', '2024-10-13', 50.0, NULL, 'ACCESS-216', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (217, 41, '2024-11-13', '2024-11-13', 50.0, NULL, 'ACCESS-217', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (218, 42, '2024-08-14', '2024-08-14', 250.0, NULL, 'ACCESS-218', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (219, 42, '2024-09-14', '2024-09-14', 250.0, NULL, 'ACCESS-219', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (220, 42, '2024-10-14', '2024-10-14', 250.0, NULL, 'ACCESS-220', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (221, 42, '2024-11-14', '2024-11-14', 250.0, NULL, 'ACCESS-221', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (222, 43, '2024-08-14', '2024-08-14', 50.0, NULL, 'ACCESS-222', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (223, 43, '2024-09-14', '2024-09-14', 50.0, NULL, 'ACCESS-223', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (224, 43, '2024-10-14', '2024-10-14', 50.0, NULL, 'ACCESS-224', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (225, 43, '2024-11-14', '2024-11-14', 50.0, NULL, 'ACCESS-225', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (226, 44, '2024-08-15', '2024-08-15', 50.0, NULL, 'ACCESS-226', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (227, 44, '2024-09-15', '2024-09-15', 50.0, NULL, 'ACCESS-227', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (228, 45, '2024-08-16', '2024-06-15', 100.0, NULL, 'ACCESS-228', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (229, 45, '2024-08-16', '2024-06-15', 100.0, NULL, 'ACCESS-229', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (230, 46, '2024-08-17', '2024-08-17', 50.0, NULL, 'ACCESS-230', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (231, 46, '2024-09-17', '2024-09-17', 50.0, NULL, 'ACCESS-231', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (232, 46, '2024-10-17', '2024-10-17', 50.0, NULL, 'ACCESS-232', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (233, 46, '2024-11-17', '2024-11-17', 50.0, NULL, 'ACCESS-233', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (234, 47, '2024-08-19', '2024-08-19', 50.0, NULL, 'ACCESS-234', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (235, 47, '2024-09-19', '2024-09-19', 50.0, NULL, 'ACCESS-235', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (236, 47, '2024-10-19', '2024-10-19', 50.0, NULL, 'ACCESS-236', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (237, 47, '2024-11-19', '2024-11-19', 50.0, NULL, 'ACCESS-237', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (238, 48, '2024-08-20', '2024-08-20', 50.0, NULL, 'ACCESS-238', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (239, 48, '2024-09-20', '2024-09-20', 50.0, NULL, 'ACCESS-239', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (240, 48, '2024-10-20', '2024-10-20', 50.0, NULL, 'ACCESS-240', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (241, 48, '2024-11-20', '2024-11-20', 50.0, NULL, 'ACCESS-241', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (242, 49, '2024-08-21', '2024-08-21', 50.0, NULL, 'ACCESS-242', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (243, 49, '2024-09-21', '2024-09-21', 50.0, NULL, 'ACCESS-243', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (244, 49, '2024-10-21', '2024-10-21', 50.0, NULL, 'ACCESS-244', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (245, 49, '2024-11-21', '2024-11-21', 50.0, NULL, 'ACCESS-245', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (246, 50, '2024-08-22', '2024-08-22', 50.0, NULL, 'ACCESS-246', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (247, 50, '2024-09-22', '2024-09-22', 50.0, NULL, 'ACCESS-247', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (248, 50, '2024-10-22', '2024-10-22', 50.0, NULL, 'ACCESS-248', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (249, 50, '2024-11-22', '2024-11-22', 50.0, NULL, 'ACCESS-249', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (250, 51, '2024-08-23', '2024-08-23', 60.0, NULL, 'ACCESS-250', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (251, 51, '2024-09-23', '2024-09-23', 60.0, NULL, 'ACCESS-251', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (252, 51, '2024-10-23', '2024-10-23', 60.0, NULL, 'ACCESS-252', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (253, 51, '2024-11-23', '2024-11-23', 60.0, NULL, 'ACCESS-253', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (254, 52, '2024-08-24', '2024-08-24', 100.0, NULL, 'ACCESS-254', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (255, 52, '2024-09-24', '2024-09-24', 100.0, NULL, 'ACCESS-255', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (256, 52, '2024-10-24', '2024-10-24', 100.0, NULL, 'ACCESS-256', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (257, 52, '2024-11-24', '2024-11-24', 100.0, NULL, 'ACCESS-257', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (258, 53, '2024-08-28', '2024-08-28', 50.0, NULL, 'ACCESS-258', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (259, 53, '2024-09-28', NULL, 50.0, NULL, 'ACCESS-259', 'pendiente')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (260, 54, '2024-08-29', '2024-08-29', 50.0, NULL, 'ACCESS-260', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (261, 54, '2024-09-29', '2024-09-29', 50.0, NULL, 'ACCESS-261', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (262, 54, '2024-10-29', '2024-10-29', 50.0, NULL, 'ACCESS-262', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (263, 54, '2024-11-29', '2024-11-29', 50.0, NULL, 'ACCESS-263', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (264, 55, '2024-08-29', '2024-08-29', 150.0, NULL, 'ACCESS-264', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (265, 55, '2024-09-29', '2024-09-29', 150.0, NULL, 'ACCESS-265', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (266, 55, '2024-10-29', '2024-10-29', 150.0, NULL, 'ACCESS-266', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (267, 55, '2024-11-29', '2024-11-29', 150.0, NULL, 'ACCESS-267', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (268, 56, '2024-09-03', '2024-09-03', 100.0, NULL, 'ACCESS-268', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (269, 56, '2024-10-03', '2024-10-03', 100.0, NULL, 'ACCESS-269', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (270, 56, '2024-11-03', '2024-11-03', 100.0, NULL, 'ACCESS-270', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (271, 56, '2024-12-03', '2024-12-03', 100.0, NULL, 'ACCESS-271', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (272, 57, '2024-09-04', '2024-09-04', 50.0, NULL, 'ACCESS-272', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (273, 57, '2024-10-04', '2024-10-04', 50.0, NULL, 'ACCESS-273', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (274, 57, '2024-11-04', '2024-11-04', 50.0, NULL, 'ACCESS-274', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (275, 57, '2024-12-04', '2024-12-04', 50.0, NULL, 'ACCESS-275', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (276, 58, '2024-09-05', '2024-09-05', 50.0, NULL, 'ACCESS-276', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (277, 58, '2024-10-05', '2024-10-05', 50.0, NULL, 'ACCESS-277', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (278, 58, '2024-11-05', '2024-11-05', 50.0, NULL, 'ACCESS-278', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (279, 59, '2024-09-06', '2024-09-06', 60.0, NULL, 'ACCESS-279', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (280, 59, '2024-10-06', '2024-10-06', 60.0, NULL, 'ACCESS-280', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (281, 59, '2024-11-06', '2024-11-06', 60.0, NULL, 'ACCESS-281', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (282, 60, '2024-09-07', '2024-09-07', 50.0, NULL, 'ACCESS-282', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (283, 60, '2024-10-07', '2024-10-07', 50.0, NULL, 'ACCESS-283', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (284, 60, '2024-11-07', '2024-11-07', 50.0, NULL, 'ACCESS-284', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (285, 61, '2024-09-09', '2024-09-09', 200.0, NULL, 'ACCESS-285', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (286, 61, '2024-10-09', '2024-10-09', 200.0, NULL, 'ACCESS-286', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (287, 61, '2024-11-09', '2024-11-09', 200.0, NULL, 'ACCESS-287', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (288, 62, '2024-09-10', '2024-09-10', 50.0, NULL, 'ACCESS-288', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (289, 62, '2024-10-10', '2024-10-10', 50.0, NULL, 'ACCESS-289', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (290, 62, '2024-11-10', '2024-11-10', 50.0, NULL, 'ACCESS-290', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (291, 63, '2024-09-10', '2024-09-10', 60.0, NULL, 'ACCESS-291', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (292, 63, '2024-10-10', '2024-10-10', 60.0, NULL, 'ACCESS-292', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (293, 63, '2024-11-10', '2024-11-10', 60.0, NULL, 'ACCESS-293', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (294, 63, '2024-12-10', '2024-12-10', 60.0, NULL, 'ACCESS-294', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (295, 64, '2024-09-10', '2024-09-10', 60.0, NULL, 'ACCESS-295', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (296, 64, '2024-10-10', '2024-10-10', 60.0, NULL, 'ACCESS-296', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (297, 64, '2024-11-10', '2024-11-10', 60.0, NULL, 'ACCESS-297', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (298, 65, '2024-09-13', '2024-09-13', 80.0, NULL, 'ACCESS-298', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (299, 66, '2024-09-14', '2024-09-14', 80.0, NULL, 'ACCESS-299', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (300, 66, '2024-10-14', '2024-10-14', 80.0, NULL, 'ACCESS-300', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (301, 66, '2024-11-14', '2024-11-14', 80.0, NULL, 'ACCESS-301', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (302, 67, '2024-09-24', '2024-09-24', 60.0, NULL, 'ACCESS-302', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (303, 67, '2024-10-24', '2024-10-24', 60.0, NULL, 'ACCESS-303', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (304, 67, '2024-11-24', '2024-11-24', 60.0, NULL, 'ACCESS-304', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (305, 68, '2024-09-25', '2024-09-25', 50.0, NULL, 'ACCESS-305', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (306, 68, '2024-10-25', '2024-10-25', 50.0, NULL, 'ACCESS-306', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (307, 68, '2024-11-25', '2024-11-25', 50.0, NULL, 'ACCESS-307', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (308, 69, '2024-09-26', '2024-09-26', 50.0, NULL, 'ACCESS-308', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (309, 69, '2024-10-26', '2024-10-26', 50.0, NULL, 'ACCESS-309', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (310, 69, '2024-11-26', '2024-11-26', 50.0, NULL, 'ACCESS-310', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (311, 70, '2024-09-27', '2024-09-27', 100.0, NULL, 'ACCESS-311', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (312, 70, '2024-10-27', '2024-10-27', 100.0, NULL, 'ACCESS-312', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (313, 70, '2024-11-27', '2024-11-27', 100.0, NULL, 'ACCESS-313', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (314, 71, '2024-09-27', '2024-09-27', 60.0, NULL, 'ACCESS-314', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (315, 71, '2024-10-27', '2024-10-27', 60.0, NULL, 'ACCESS-315', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (316, 71, '2024-11-27', '2024-11-27', 60.0, NULL, 'ACCESS-316', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (317, 72, '2024-09-28', '2024-09-28', 60.0, NULL, 'ACCESS-317', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (318, 72, '2024-10-28', '2024-10-28', 60.0, NULL, 'ACCESS-318', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (319, 72, '2024-11-28', '2024-11-28', 60.0, NULL, 'ACCESS-319', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (320, 73, '2024-10-01', NULL, 60.0, NULL, 'ACCESS-320', 'pendiente')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (321, 74, '2024-10-02', '2024-10-02', 80.0, NULL, 'ACCESS-321', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (322, 74, '2024-11-02', '2024-11-02', 80.0, NULL, 'ACCESS-322', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (323, 75, '2024-10-03', '2024-10-03', 60.0, NULL, 'ACCESS-323', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (324, 75, '2024-11-03', '2024-11-03', 60.0, NULL, 'ACCESS-324', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (325, 76, '2024-10-04', '2024-10-04', 60.0, NULL, 'ACCESS-325', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (326, 76, '2024-11-04', '2024-11-04', 60.0, NULL, 'ACCESS-326', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (327, 77, '2024-10-15', '2024-10-15', 50.0, NULL, 'ACCESS-327', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (328, 77, '2024-11-15', '2024-11-15', 50.0, NULL, 'ACCESS-328', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (329, 78, '2024-10-15', '2024-10-15', 50.0, NULL, 'ACCESS-329', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (330, 78, '2024-11-15', '2024-11-15', 50.0, NULL, 'ACCESS-330', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (331, 79, '2024-10-17', '2024-10-17', 300.0, NULL, 'ACCESS-331', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (332, 79, '2024-11-17', '2024-11-17', 300.0, NULL, 'ACCESS-332', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (333, 80, '2024-10-18', '2024-10-18', 200.0, NULL, 'ACCESS-333', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (334, 80, '2024-11-18', '2024-11-18', 200.0, NULL, 'ACCESS-334', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (335, 81, '2024-10-19', '2024-10-19', 50.0, NULL, 'ACCESS-335', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (336, 81, '2024-11-19', NULL, 0.0, NULL, 'ACCESS-336', 'pendiente')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (337, 82, '2024-10-21', '2024-10-21', 50.0, NULL, 'ACCESS-337', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (338, 82, '2024-11-21', '2024-11-21', 50.0, NULL, 'ACCESS-338', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (339, 83, '2024-10-22', '2024-10-22', 400.0, NULL, 'ACCESS-339', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (340, 83, '2024-11-22', '2024-11-22', 400.0, NULL, 'ACCESS-340', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (341, 84, '2024-10-22', '2024-10-22', 60.0, NULL, 'ACCESS-341', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (342, 84, '2024-11-22', '2024-11-22', 60.0, NULL, 'ACCESS-342', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (343, 85, '2024-10-23', '2024-10-23', 60.0, NULL, 'ACCESS-343', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (344, 85, '2024-11-23', '2024-11-23', 60.0, NULL, 'ACCESS-344', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (345, 86, '2024-10-24', '2024-10-24', 80.0, NULL, 'ACCESS-345', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (346, 86, '2024-11-24', '2024-11-24', 80.0, NULL, 'ACCESS-346', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (347, 87, '2024-10-25', '2024-10-25', 80.0, NULL, 'ACCESS-347', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (348, 87, '2024-11-25', '2024-11-25', 80.0, NULL, 'ACCESS-348', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (349, 88, '2024-10-26', '2024-10-26', 60.0, NULL, 'ACCESS-349', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (350, 88, '2024-11-26', '2024-11-26', 60.0, NULL, 'ACCESS-350', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (351, 89, '2024-10-28', '2024-10-28', 50.0, NULL, 'ACCESS-351', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (352, 90, '2024-10-28', '2024-10-28', 100.0, NULL, 'ACCESS-352', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (353, 90, '2024-11-28', '2024-11-28', 100.0, NULL, 'ACCESS-353', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (354, 91, '2024-10-30', '2024-10-30', 150.0, NULL, 'ACCESS-354', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (355, 91, '2024-11-30', '2024-11-30', 150.0, NULL, 'ACCESS-355', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (356, 92, '2024-11-04', '2024-11-04', 250.0, NULL, 'ACCESS-356', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (357, 93, '2024-11-05', '2024-11-05', 50.0, NULL, 'ACCESS-357', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (358, 94, '2024-11-06', '2024-11-06', 300.0, NULL, 'ACCESS-358', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (359, 95, '2024-11-07', '2024-11-07', 50.0, NULL, 'ACCESS-359', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (360, 96, '2024-11-08', '2024-11-08', 300.0, NULL, 'ACCESS-360', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (361, 97, '2024-11-09', '2024-11-09', 50.0, NULL, 'ACCESS-361', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (362, 98, '2024-11-11', '2024-11-11', 50.0, NULL, 'ACCESS-362', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (363, 99, '2024-11-12', '2024-11-12', 60.0, NULL, 'ACCESS-363', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (364, 100, '2024-11-13', '2024-11-13', 250.0, NULL, 'ACCESS-364', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (365, 101, '2024-11-13', '2024-11-13', 50.0, NULL, 'ACCESS-365', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (366, 102, '2024-11-15', '2024-11-15', 80.0, NULL, 'ACCESS-366', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (367, 103, '2024-11-18', '2024-11-18', 50.0, NULL, 'ACCESS-367', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (368, 104, '2024-11-19', '2024-11-19', 60.0, NULL, 'ACCESS-368', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (369, 105, '2024-11-25', '2024-11-25', 100.0, NULL, 'ACCESS-369', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;

-- =========================================================
-- ACTUALIZAR SECUENCIAS / IDENTITY DESPUÉS DE INSERTAR IDS MANUALES
-- =========================================================
SELECT setval(pg_get_serial_sequence('cablebi.sedes','id_sede'), COALESCE((SELECT MAX(id_sede) FROM cablebi.sedes), 1), TRUE);
SELECT setval(pg_get_serial_sequence('cablebi.planes','id_plan'), COALESCE((SELECT MAX(id_plan) FROM cablebi.planes), 1), TRUE);
SELECT setval(pg_get_serial_sequence('cablebi.clientes','id_cliente'), COALESCE((SELECT MAX(id_cliente) FROM cablebi.clientes), 1), TRUE);
SELECT setval(pg_get_serial_sequence('cablebi.contratos','id_contrato'), COALESCE((SELECT MAX(id_contrato) FROM cablebi.contratos), 1), TRUE);
SELECT setval(pg_get_serial_sequence('cablebi.pagos','id_pago'), COALESCE((SELECT MAX(id_pago) FROM cablebi.pagos), 1), TRUE);

COMMIT;

-- =========================================================
-- VALIDACIÓN
-- =========================================================
SELECT 'sedes' AS tabla, COUNT(*) AS total FROM cablebi.sedes
UNION ALL SELECT 'planes', COUNT(*) FROM cablebi.planes
UNION ALL SELECT 'clientes', COUNT(*) FROM cablebi.clientes
UNION ALL SELECT 'contratos', COUNT(*) FROM cablebi.contratos
UNION ALL SELECT 'pagos', COUNT(*) FROM cablebi.pagos;

SELECT * FROM cablebi.v_dashboard_general;
SELECT * FROM cablebi.v_resumen_sedes ORDER BY id_sede;
-- =========================================================
-- SOLO DATOS DE ACCESS PARA LA BASE CABLEBI
-- Fuente: CABLE(1).accdb
-- Uso: ejecutar DESPUÉS de haber creado la estructura del esquema cablebi.
-- Este script NO crea base de datos, NO crea esquema y NO crea tablas.
-- Solo inserta/actualiza datos en las tablas cablebi existentes.
-- =========================================================

BEGIN;

-- Verifica que el esquema cablebi exista
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.schemata WHERE schema_name = 'cablebi'
    ) THEN
        RAISE EXCEPTION 'No existe el esquema cablebi. Primero ejecuta el script de estructura de CableBI.';
    END IF;
END $$;

SET search_path TO cablebi;

-- IMPORTANTE:
-- Si deseas dejar las tablas vacías antes de cargar los datos de Access,
-- descomenta el siguiente TRUNCATE.
-- TRUNCATE TABLE reportes_exportados, auditoria, predicciones_churn, cliente_segmentacion,
-- encuestas_satisfaccion, incidencias, pagos, contratos, clientes, planes, sedes
-- RESTART IDENTITY CASCADE;


-- =========================================================
-- SEDES
-- =========================================================
INSERT INTO cablebi.sedes
(id_sede, nombre_sede, ciudad, provincia, region, direccion, telefono, es_expansion, estado)
VALUES (2, 'San Ramon', 'San Ramon', 'Chanchamayo', 'Junin', 'No registrada', NULL, FALSE, 'activo')
ON CONFLICT (id_sede) DO UPDATE SET
    nombre_sede = EXCLUDED.nombre_sede,
    ciudad = EXCLUDED.ciudad,
    provincia = EXCLUDED.provincia,
    region = EXCLUDED.region,
    direccion = EXCLUDED.direccion,
    telefono = EXCLUDED.telefono,
    es_expansion = EXCLUDED.es_expansion,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.sedes
(id_sede, nombre_sede, ciudad, provincia, region, direccion, telefono, es_expansion, estado)
VALUES (3, 'La Merced', 'La Merced', 'Chanchamayo', 'Junin', 'No registrada', NULL, FALSE, 'activo')
ON CONFLICT (id_sede) DO UPDATE SET
    nombre_sede = EXCLUDED.nombre_sede,
    ciudad = EXCLUDED.ciudad,
    provincia = EXCLUDED.provincia,
    region = EXCLUDED.region,
    direccion = EXCLUDED.direccion,
    telefono = EXCLUDED.telefono,
    es_expansion = EXCLUDED.es_expansion,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.sedes
(id_sede, nombre_sede, ciudad, provincia, region, direccion, telefono, es_expansion, estado)
VALUES (4, 'Llacta', 'Llacta', 'Huánuco', 'Huanuco', 'No registrada', NULL, FALSE, 'activo')
ON CONFLICT (id_sede) DO UPDATE SET
    nombre_sede = EXCLUDED.nombre_sede,
    ciudad = EXCLUDED.ciudad,
    provincia = EXCLUDED.provincia,
    region = EXCLUDED.region,
    direccion = EXCLUDED.direccion,
    telefono = EXCLUDED.telefono,
    es_expansion = EXCLUDED.es_expansion,
    estado = EXCLUDED.estado;

-- =========================================================
-- PLANES
-- =========================================================
INSERT INTO cablebi.planes
(id_plan, nombre_plan, tipo_servicio, categoria_comercial, velocidad_mbps, precio_mensual, estado)
VALUES (1, 'Basico', 'internet', 'basico', 100, 50.0, 'activo')
ON CONFLICT (id_plan) DO UPDATE SET
    nombre_plan = EXCLUDED.nombre_plan,
    tipo_servicio = EXCLUDED.tipo_servicio,
    categoria_comercial = EXCLUDED.categoria_comercial,
    velocidad_mbps = EXCLUDED.velocidad_mbps,
    precio_mensual = EXCLUDED.precio_mensual,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.planes
(id_plan, nombre_plan, tipo_servicio, categoria_comercial, velocidad_mbps, precio_mensual, estado)
VALUES (2, 'Estandar', 'internet', 'estandar', 150, 60.0, 'activo')
ON CONFLICT (id_plan) DO UPDATE SET
    nombre_plan = EXCLUDED.nombre_plan,
    tipo_servicio = EXCLUDED.tipo_servicio,
    categoria_comercial = EXCLUDED.categoria_comercial,
    velocidad_mbps = EXCLUDED.velocidad_mbps,
    precio_mensual = EXCLUDED.precio_mensual,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.planes
(id_plan, nombre_plan, tipo_servicio, categoria_comercial, velocidad_mbps, precio_mensual, estado)
VALUES (3, 'Plus', 'internet', 'plus', 300, 80.0, 'activo')
ON CONFLICT (id_plan) DO UPDATE SET
    nombre_plan = EXCLUDED.nombre_plan,
    tipo_servicio = EXCLUDED.tipo_servicio,
    categoria_comercial = EXCLUDED.categoria_comercial,
    velocidad_mbps = EXCLUDED.velocidad_mbps,
    precio_mensual = EXCLUDED.precio_mensual,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.planes
(id_plan, nombre_plan, tipo_servicio, categoria_comercial, velocidad_mbps, precio_mensual, estado)
VALUES (4, 'Premium', 'internet', 'premium', 500, 100.0, 'activo')
ON CONFLICT (id_plan) DO UPDATE SET
    nombre_plan = EXCLUDED.nombre_plan,
    tipo_servicio = EXCLUDED.tipo_servicio,
    categoria_comercial = EXCLUDED.categoria_comercial,
    velocidad_mbps = EXCLUDED.velocidad_mbps,
    precio_mensual = EXCLUDED.precio_mensual,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.planes
(id_plan, nombre_plan, tipo_servicio, categoria_comercial, velocidad_mbps, precio_mensual, estado)
VALUES (5, 'Empresarial Basico', 'internet', 'empresarial', 700, 150.0, 'activo')
ON CONFLICT (id_plan) DO UPDATE SET
    nombre_plan = EXCLUDED.nombre_plan,
    tipo_servicio = EXCLUDED.tipo_servicio,
    categoria_comercial = EXCLUDED.categoria_comercial,
    velocidad_mbps = EXCLUDED.velocidad_mbps,
    precio_mensual = EXCLUDED.precio_mensual,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.planes
(id_plan, nombre_plan, tipo_servicio, categoria_comercial, velocidad_mbps, precio_mensual, estado)
VALUES (6, 'Empresarial Estandar', 'internet', 'empresarial', 1000, 200.0, 'activo')
ON CONFLICT (id_plan) DO UPDATE SET
    nombre_plan = EXCLUDED.nombre_plan,
    tipo_servicio = EXCLUDED.tipo_servicio,
    categoria_comercial = EXCLUDED.categoria_comercial,
    velocidad_mbps = EXCLUDED.velocidad_mbps,
    precio_mensual = EXCLUDED.precio_mensual,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.planes
(id_plan, nombre_plan, tipo_servicio, categoria_comercial, velocidad_mbps, precio_mensual, estado)
VALUES (7, 'Empresarial Plus', 'internet', 'empresarial', 1500, 250.0, 'activo')
ON CONFLICT (id_plan) DO UPDATE SET
    nombre_plan = EXCLUDED.nombre_plan,
    tipo_servicio = EXCLUDED.tipo_servicio,
    categoria_comercial = EXCLUDED.categoria_comercial,
    velocidad_mbps = EXCLUDED.velocidad_mbps,
    precio_mensual = EXCLUDED.precio_mensual,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.planes
(id_plan, nombre_plan, tipo_servicio, categoria_comercial, velocidad_mbps, precio_mensual, estado)
VALUES (8, 'Empresarial Premium', 'internet', 'empresarial', 2000, 300.0, 'activo')
ON CONFLICT (id_plan) DO UPDATE SET
    nombre_plan = EXCLUDED.nombre_plan,
    tipo_servicio = EXCLUDED.tipo_servicio,
    categoria_comercial = EXCLUDED.categoria_comercial,
    velocidad_mbps = EXCLUDED.velocidad_mbps,
    precio_mensual = EXCLUDED.precio_mensual,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.planes
(id_plan, nombre_plan, tipo_servicio, categoria_comercial, velocidad_mbps, precio_mensual, estado)
VALUES (9, 'Empresarial Premium +', 'internet', 'corporativo', 2500, 350.0, 'activo')
ON CONFLICT (id_plan) DO UPDATE SET
    nombre_plan = EXCLUDED.nombre_plan,
    tipo_servicio = EXCLUDED.tipo_servicio,
    categoria_comercial = EXCLUDED.categoria_comercial,
    velocidad_mbps = EXCLUDED.velocidad_mbps,
    precio_mensual = EXCLUDED.precio_mensual,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.planes
(id_plan, nombre_plan, tipo_servicio, categoria_comercial, velocidad_mbps, precio_mensual, estado)
VALUES (10, 'Empresarial Black', 'internet', 'corporativo', 3000, 400.0, 'activo')
ON CONFLICT (id_plan) DO UPDATE SET
    nombre_plan = EXCLUDED.nombre_plan,
    tipo_servicio = EXCLUDED.tipo_servicio,
    categoria_comercial = EXCLUDED.categoria_comercial,
    velocidad_mbps = EXCLUDED.velocidad_mbps,
    precio_mensual = EXCLUDED.precio_mensual,
    estado = EXCLUDED.estado;

-- =========================================================
-- CLIENTES
-- =========================================================
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (1, 2, '75473846', 'Jose Luis', 'Sulla Corbetta', '906983532', NULL, 'No registrada', 'natural', '2024-05-25', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (2, 2, '73382006', 'Xande', 'Tejed Guevara', '970029524', NULL, 'No registrada', 'natural', '2024-05-26', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (3, 2, '72561380', 'Susan', 'Carol Palacio', '916179523', NULL, 'No registrada', 'natural', '2024-05-27', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (4, 2, '40151234', 'Jenny', 'Corbetta Toscano', '941861398', NULL, 'No registrada', 'natural', '2024-05-28', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (5, 2, '71777298', 'Jennifer', 'Pillhuaman Corbetta', '968288128', NULL, 'No registrada', 'natural', '2024-05-28', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (6, 2, '71777299', 'Hade', 'Pillhuaman Corbetta', '950790537', NULL, 'No registrada', 'natural', '2024-05-28', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (7, 2, '20043464', 'Salome', 'Flores Javier', '973652792', NULL, 'No registrada', 'natural', '2024-05-28', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (8, 2, '43377312', 'John', 'Cañari Bogo', '953462768', NULL, 'No registrada', 'natural', '2024-05-29', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (9, 2, '20546273', 'Arnaldo', 'Corbetta Carranza', '982356145', NULL, 'No registrada', 'natural', '2024-05-29', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (10, 2, '23686921', 'Danny', 'Yaringaño Luis', '976804241', NULL, 'No registrada', 'natural', '2024-05-29', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (11, 2, '20547263', 'Juan Laurel', 'Nieto Pinto', '985662253', NULL, 'No registrada', 'natural', '2024-05-30', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (12, 2, '72867994', 'Jair', 'Caso Hilario', '900764804', NULL, 'No registrada', 'natural', '2024-05-30', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (13, 2, '77036997', 'Helen', 'Revollar Lopez', '977921463', NULL, 'No registrada', 'natural', '2024-06-01', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (14, 2, '20578583', 'Diogenes', 'Sulla Castellanos', '983564275', NULL, 'No registrada', 'natural', '2024-06-01', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (15, 2, '19927004', 'Benigno', 'Palacios Aguilar', '956052657', NULL, 'No registrada', 'natural', '2024-06-02', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (16, 2, '73382029', 'Jhon Luis', 'Pomajambo Chancas', '985646218', NULL, 'No registrada', 'natural', '2024-06-03', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (17, 2, '73382030', 'Jhony', 'Pomajambo Chancas', '965298345', NULL, 'No registrada', 'natural', '2024-06-04', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (18, 2, '20041495', 'Ana Elva', 'Matos Olivera', '986452047', NULL, 'No registrada', 'natural', '2024-06-05', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (19, 2, '76342417', 'Mariela', 'Venegas Sullca', '905001598', NULL, 'No registrada', 'natural', '2024-06-06', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (20, 2, '75901311', 'Reyna', 'Apaza Rondon', '960870552', NULL, 'No registrada', 'natural', '2024-06-27', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (21, 2, '73883528', 'Jose Luis', 'Palomino Aylas', '957793164', NULL, 'No registrada', 'natural', '2024-06-27', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (22, 2, '72867634', 'Shanon', 'Rosas Macuri', '921560784', NULL, 'No registrada', 'natural', '2024-06-28', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (23, 2, '73539085', 'Angie', 'Gago Palpan', '905681048', NULL, 'No registrada', 'natural', '2024-06-28', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (24, 2, '60408348', 'Karen', 'Enciso Napuche', '931746004', NULL, 'No registrada', 'natural', '2024-06-29', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (25, 2, '75660972', 'Lucero', 'Pipa Paucar', '900025654', NULL, 'No registrada', 'natural', '2024-07-31', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (26, 2, '47935444', 'Luis Rafael', 'Gonzales Aliaga', '910406475', NULL, 'No registrada', 'natural', '2024-07-31', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (27, 2, '41396527', 'Ronald Alex', 'Nieto Bogo', '960854382', NULL, 'No registrada', 'natural', '2024-08-01', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (28, 2, '43730130', 'Orlando', 'Minaya Hidalgo', '951593154', NULL, 'No registrada', 'natural', '2024-08-02', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (29, 3, '71135348', 'Antonella', 'Jange Palomino', '974240044', NULL, 'No registrada', 'natural', '2024-08-03', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (30, 3, '46743712', 'Angelina', 'Velazque Cruz', '952555645', NULL, 'No registrada', 'natural', '2024-08-05', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (31, 3, '60754646', 'Abraham', 'Mera Samaniego', '972648999', NULL, 'No registrada', 'natural', '2024-08-06', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (32, 2, '60528946', 'Angelo', 'valencia', '925634887', NULL, 'No registrada', 'natural', '2024-08-07', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (33, 2, '49823541', 'Eduardo', 'Huanquin Sanabria', '985631197', NULL, 'No registrada', 'natural', '2024-08-09', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (34, 2, '46945890', 'Simon', 'Ochandarte Palomino', '982356642', NULL, 'No registrada', 'natural', '2024-08-10', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (35, 2, '76473492', 'Leydi', 'Calero Lopez', '905781643', NULL, 'No registrada', 'natural', '2024-08-12', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (36, 2, '43326084', 'Julio', 'Payano Toscano', '965848734', NULL, 'No registrada', 'natural', '2024-08-13', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (37, 2, '76971479', 'Brad', 'Valencia Valdivia', '942250199', NULL, 'No registrada', 'natural', '2024-08-14', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (38, 3, '20524299', 'Luis', 'Jange Medina', '962453153', NULL, 'No registrada', 'natural', '2024-08-15', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (39, 4, '08541660', 'James', 'Oscco Ortiz', '934567305', NULL, 'No registrada', 'natural', '2024-08-16', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (40, 4, '46248014', 'Julie Medaly', 'Yanac Diaz', '926293483', NULL, 'No registrada', 'natural', '2024-08-17', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (41, 2, '71423448', 'Milagros', 'Campos Leon', '906845028', NULL, 'No registrada', 'natural', '2024-08-19', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (42, 4, '08563456', 'Jreisy', 'Crocco Solano', '908354000', NULL, 'No registrada', 'natural', '2024-08-20', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (43, 2, '20561673', 'Marleny', 'Huaman Sinchez', '926784101', NULL, 'No registrada', 'natural', '2024-08-21', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (44, 4, '72734593', 'Bianca', 'Roman Osco', '972734593', NULL, 'No registrada', 'natural', '2024-08-22', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (45, 2, '76002644', 'Bryan', 'Quispe Eslachin', '976002644', NULL, 'No registrada', 'natural', '2024-08-23', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (46, 4, '41332821', 'Carlos Andres', 'Vilca Toscano', '941332821', NULL, 'No registrada', 'natural', '2024-08-24', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (47, 2, '70303524', 'Pedro', 'Dias Saire', '970303524', NULL, 'No registrada', 'natural', '2024-08-28', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (48, 4, '20993126', 'Javier', 'Llanco Huayta', '920993126', NULL, 'No registrada', 'natural', '2024-08-29', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (49, 4, '41510247', 'Denisse', 'Veliz Bogo', '941104472', NULL, 'No registrada', 'natural', '2024-08-29', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (50, 4, '70320927', 'Jhon Ciro', 'Mercado Galarza', '970320927', NULL, 'No registrada', 'natural', '2024-09-03', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (51, 3, '76420493', 'Jhon Michael', 'Mercado Galarza', '976204932', NULL, 'No registrada', 'natural', '2024-09-04', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (52, 2, '20740173', 'Moises', 'Cuadros Moya', '920740173', NULL, 'No registrada', 'natural', '2024-09-05', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (53, 3, '41057818', 'Maria Eugenia', 'Herrera Cueva', '940578180', NULL, 'No registrada', 'natural', '2024-09-06', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (54, 2, '71850791', 'Josias', 'Poma Huarcaya', '985079171', NULL, 'No registrada', 'natural', '2024-09-07', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (55, 3, '70241042', 'David Ivan', 'Culis Ricaldi', '910427024', NULL, 'No registrada', 'natural', '2024-09-09', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (56, 3, '72082086', 'Piero', 'Alpaca Vaccara', '902568164', NULL, 'No registrada', 'natural', '2024-09-10', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (57, 3, '62101441', 'Juan Carlos', 'Velasquez Hoyos', '962101441', NULL, 'No registrada', 'natural', '2024-09-11', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (58, 3, '74286135', 'Luis Alberto', 'Ramírez Poma', '947582314', NULL, 'No registrada', 'natural', '2024-09-12', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (59, 4, '73195482', 'María Fernanda', 'Quispe Salazar', '973195482', NULL, 'No registrada', 'natural', '2024-09-13', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (60, 4, '76841329', 'José Antonio', 'Huamán Rojas', '976841329', NULL, 'No registrada', 'natural', '2024-09-14', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (61, 4, '71482596', 'Carla Milagros', 'Torres Vega', '965318240', NULL, 'No registrada', 'natural', '2024-09-24', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (62, 4, '75963184', 'Diego Sebastián', 'Flores Aliaga', '912684579', NULL, 'No registrada', 'natural', '2024-09-25', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (63, 3, '72651843', 'Andrea Lucía', 'Mendoza Castro', '972651843', NULL, 'No registrada', 'natural', '2024-09-26', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (64, 3, '74839251', 'Kevin Alexander', 'Paredes León', '974839251', NULL, 'No registrada', 'natural', '2024-09-27', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (65, 3, '73527481', 'Fiorella Nicole', 'Sánchez Ramos', '973527481', NULL, 'No registrada', 'natural', '2024-09-27', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (66, 3, '76194028', 'Renato Javier', 'Gutiérrez Silva', '952045325', NULL, 'No registrada', 'natural', '2024-01-01', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (67, 3, '71948356', 'Paola Estefany', 'Chávez Díaz', '987364921', NULL, 'No registrada', 'natural', '2024-09-28', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (68, 3, '73815264', 'Daniela Alejandra', 'Ortiz Cárdenas', '973815264', NULL, 'No registrada', 'natural', '2024-10-01', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (69, 3, '74593821', 'Miguel Ángel', 'Ríos Palomino', '974593821', NULL, 'No registrada', 'natural', '2024-10-02', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (70, 3, '72964185', 'Valeria Antonella', 'Navarro Soto', '956908435', NULL, 'No registrada', 'natural', '2024-10-03', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (71, 3, '76320517', 'Brayan Steven', 'Castillo Huerta', '976320517', NULL, 'No registrada', 'natural', '2024-10-04', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (72, 3, '71758392', 'Camila Fernanda', 'López Ponce', '971758392', NULL, 'No registrada', 'natural', '2024-10-15', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (73, 3, '75486230', 'Anthony Gabriel', 'Rivera Medina', '975486230', NULL, 'No registrada', 'natural', '2024-10-16', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (74, 3, '73314068', 'Lucero Beatriz', 'Aquino Reyes', '973314068', NULL, 'No registrada', 'natural', '2024-10-17', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (75, 4, '76952413', 'Jean Pierre', 'Delgado Peña', '976952413', NULL, 'No registrada', 'natural', '2024-10-18', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (76, 4, '72183657', 'Rosa Elena', 'Cárdenas Villanueva', '989542730', NULL, 'No registrada', 'natural', '2024-01-01', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (77, 4, '74826139', 'Bryan Alexis', 'Mendoza Rojas', '946217598', NULL, 'No registrada', 'natural', '2024-10-19', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (78, 4, '73251984', 'Katherine Lizbeth', 'Poma Huerta', '973251984', NULL, 'No registrada', 'natural', '2024-10-21', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (79, 3, '76483025', 'Julio César', 'Salas Torres', '923658761', NULL, 'No registrada', 'natural', '2024-10-22', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (80, 3, '71928463', 'Melany Xiomara', 'Díaz Quispe', '958772309', NULL, 'No registrada', 'natural', '2024-10-23', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (81, 3, '75169328', 'Jorge Luis', 'Navarro Peña', '975169328', NULL, 'No registrada', 'natural', '2024-10-24', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (82, 3, '72745091', 'Diana Carolina', 'Flores Castro', '972745091', NULL, 'No registrada', 'natural', '2024-10-25', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (83, 4, '74312856', 'Edwin Renato', 'Vargas Aliaga', '974312856', NULL, 'No registrada', 'natural', '2024-10-26', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (84, 2, '73698214', 'Sharon Nicole', 'Medina León', '965371729', NULL, 'No registrada', 'natural', '2024-10-28', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (85, 2, '75847130', 'Marco Antonio', 'Rojas Silva', '975847130', NULL, 'No registrada', 'natural', '2024-10-28', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (86, 2, '72461587', 'Cinthia Milagros', 'Huamán Vera', '981436298', NULL, 'No registrada', 'natural', '2024-10-30', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (87, 3, '76913524', 'Ángel Sebastián', 'Chávez Paredes', '976913524', NULL, 'No registrada', 'natural', '2024-01-01', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (89, 3, '71896245', 'Tatiana Fernanda', 'Gutiérrez Ramos', '971896245', NULL, 'No registrada', 'natural', '2024-11-04', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (90, 4, '74732068', 'Luis Enrique', 'Palomino Soto', '974732068', NULL, 'No registrada', 'natural', '2024-11-05', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (91, 2, '73428195', 'Andrea Patricia', 'Castillo Núñez', '973428195', NULL, 'No registrada', 'natural', '2024-11-06', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (92, 3, '76205439', 'Sergio Iván', 'Torres Cárdenas', '976205439', NULL, 'No registrada', 'natural', '2024-11-08', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (93, 3, '72148736', 'Pamela Alejandra', 'Ríos Vega', '982645200', NULL, 'No registrada', 'natural', '2024-11-09', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (94, 2, '75369412', 'Jonathan David', 'Rivera Salazar', '932198864', NULL, 'No registrada', 'natural', '2024-11-11', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (95, 3, '73915287', 'Nicole Estefanía', 'Delgado Ponce', '980623715', NULL, 'No registrada', 'natural', '2024-11-12', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (96, 3, '74658193', 'César Augusto', 'Mendoza Chávez', '947351408', NULL, 'No registrada', 'natural', '2024-11-13', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (97, 3, '72834051', 'Lucía Fernanda', 'Aquino Medina', '954886237', NULL, 'No registrada', 'natural', '2024-11-15', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (98, 3, '76192438', 'Ricardo Emanuel', 'Flores Reyes', '979418635', NULL, 'No registrada', 'natural', '2024-11-18', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (99, 3, '71763084', 'Valentina Rocío', 'Quispe León', '979285023', NULL, 'No registrada', 'natural', '2024-11-19', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.clientes
(id_cliente, id_sede, dni, nombres, apellidos, telefono, email, direccion, tipo_cliente, fecha_registro, estado)
VALUES (100, 3, '73049526', 'María José', 'Cárdenas Silva', '987190642', NULL, 'No registrada', 'natural', '2024-11-25', 'activo')
ON CONFLICT (id_cliente) DO UPDATE SET
    id_sede = EXCLUDED.id_sede,
    dni = EXCLUDED.dni,
    nombres = EXCLUDED.nombres,
    apellidos = EXCLUDED.apellidos,
    telefono = EXCLUDED.telefono,
    email = EXCLUDED.email,
    direccion = EXCLUDED.direccion,
    tipo_cliente = EXCLUDED.tipo_cliente,
    fecha_registro = EXCLUDED.fecha_registro,
    estado = EXCLUDED.estado;

-- =========================================================
-- CONTRATOS
-- =========================================================
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (1, 1, 2, 3, '2024-05-25', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (2, 1, 2, 1, '2024-05-26', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (3, 2, 2, 2, '2024-05-26', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (4, 3, 2, 3, '2024-05-27', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (5, 3, 2, 1, '2024-05-27', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (6, 4, 2, 1, '2024-05-28', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (7, 5, 2, 1, '2024-05-28', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (8, 6, 2, 1, '2024-05-28', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (9, 7, 2, 1, '2024-05-28', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (10, 8, 2, 4, '2024-05-29', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (11, 9, 2, 2, '2024-05-29', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (12, 10, 2, 3, '2024-05-29', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (13, 11, 2, 1, '2024-05-30', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (14, 12, 2, 1, '2024-05-30', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (15, 13, 2, 1, '2024-06-01', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (16, 14, 2, 1, '2024-06-01', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (17, 15, 2, 3, '2024-06-02', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (18, 15, 2, 1, '2024-06-02', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (19, 16, 2, 1, '2024-06-03', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (20, 17, 2, 1, '2024-06-04', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (21, 18, 2, 2, '2024-06-05', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (22, 19, 2, 1, '2024-06-06', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (23, 20, 2, 1, '2024-06-27', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (24, 21, 2, 4, '2024-06-27', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (25, 22, 2, 2, '2024-06-28', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (26, 23, 2, 1, '2024-06-28', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (27, 24, 2, 1, '2024-06-29', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (28, 25, 2, 1, '2024-07-31', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (29, 26, 2, 6, '2024-07-31', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (30, 27, 2, 6, '2024-08-01', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (31, 27, 2, 2, '2024-08-01', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (32, 28, 2, 4, '2024-08-02', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (33, 29, 3, 1, '2024-08-03', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (34, 30, 3, 1, '2024-08-05', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (35, 31, 3, 2, '2024-08-06', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (36, 32, 2, 7, '2024-08-07', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (37, 32, 2, 2, '2024-08-08', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (38, 33, 2, 5, '2024-08-09', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (39, 34, 2, 1, '2024-08-10', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (40, 35, 2, 1, '2024-08-12', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (41, 36, 2, 1, '2024-08-13', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (42, 37, 2, 7, '2024-08-14', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (43, 37, 2, 1, '2024-08-14', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (44, 38, 3, 1, '2024-08-15', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (45, 39, 4, 3, '2024-08-16', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (46, 40, 4, 1, '2024-08-17', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (47, 41, 2, 1, '2024-08-19', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (48, 42, 4, 1, '2024-08-20', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (49, 43, 2, 1, '2024-08-21', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (50, 44, 4, 1, '2024-08-22', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (51, 45, 2, 2, '2024-08-23', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (52, 46, 4, 4, '2024-08-24', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (53, 47, 2, 1, '2024-08-28', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (54, 48, 4, 1, '2024-08-29', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (55, 49, 4, 5, '2024-08-29', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (56, 50, 4, 3, '2024-09-03', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (57, 51, 3, 1, '2024-09-04', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (58, 52, 2, 1, '2024-09-05', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (59, 53, 3, 2, '2024-09-06', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (60, 54, 2, 1, '2024-09-07', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (61, 55, 3, 6, '2024-09-09', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (62, 56, 3, 1, '2024-09-10', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (63, 57, 3, 2, '2024-09-11', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (64, 58, 3, 2, '2024-09-12', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (65, 59, 4, 3, '2024-09-13', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (66, 60, 4, 3, '2024-09-14', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (67, 61, 4, 2, '2024-09-24', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (68, 62, 4, 1, '2024-09-25', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (69, 63, 3, 1, '2024-09-26', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (70, 64, 3, 4, '2024-09-27', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (71, 65, 3, 2, '2024-09-27', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (72, 67, 3, 2, '2024-09-28', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (73, 68, 3, 2, '2024-10-01', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (74, 69, 3, 3, '2024-10-02', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (75, 70, 3, 2, '2024-10-03', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (76, 71, 3, 2, '2024-10-04', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (77, 72, 3, 1, '2024-10-15', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (78, 73, 3, 1, '2024-10-16', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (79, 74, 3, 8, '2024-10-17', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (80, 75, 4, 6, '2024-10-18', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (81, 77, 4, 1, '2024-10-19', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (82, 78, 4, 1, '2024-10-21', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (83, 79, 3, 10, '2024-10-22', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (84, 79, 3, 2, '2024-10-22', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (85, 80, 3, 2, '2024-10-23', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (86, 81, 3, 3, '2024-10-24', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (87, 82, 3, 3, '2024-10-25', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (88, 83, 4, 2, '2024-10-26', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (89, 84, 2, 1, '2024-10-28', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (90, 85, 2, 4, '2024-10-28', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (91, 86, 2, 5, '2024-10-30', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (92, 89, 3, 7, '2024-11-04', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (93, 90, 4, 1, '2024-11-05', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (94, 91, 2, 8, '2024-11-06', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (95, 91, 2, 1, '2024-11-07', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (96, 92, 3, 8, '2024-11-08', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (97, 93, 3, 1, '2024-11-09', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (98, 94, 2, 1, '2024-11-11', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (99, 95, 3, 2, '2024-11-12', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (100, 96, 3, 7, '2024-11-13', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (101, 96, 3, 1, '2024-11-13', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (102, 97, 3, 3, '2024-11-15', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (103, 98, 3, 1, '2024-11-18', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (104, 99, 3, 2, '2024-11-19', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;
INSERT INTO cablebi.contratos
(id_contrato, id_cliente, id_sede, id_plan, fecha_inicio, fecha_fin, estado, observacion)
VALUES (105, 100, 3, 4, '2024-11-25', NULL, 'activo', 'Migrado desde Access')
ON CONFLICT (id_contrato) DO UPDATE SET
    id_cliente = EXCLUDED.id_cliente,
    id_sede = EXCLUDED.id_sede,
    id_plan = EXCLUDED.id_plan,
    fecha_inicio = EXCLUDED.fecha_inicio,
    fecha_fin = EXCLUDED.fecha_fin,
    estado = EXCLUDED.estado,
    observacion = EXCLUDED.observacion;

-- =========================================================
-- PAGOS
-- =========================================================
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (1, 1, '2024-05-25', '2024-05-25', 80.0, NULL, 'ACCESS-1', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (2, 1, '2024-06-25', '2024-06-25', 80.0, NULL, 'ACCESS-2', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (3, 1, '2024-07-25', '2024-07-25', 80.0, NULL, 'ACCESS-3', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (4, 1, '2024-08-25', '2024-08-25', 80.0, NULL, 'ACCESS-4', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (5, 1, '2024-09-25', '2024-09-25', 80.0, NULL, 'ACCESS-5', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (6, 1, '2024-10-25', '2024-10-25', 80.0, NULL, 'ACCESS-6', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (7, 1, '2024-11-25', '2024-11-25', 80.0, NULL, 'ACCESS-7', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (8, 2, '2024-05-26', '2024-05-26', 50.0, NULL, 'ACCESS-8', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (9, 2, '2024-06-26', '2024-06-26', 50.0, NULL, 'ACCESS-9', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (10, 2, '2024-07-26', '2024-07-26', 50.0, NULL, 'ACCESS-10', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (11, 2, '2024-08-26', '2024-08-26', 50.0, NULL, 'ACCESS-11', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (12, 2, '2024-09-26', '2024-09-26', 50.0, NULL, 'ACCESS-12', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (13, 2, '2024-10-26', '2024-10-26', 50.0, NULL, 'ACCESS-13', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (14, 2, '2024-11-26', '2024-11-26', 50.0, NULL, 'ACCESS-14', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (15, 3, '2024-05-26', '2024-05-26', 60.0, NULL, 'ACCESS-15', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (16, 3, '2024-06-26', '2024-06-26', 60.0, NULL, 'ACCESS-16', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (17, 3, '2024-07-26', '2024-07-26', 60.0, NULL, 'ACCESS-17', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (18, 3, '2024-08-26', '2024-08-26', 60.0, NULL, 'ACCESS-18', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (19, 3, '2024-09-26', '2024-09-26', 60.0, NULL, 'ACCESS-19', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (20, 3, '2024-10-26', '2024-10-26', 60.0, NULL, 'ACCESS-20', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (21, 3, '2024-11-26', '2024-11-26', 60.0, NULL, 'ACCESS-21', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (22, 2, '2024-12-26', '2024-12-26', 0.0, NULL, 'ACCESS-22', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (23, 4, '2024-05-27', '2024-05-27', 80.0, NULL, 'ACCESS-23', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (24, 4, '2024-06-27', '2024-06-27', 80.0, NULL, 'ACCESS-24', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (25, 4, '2024-07-27', '2024-07-27', 80.0, NULL, 'ACCESS-25', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (26, 4, '2024-08-27', '2024-08-27', 80.0, NULL, 'ACCESS-26', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (27, 4, '2024-09-27', '2024-09-27', 80.0, NULL, 'ACCESS-27', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (28, 4, '2024-10-27', '2024-10-27', 80.0, NULL, 'ACCESS-28', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (29, 4, '2024-11-27', '2024-11-27', 80.0, NULL, 'ACCESS-29', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (30, 5, '2024-05-27', '2024-05-27', 50.0, NULL, 'ACCESS-30', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (31, 5, '2024-06-27', '2024-06-27', 50.0, NULL, 'ACCESS-31', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (32, 5, '2024-07-27', '2024-07-27', 50.0, NULL, 'ACCESS-32', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (33, 5, '2024-08-27', '2024-08-27', 50.0, NULL, 'ACCESS-33', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (34, 5, '2024-09-27', '2024-09-27', 50.0, NULL, 'ACCESS-34', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (35, 5, '2024-10-27', '2024-10-27', 50.0, NULL, 'ACCESS-35', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (36, 5, '2024-11-27', '2024-11-27', 50.0, NULL, 'ACCESS-36', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (37, 6, '2024-05-28', '2024-05-28', 50.0, NULL, 'ACCESS-37', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (38, 6, '2024-06-28', '2024-06-28', 50.0, NULL, 'ACCESS-38', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (39, 6, '2024-07-28', '2024-07-28', 50.0, NULL, 'ACCESS-39', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (40, 6, '2024-08-28', '2024-08-28', 50.0, NULL, 'ACCESS-40', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (41, 6, '2024-09-28', '2024-09-28', 50.0, NULL, 'ACCESS-41', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (42, 6, '2024-10-28', '2024-10-28', 50.0, NULL, 'ACCESS-42', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (43, 6, '2024-11-28', '2024-11-28', 50.0, NULL, 'ACCESS-43', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (44, 7, '2024-05-28', '2024-05-28', 50.0, NULL, 'ACCESS-44', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (45, 7, '2024-06-28', '2024-06-28', 50.0, NULL, 'ACCESS-45', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (46, 7, '2024-07-28', '2024-07-28', 50.0, NULL, 'ACCESS-46', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (47, 7, '2024-08-28', '2024-08-28', 50.0, NULL, 'ACCESS-47', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (48, 7, '2024-09-28', '2024-09-28', 50.0, NULL, 'ACCESS-48', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (49, 7, '2024-10-28', '2024-10-28', 50.0, NULL, 'ACCESS-49', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (50, 7, '2024-11-28', '2024-11-28', 50.0, NULL, 'ACCESS-50', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (51, 8, '2024-05-28', '2024-05-28', 50.0, NULL, 'ACCESS-51', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (52, 8, '2024-06-28', '2024-06-28', 50.0, NULL, 'ACCESS-52', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (53, 8, '2024-07-28', '2024-07-28', 50.0, NULL, 'ACCESS-53', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (54, 8, '2024-08-28', '2024-08-28', 50.0, NULL, 'ACCESS-54', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (55, 8, '2024-09-28', '2024-09-28', 50.0, NULL, 'ACCESS-55', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (56, 8, '2024-10-28', '2024-10-28', 50.0, NULL, 'ACCESS-56', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (57, 8, '2024-11-28', '2024-11-28', 50.0, NULL, 'ACCESS-57', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (58, 9, '2024-05-28', '2024-05-28', 50.0, NULL, 'ACCESS-58', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (59, 9, '2024-06-28', '2024-06-28', 50.0, NULL, 'ACCESS-59', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (60, 9, '2024-07-28', '2024-07-28', 50.0, NULL, 'ACCESS-60', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (61, 9, '2024-08-28', '2024-08-28', 50.0, NULL, 'ACCESS-61', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (62, 9, '2024-09-28', '2024-09-28', 50.0, NULL, 'ACCESS-62', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (63, 9, '2024-10-28', '2024-10-28', 50.0, NULL, 'ACCESS-63', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (64, 9, '2024-11-28', '2024-11-28', 50.0, NULL, 'ACCESS-64', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (65, 10, '2024-05-29', '2024-05-29', 100.0, NULL, 'ACCESS-65', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (66, 10, '2024-06-29', '2024-06-29', 100.0, NULL, 'ACCESS-66', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (67, 10, '2024-07-29', '2024-07-29', 100.0, NULL, 'ACCESS-67', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (68, 10, '2024-08-29', '2024-08-29', 100.0, NULL, 'ACCESS-68', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (69, 10, '2024-09-29', '2024-09-29', 100.0, NULL, 'ACCESS-69', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (70, 10, '2024-10-29', '2024-10-29', 100.0, NULL, 'ACCESS-70', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (71, 10, '2024-11-29', '2024-11-29', 100.0, NULL, 'ACCESS-71', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (72, 11, '2024-05-29', '2024-05-29', 60.0, NULL, 'ACCESS-72', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (73, 11, '2024-06-29', '2024-06-29', 60.0, NULL, 'ACCESS-73', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (74, 11, '2024-07-29', '2024-07-29', 60.0, NULL, 'ACCESS-74', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (75, 11, '2024-08-29', '2024-08-29', 60.0, NULL, 'ACCESS-75', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (76, 11, '2024-09-29', '2024-09-29', 60.0, NULL, 'ACCESS-76', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (77, 11, '2024-10-29', '2024-10-29', 60.0, NULL, 'ACCESS-77', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (78, 11, '2024-11-29', '2024-11-29', 60.0, NULL, 'ACCESS-78', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (79, 12, '2024-05-29', '2024-05-29', 80.0, NULL, 'ACCESS-79', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (80, 12, '2024-06-29', '2024-06-29', 80.0, NULL, 'ACCESS-80', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (81, 12, '2024-07-29', '2024-07-29', 80.0, NULL, 'ACCESS-81', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (82, 12, '2024-08-29', '2024-08-29', 80.0, NULL, 'ACCESS-82', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (83, 12, '2024-09-29', '2024-09-29', 80.0, NULL, 'ACCESS-83', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (84, 12, '2024-10-29', '2024-10-29', 80.0, NULL, 'ACCESS-84', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (85, 12, '2024-11-29', '2024-11-29', 80.0, NULL, 'ACCESS-85', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (86, 13, '2024-05-30', '2024-05-30', 50.0, NULL, 'ACCESS-86', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (87, 13, '2024-06-30', '2024-06-30', 50.0, NULL, 'ACCESS-87', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (88, 13, '2024-07-30', '2024-07-30', 50.0, NULL, 'ACCESS-88', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (89, 13, '2024-08-30', '2024-08-30', 50.0, NULL, 'ACCESS-89', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (90, 13, '2024-09-30', '2024-09-30', 50.0, NULL, 'ACCESS-90', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (91, 13, '2024-10-30', '2024-10-30', 50.0, NULL, 'ACCESS-91', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (92, 13, '2024-11-30', '2024-11-30', 50.0, NULL, 'ACCESS-92', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (93, 14, '2024-05-30', '2024-05-30', 50.0, NULL, 'ACCESS-93', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (94, 14, '2024-06-30', '2024-06-30', 50.0, NULL, 'ACCESS-94', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (95, 14, '2024-07-30', '2024-07-30', 50.0, NULL, 'ACCESS-95', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (96, 14, '2024-08-30', '2024-08-30', 50.0, NULL, 'ACCESS-96', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (97, 14, '2024-09-30', '2024-09-30', 50.0, NULL, 'ACCESS-97', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (98, 14, '2024-10-30', '2024-10-30', 50.0, NULL, 'ACCESS-98', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (99, 14, '2024-11-30', '2024-11-30', 50.0, NULL, 'ACCESS-99', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (100, 15, '2024-06-01', '2024-06-01', 50.0, NULL, 'ACCESS-100', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (101, 15, '2024-07-01', '2024-07-01', 50.0, NULL, 'ACCESS-101', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (102, 15, '2024-08-01', '2024-08-01', 50.0, NULL, 'ACCESS-102', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (103, 15, '2024-09-01', '2024-09-01', 50.0, NULL, 'ACCESS-103', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (104, 15, '2024-10-01', '2024-10-01', 50.0, NULL, 'ACCESS-104', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (105, 15, '2024-11-01', '2024-11-01', 50.0, NULL, 'ACCESS-105', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (106, 15, '2024-11-01', '2024-12-01', 50.0, NULL, 'ACCESS-106', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (107, 16, '2024-06-01', '2024-06-01', 50.0, NULL, 'ACCESS-107', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (108, 16, '2024-07-01', '2024-07-01', 50.0, NULL, 'ACCESS-108', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (109, 16, '2024-08-01', '2024-08-01', 50.0, NULL, 'ACCESS-109', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (110, 16, '2024-09-01', '2024-09-01', 50.0, NULL, 'ACCESS-110', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (111, 16, '2024-10-01', '2024-10-01', 50.0, NULL, 'ACCESS-111', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (112, 16, '2024-11-01', '2024-11-01', 50.0, NULL, 'ACCESS-112', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (113, 16, '2024-11-01', '2024-11-01', 50.0, NULL, 'ACCESS-113', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (114, 17, '2024-06-02', '2024-06-02', 80.0, NULL, 'ACCESS-114', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (115, 17, '2024-07-02', '2024-07-02', 80.0, NULL, 'ACCESS-115', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (116, 17, '2024-08-02', '2024-08-02', 80.0, NULL, 'ACCESS-116', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (117, 17, '2024-09-02', '2024-09-02', 80.0, NULL, 'ACCESS-117', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (118, 17, '2024-10-02', '2024-10-02', 80.0, NULL, 'ACCESS-118', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (119, 17, '2024-11-02', '2024-11-02', 80.0, NULL, 'ACCESS-119', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (120, 18, '2024-06-02', '2024-06-02', 50.0, NULL, 'ACCESS-120', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (121, 18, '2024-07-02', '2024-07-02', 50.0, NULL, 'ACCESS-121', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (122, 18, '2024-08-02', '2024-08-02', 50.0, NULL, 'ACCESS-122', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (123, 18, '2024-09-02', '2024-09-02', 50.0, NULL, 'ACCESS-123', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (124, 18, '2024-10-02', '2024-10-02', 50.0, NULL, 'ACCESS-124', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (125, 18, '2024-11-02', '2024-11-02', 50.0, NULL, 'ACCESS-125', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (126, 19, '2024-06-03', '2024-06-03', 50.0, NULL, 'ACCESS-126', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (127, 19, '2024-07-03', '2024-07-03', 50.0, NULL, 'ACCESS-127', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (128, 19, '2024-08-03', '2024-08-03', 50.0, NULL, 'ACCESS-128', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (129, 20, '2024-06-03', '2024-06-03', 50.0, NULL, 'ACCESS-129', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (130, 20, '2024-07-03', '2024-07-03', 50.0, NULL, 'ACCESS-130', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (131, 20, '2024-08-03', '2024-08-03', 50.0, NULL, 'ACCESS-131', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (132, 20, '2024-09-03', '2024-09-03', 50.0, NULL, 'ACCESS-132', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (133, 21, '2024-06-05', '2024-06-05', 60.0, NULL, 'ACCESS-133', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (134, 21, '2024-07-05', '2024-07-05', 60.0, NULL, 'ACCESS-134', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (135, 21, '2024-08-05', '2024-08-05', 60.0, NULL, 'ACCESS-135', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (136, 21, '2024-09-05', '2024-09-05', 60.0, NULL, 'ACCESS-136', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (137, 21, '2024-10-05', '2024-10-05', 60.0, NULL, 'ACCESS-137', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (138, 21, '2024-11-05', '2024-11-05', 60.0, NULL, 'ACCESS-138', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (139, 22, '2024-06-06', '2024-06-06', 50.0, NULL, 'ACCESS-139', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (140, 22, '2024-07-06', '2024-07-06', 50.0, NULL, 'ACCESS-140', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (141, 22, '2024-08-06', '2024-08-06', 50.0, NULL, 'ACCESS-141', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (142, 22, '2024-09-06', '2024-09-06', 50.0, NULL, 'ACCESS-142', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (143, 22, '2024-10-06', '2024-10-06', 50.0, NULL, 'ACCESS-143', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (144, 22, '2024-11-06', '2024-11-06', 50.0, NULL, 'ACCESS-144', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (145, 23, '2024-06-27', '2024-06-27', 50.0, NULL, 'ACCESS-145', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (146, 23, '2024-07-27', '2024-07-27', 50.0, NULL, 'ACCESS-146', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (147, 23, '2024-08-27', '2024-08-27', 50.0, NULL, 'ACCESS-147', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (148, 23, '2024-09-27', '2024-09-27', 50.0, NULL, 'ACCESS-148', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (149, 23, '2024-10-27', NULL, 50.0, NULL, 'ACCESS-149', 'pendiente')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (150, 24, '2024-06-27', '2024-06-27', 100.0, NULL, 'ACCESS-150', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (151, 24, '2024-07-27', '2024-07-27', 100.0, NULL, 'ACCESS-151', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (152, 24, '2024-08-27', '2024-08-27', 100.0, NULL, 'ACCESS-152', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (153, 24, '2024-09-27', '2024-09-27', 100.0, NULL, 'ACCESS-153', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (154, 24, '2024-10-27', '2024-10-27', 100.0, NULL, 'ACCESS-154', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (155, 24, '2024-11-27', '2024-11-27', 100.0, NULL, 'ACCESS-155', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (156, 25, '2024-06-28', '2024-06-28', 60.0, NULL, 'ACCESS-156', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (157, 25, '2024-07-28', '2024-07-28', 60.0, NULL, 'ACCESS-157', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (158, 26, '2024-06-28', '2024-06-28', 50.0, NULL, 'ACCESS-158', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (159, 26, '2024-07-28', '2024-07-28', 50.0, NULL, 'ACCESS-159', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (160, 26, '2024-08-28', '2024-08-28', 50.0, NULL, 'ACCESS-160', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (161, 26, '2024-09-28', '2024-09-28', 50.0, NULL, 'ACCESS-161', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (162, 26, '2024-10-28', '2024-10-28', 50.0, NULL, 'ACCESS-162', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (163, 26, '2024-11-28', '2024-11-28', 50.0, NULL, 'ACCESS-163', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (164, 27, '2024-06-29', '2024-06-29', 50.0, NULL, 'ACCESS-164', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (165, 27, '2024-07-29', '2024-07-29', 50.0, NULL, 'ACCESS-165', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (166, 27, '2024-08-29', '2024-08-29', 50.0, NULL, 'ACCESS-166', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (167, 27, '2024-09-29', '2024-09-29', 50.0, NULL, 'ACCESS-167', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (168, 27, '2024-10-29', '2024-10-29', 50.0, NULL, 'ACCESS-168', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (169, 27, '2024-11-29', '2024-11-29', 50.0, NULL, 'ACCESS-169', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (170, 28, '2024-07-31', '2024-07-31', 50.0, NULL, 'ACCESS-170', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (171, 28, '2024-08-31', '2024-08-31', 50.0, NULL, 'ACCESS-171', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (172, 29, '2024-07-31', '2024-07-31', 200.0, NULL, 'ACCESS-172', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (173, 30, '2024-08-01', '2024-08-01', 200.0, NULL, 'ACCESS-173', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (174, 30, '2024-09-01', '2024-09-01', 200.0, NULL, 'ACCESS-174', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (175, 30, '2024-10-01', '2024-10-01', 200.0, NULL, 'ACCESS-175', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (176, 30, '2024-11-01', '2024-11-01', 200.0, NULL, 'ACCESS-176', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (177, 31, '2024-08-01', '2024-08-01', 60.0, NULL, 'ACCESS-177', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (178, 31, '2024-09-01', '2024-09-01', 60.0, NULL, 'ACCESS-178', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (179, 31, '2024-10-01', '2024-10-01', 60.0, NULL, 'ACCESS-179', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (180, 31, '2024-11-01', '2024-11-01', 60.0, NULL, 'ACCESS-180', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (181, 32, '2024-08-02', '2024-08-02', 100.0, NULL, 'ACCESS-181', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (182, 32, '2024-09-02', '2024-09-02', 100.0, NULL, 'ACCESS-182', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (183, 32, '2024-10-02', '2024-10-02', 100.0, NULL, 'ACCESS-183', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (184, 32, '2024-11-02', '2024-11-02', 100.0, NULL, 'ACCESS-184', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (185, 33, '2024-08-03', '2024-08-03', 50.0, NULL, 'ACCESS-185', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (186, 33, '2024-09-03', '2024-09-03', 50.0, NULL, 'ACCESS-186', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (187, 33, '2024-10-03', '2024-10-03', 50.0, NULL, 'ACCESS-187', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (188, 33, '2024-11-03', '2024-11-03', 50.0, NULL, 'ACCESS-188', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (189, 34, '2024-08-03', '2024-08-03', 50.0, NULL, 'ACCESS-189', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (190, 34, '2024-09-05', '2024-09-05', 50.0, NULL, 'ACCESS-190', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (191, 34, '2024-10-05', '2024-10-05', 50.0, NULL, 'ACCESS-191', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (192, 34, '2024-11-05', '2024-11-05', 50.0, NULL, 'ACCESS-192', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (193, 35, '2024-08-06', '2024-08-06', 60.0, NULL, 'ACCESS-193', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (194, 35, '2024-09-06', '2024-09-06', 60.0, NULL, 'ACCESS-194', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (195, 35, '2024-10-06', '2024-10-06', 60.0, NULL, 'ACCESS-195', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (196, 35, '2024-11-06', '2024-11-06', 60.0, NULL, 'ACCESS-196', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (197, 36, '2024-08-07', '2024-08-07', 250.0, NULL, 'ACCESS-197', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (198, 36, '2024-09-07', '2024-09-07', 250.0, NULL, 'ACCESS-198', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (199, 36, '2024-10-07', '2024-10-07', 250.0, NULL, 'ACCESS-199', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (200, 36, '2024-11-07', '2024-11-07', 250.0, NULL, 'ACCESS-200', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (201, 37, '2024-08-08', '2024-08-08', 60.0, NULL, 'ACCESS-201', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (202, 37, '2024-09-08', '2024-09-08', 60.0, NULL, 'ACCESS-202', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (203, 37, '2024-10-08', '2024-10-08', 60.0, NULL, 'ACCESS-203', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (204, 37, '2024-11-08', '2024-11-08', 60.0, NULL, 'ACCESS-204', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (205, 38, '2024-08-09', '2024-08-09', 150.0, NULL, 'ACCESS-205', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (206, 39, '2024-08-10', '2024-08-10', 50.0, NULL, 'ACCESS-206', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (207, 39, '2024-09-10', '2024-09-10', 50.0, NULL, 'ACCESS-207', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (208, 39, '2024-10-10', '2024-10-10', 50.0, NULL, 'ACCESS-208', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (209, 39, '2024-11-10', '2024-11-10', 50.0, NULL, 'ACCESS-209', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (210, 40, '2024-08-12', '2024-08-12', 50.0, NULL, 'ACCESS-210', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (211, 40, '2024-09-12', '2024-09-12', 50.0, NULL, 'ACCESS-211', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (212, 40, '2024-10-12', '2024-10-12', 50.0, NULL, 'ACCESS-212', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (213, 40, '2024-11-12', '2024-11-12', 50.0, NULL, 'ACCESS-213', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (214, 41, '2024-08-13', '2024-08-13', 50.0, NULL, 'ACCESS-214', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (215, 41, '2024-09-13', '2024-09-13', 50.0, NULL, 'ACCESS-215', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (216, 41, '2024-10-13', '2024-10-13', 50.0, NULL, 'ACCESS-216', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (217, 41, '2024-11-13', '2024-11-13', 50.0, NULL, 'ACCESS-217', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (218, 42, '2024-08-14', '2024-08-14', 250.0, NULL, 'ACCESS-218', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (219, 42, '2024-09-14', '2024-09-14', 250.0, NULL, 'ACCESS-219', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (220, 42, '2024-10-14', '2024-10-14', 250.0, NULL, 'ACCESS-220', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (221, 42, '2024-11-14', '2024-11-14', 250.0, NULL, 'ACCESS-221', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (222, 43, '2024-08-14', '2024-08-14', 50.0, NULL, 'ACCESS-222', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (223, 43, '2024-09-14', '2024-09-14', 50.0, NULL, 'ACCESS-223', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (224, 43, '2024-10-14', '2024-10-14', 50.0, NULL, 'ACCESS-224', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (225, 43, '2024-11-14', '2024-11-14', 50.0, NULL, 'ACCESS-225', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (226, 44, '2024-08-15', '2024-08-15', 50.0, NULL, 'ACCESS-226', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (227, 44, '2024-09-15', '2024-09-15', 50.0, NULL, 'ACCESS-227', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (228, 45, '2024-08-16', '2024-06-15', 100.0, NULL, 'ACCESS-228', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (229, 45, '2024-08-16', '2024-06-15', 100.0, NULL, 'ACCESS-229', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (230, 46, '2024-08-17', '2024-08-17', 50.0, NULL, 'ACCESS-230', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (231, 46, '2024-09-17', '2024-09-17', 50.0, NULL, 'ACCESS-231', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (232, 46, '2024-10-17', '2024-10-17', 50.0, NULL, 'ACCESS-232', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (233, 46, '2024-11-17', '2024-11-17', 50.0, NULL, 'ACCESS-233', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (234, 47, '2024-08-19', '2024-08-19', 50.0, NULL, 'ACCESS-234', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (235, 47, '2024-09-19', '2024-09-19', 50.0, NULL, 'ACCESS-235', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (236, 47, '2024-10-19', '2024-10-19', 50.0, NULL, 'ACCESS-236', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (237, 47, '2024-11-19', '2024-11-19', 50.0, NULL, 'ACCESS-237', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (238, 48, '2024-08-20', '2024-08-20', 50.0, NULL, 'ACCESS-238', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (239, 48, '2024-09-20', '2024-09-20', 50.0, NULL, 'ACCESS-239', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (240, 48, '2024-10-20', '2024-10-20', 50.0, NULL, 'ACCESS-240', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (241, 48, '2024-11-20', '2024-11-20', 50.0, NULL, 'ACCESS-241', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (242, 49, '2024-08-21', '2024-08-21', 50.0, NULL, 'ACCESS-242', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (243, 49, '2024-09-21', '2024-09-21', 50.0, NULL, 'ACCESS-243', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (244, 49, '2024-10-21', '2024-10-21', 50.0, NULL, 'ACCESS-244', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (245, 49, '2024-11-21', '2024-11-21', 50.0, NULL, 'ACCESS-245', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (246, 50, '2024-08-22', '2024-08-22', 50.0, NULL, 'ACCESS-246', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (247, 50, '2024-09-22', '2024-09-22', 50.0, NULL, 'ACCESS-247', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (248, 50, '2024-10-22', '2024-10-22', 50.0, NULL, 'ACCESS-248', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (249, 50, '2024-11-22', '2024-11-22', 50.0, NULL, 'ACCESS-249', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (250, 51, '2024-08-23', '2024-08-23', 60.0, NULL, 'ACCESS-250', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (251, 51, '2024-09-23', '2024-09-23', 60.0, NULL, 'ACCESS-251', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (252, 51, '2024-10-23', '2024-10-23', 60.0, NULL, 'ACCESS-252', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (253, 51, '2024-11-23', '2024-11-23', 60.0, NULL, 'ACCESS-253', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (254, 52, '2024-08-24', '2024-08-24', 100.0, NULL, 'ACCESS-254', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (255, 52, '2024-09-24', '2024-09-24', 100.0, NULL, 'ACCESS-255', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (256, 52, '2024-10-24', '2024-10-24', 100.0, NULL, 'ACCESS-256', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (257, 52, '2024-11-24', '2024-11-24', 100.0, NULL, 'ACCESS-257', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (258, 53, '2024-08-28', '2024-08-28', 50.0, NULL, 'ACCESS-258', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (259, 53, '2024-09-28', NULL, 50.0, NULL, 'ACCESS-259', 'pendiente')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (260, 54, '2024-08-29', '2024-08-29', 50.0, NULL, 'ACCESS-260', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (261, 54, '2024-09-29', '2024-09-29', 50.0, NULL, 'ACCESS-261', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (262, 54, '2024-10-29', '2024-10-29', 50.0, NULL, 'ACCESS-262', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (263, 54, '2024-11-29', '2024-11-29', 50.0, NULL, 'ACCESS-263', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (264, 55, '2024-08-29', '2024-08-29', 150.0, NULL, 'ACCESS-264', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (265, 55, '2024-09-29', '2024-09-29', 150.0, NULL, 'ACCESS-265', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (266, 55, '2024-10-29', '2024-10-29', 150.0, NULL, 'ACCESS-266', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (267, 55, '2024-11-29', '2024-11-29', 150.0, NULL, 'ACCESS-267', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (268, 56, '2024-09-03', '2024-09-03', 100.0, NULL, 'ACCESS-268', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (269, 56, '2024-10-03', '2024-10-03', 100.0, NULL, 'ACCESS-269', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (270, 56, '2024-11-03', '2024-11-03', 100.0, NULL, 'ACCESS-270', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (271, 56, '2024-12-03', '2024-12-03', 100.0, NULL, 'ACCESS-271', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (272, 57, '2024-09-04', '2024-09-04', 50.0, NULL, 'ACCESS-272', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (273, 57, '2024-10-04', '2024-10-04', 50.0, NULL, 'ACCESS-273', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (274, 57, '2024-11-04', '2024-11-04', 50.0, NULL, 'ACCESS-274', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (275, 57, '2024-12-04', '2024-12-04', 50.0, NULL, 'ACCESS-275', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (276, 58, '2024-09-05', '2024-09-05', 50.0, NULL, 'ACCESS-276', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (277, 58, '2024-10-05', '2024-10-05', 50.0, NULL, 'ACCESS-277', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (278, 58, '2024-11-05', '2024-11-05', 50.0, NULL, 'ACCESS-278', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (279, 59, '2024-09-06', '2024-09-06', 60.0, NULL, 'ACCESS-279', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (280, 59, '2024-10-06', '2024-10-06', 60.0, NULL, 'ACCESS-280', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (281, 59, '2024-11-06', '2024-11-06', 60.0, NULL, 'ACCESS-281', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (282, 60, '2024-09-07', '2024-09-07', 50.0, NULL, 'ACCESS-282', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (283, 60, '2024-10-07', '2024-10-07', 50.0, NULL, 'ACCESS-283', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (284, 60, '2024-11-07', '2024-11-07', 50.0, NULL, 'ACCESS-284', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (285, 61, '2024-09-09', '2024-09-09', 200.0, NULL, 'ACCESS-285', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (286, 61, '2024-10-09', '2024-10-09', 200.0, NULL, 'ACCESS-286', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (287, 61, '2024-11-09', '2024-11-09', 200.0, NULL, 'ACCESS-287', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (288, 62, '2024-09-10', '2024-09-10', 50.0, NULL, 'ACCESS-288', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (289, 62, '2024-10-10', '2024-10-10', 50.0, NULL, 'ACCESS-289', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (290, 62, '2024-11-10', '2024-11-10', 50.0, NULL, 'ACCESS-290', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (291, 63, '2024-09-10', '2024-09-10', 60.0, NULL, 'ACCESS-291', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (292, 63, '2024-10-10', '2024-10-10', 60.0, NULL, 'ACCESS-292', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (293, 63, '2024-11-10', '2024-11-10', 60.0, NULL, 'ACCESS-293', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (294, 63, '2024-12-10', '2024-12-10', 60.0, NULL, 'ACCESS-294', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (295, 64, '2024-09-10', '2024-09-10', 60.0, NULL, 'ACCESS-295', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (296, 64, '2024-10-10', '2024-10-10', 60.0, NULL, 'ACCESS-296', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (297, 64, '2024-11-10', '2024-11-10', 60.0, NULL, 'ACCESS-297', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (298, 65, '2024-09-13', '2024-09-13', 80.0, NULL, 'ACCESS-298', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (299, 66, '2024-09-14', '2024-09-14', 80.0, NULL, 'ACCESS-299', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (300, 66, '2024-10-14', '2024-10-14', 80.0, NULL, 'ACCESS-300', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (301, 66, '2024-11-14', '2024-11-14', 80.0, NULL, 'ACCESS-301', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (302, 67, '2024-09-24', '2024-09-24', 60.0, NULL, 'ACCESS-302', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (303, 67, '2024-10-24', '2024-10-24', 60.0, NULL, 'ACCESS-303', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (304, 67, '2024-11-24', '2024-11-24', 60.0, NULL, 'ACCESS-304', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (305, 68, '2024-09-25', '2024-09-25', 50.0, NULL, 'ACCESS-305', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (306, 68, '2024-10-25', '2024-10-25', 50.0, NULL, 'ACCESS-306', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (307, 68, '2024-11-25', '2024-11-25', 50.0, NULL, 'ACCESS-307', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (308, 69, '2024-09-26', '2024-09-26', 50.0, NULL, 'ACCESS-308', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (309, 69, '2024-10-26', '2024-10-26', 50.0, NULL, 'ACCESS-309', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (310, 69, '2024-11-26', '2024-11-26', 50.0, NULL, 'ACCESS-310', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (311, 70, '2024-09-27', '2024-09-27', 100.0, NULL, 'ACCESS-311', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (312, 70, '2024-10-27', '2024-10-27', 100.0, NULL, 'ACCESS-312', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (313, 70, '2024-11-27', '2024-11-27', 100.0, NULL, 'ACCESS-313', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (314, 71, '2024-09-27', '2024-09-27', 60.0, NULL, 'ACCESS-314', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (315, 71, '2024-10-27', '2024-10-27', 60.0, NULL, 'ACCESS-315', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (316, 71, '2024-11-27', '2024-11-27', 60.0, NULL, 'ACCESS-316', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (317, 72, '2024-09-28', '2024-09-28', 60.0, NULL, 'ACCESS-317', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (318, 72, '2024-10-28', '2024-10-28', 60.0, NULL, 'ACCESS-318', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (319, 72, '2024-11-28', '2024-11-28', 60.0, NULL, 'ACCESS-319', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (320, 73, '2024-10-01', NULL, 60.0, NULL, 'ACCESS-320', 'pendiente')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (321, 74, '2024-10-02', '2024-10-02', 80.0, NULL, 'ACCESS-321', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (322, 74, '2024-11-02', '2024-11-02', 80.0, NULL, 'ACCESS-322', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (323, 75, '2024-10-03', '2024-10-03', 60.0, NULL, 'ACCESS-323', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (324, 75, '2024-11-03', '2024-11-03', 60.0, NULL, 'ACCESS-324', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (325, 76, '2024-10-04', '2024-10-04', 60.0, NULL, 'ACCESS-325', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (326, 76, '2024-11-04', '2024-11-04', 60.0, NULL, 'ACCESS-326', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (327, 77, '2024-10-15', '2024-10-15', 50.0, NULL, 'ACCESS-327', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (328, 77, '2024-11-15', '2024-11-15', 50.0, NULL, 'ACCESS-328', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (329, 78, '2024-10-15', '2024-10-15', 50.0, NULL, 'ACCESS-329', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (330, 78, '2024-11-15', '2024-11-15', 50.0, NULL, 'ACCESS-330', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (331, 79, '2024-10-17', '2024-10-17', 300.0, NULL, 'ACCESS-331', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (332, 79, '2024-11-17', '2024-11-17', 300.0, NULL, 'ACCESS-332', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (333, 80, '2024-10-18', '2024-10-18', 200.0, NULL, 'ACCESS-333', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (334, 80, '2024-11-18', '2024-11-18', 200.0, NULL, 'ACCESS-334', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (335, 81, '2024-10-19', '2024-10-19', 50.0, NULL, 'ACCESS-335', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (336, 81, '2024-11-19', NULL, 0.0, NULL, 'ACCESS-336', 'pendiente')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (337, 82, '2024-10-21', '2024-10-21', 50.0, NULL, 'ACCESS-337', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (338, 82, '2024-11-21', '2024-11-21', 50.0, NULL, 'ACCESS-338', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (339, 83, '2024-10-22', '2024-10-22', 400.0, NULL, 'ACCESS-339', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (340, 83, '2024-11-22', '2024-11-22', 400.0, NULL, 'ACCESS-340', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (341, 84, '2024-10-22', '2024-10-22', 60.0, NULL, 'ACCESS-341', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (342, 84, '2024-11-22', '2024-11-22', 60.0, NULL, 'ACCESS-342', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (343, 85, '2024-10-23', '2024-10-23', 60.0, NULL, 'ACCESS-343', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (344, 85, '2024-11-23', '2024-11-23', 60.0, NULL, 'ACCESS-344', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (345, 86, '2024-10-24', '2024-10-24', 80.0, NULL, 'ACCESS-345', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (346, 86, '2024-11-24', '2024-11-24', 80.0, NULL, 'ACCESS-346', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (347, 87, '2024-10-25', '2024-10-25', 80.0, NULL, 'ACCESS-347', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (348, 87, '2024-11-25', '2024-11-25', 80.0, NULL, 'ACCESS-348', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (349, 88, '2024-10-26', '2024-10-26', 60.0, NULL, 'ACCESS-349', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (350, 88, '2024-11-26', '2024-11-26', 60.0, NULL, 'ACCESS-350', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (351, 89, '2024-10-28', '2024-10-28', 50.0, NULL, 'ACCESS-351', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (352, 90, '2024-10-28', '2024-10-28', 100.0, NULL, 'ACCESS-352', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (353, 90, '2024-11-28', '2024-11-28', 100.0, NULL, 'ACCESS-353', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (354, 91, '2024-10-30', '2024-10-30', 150.0, NULL, 'ACCESS-354', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (355, 91, '2024-11-30', '2024-11-30', 150.0, NULL, 'ACCESS-355', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (356, 92, '2024-11-04', '2024-11-04', 250.0, NULL, 'ACCESS-356', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (357, 93, '2024-11-05', '2024-11-05', 50.0, NULL, 'ACCESS-357', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (358, 94, '2024-11-06', '2024-11-06', 300.0, NULL, 'ACCESS-358', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (359, 95, '2024-11-07', '2024-11-07', 50.0, NULL, 'ACCESS-359', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (360, 96, '2024-11-08', '2024-11-08', 300.0, NULL, 'ACCESS-360', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (361, 97, '2024-11-09', '2024-11-09', 50.0, NULL, 'ACCESS-361', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (362, 98, '2024-11-11', '2024-11-11', 50.0, NULL, 'ACCESS-362', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (363, 99, '2024-11-12', '2024-11-12', 60.0, NULL, 'ACCESS-363', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (364, 100, '2024-11-13', '2024-11-13', 250.0, NULL, 'ACCESS-364', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (365, 101, '2024-11-13', '2024-11-13', 50.0, NULL, 'ACCESS-365', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (366, 102, '2024-11-15', '2024-11-15', 80.0, NULL, 'ACCESS-366', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (367, 103, '2024-11-18', '2024-11-18', 50.0, NULL, 'ACCESS-367', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (368, 104, '2024-11-19', '2024-11-19', 60.0, NULL, 'ACCESS-368', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;
INSERT INTO cablebi.pagos
(id_pago, id_contrato, fecha_emision, fecha_pago, monto, metodo_pago, referencia, estado)
VALUES (369, 105, '2024-11-25', '2024-11-25', 100.0, NULL, 'ACCESS-369', 'pagado')
ON CONFLICT (id_pago) DO UPDATE SET
    id_contrato = EXCLUDED.id_contrato,
    fecha_emision = EXCLUDED.fecha_emision,
    fecha_pago = EXCLUDED.fecha_pago,
    monto = EXCLUDED.monto,
    metodo_pago = EXCLUDED.metodo_pago,
    referencia = EXCLUDED.referencia,
    estado = EXCLUDED.estado;

-- =========================================================
-- ACTUALIZAR SECUENCIAS / IDENTITY DESPUÉS DE INSERTAR IDS MANUALES
-- =========================================================
SELECT setval(pg_get_serial_sequence('cablebi.sedes','id_sede'), COALESCE((SELECT MAX(id_sede) FROM cablebi.sedes), 1), TRUE);
SELECT setval(pg_get_serial_sequence('cablebi.planes','id_plan'), COALESCE((SELECT MAX(id_plan) FROM cablebi.planes), 1), TRUE);
SELECT setval(pg_get_serial_sequence('cablebi.clientes','id_cliente'), COALESCE((SELECT MAX(id_cliente) FROM cablebi.clientes), 1), TRUE);
SELECT setval(pg_get_serial_sequence('cablebi.contratos','id_contrato'), COALESCE((SELECT MAX(id_contrato) FROM cablebi.contratos), 1), TRUE);
SELECT setval(pg_get_serial_sequence('cablebi.pagos','id_pago'), COALESCE((SELECT MAX(id_pago) FROM cablebi.pagos), 1), TRUE);

COMMIT;

-- =========================================================
-- VALIDACIÓN
-- =========================================================
SELECT 'sedes' AS tabla, COUNT(*) AS total FROM cablebi.sedes
UNION ALL SELECT 'planes', COUNT(*) FROM cablebi.planes
UNION ALL SELECT 'clientes', COUNT(*) FROM cablebi.clientes
UNION ALL SELECT 'contratos', COUNT(*) FROM cablebi.contratos
UNION ALL SELECT 'pagos', COUNT(*) FROM cablebi.pagos;

SELECT * FROM cablebi.v_dashboard_general;
SELECT * FROM cablebi.v_resumen_sedes ORDER BY id_sede;
