SELECT TO_CHAR(fecha_cambio, 'YYYY-MM') AS mes,
    COUNT(*) AS cambios
FROM auditoria_tarjetas
GROUP BY mes
ORDER BY mes;
-- Auditoría: las 5 tarjetas con mayor número de cambios de estado
SELECT tarjeta_id,
    COUNT(*) AS total_cambios
FROM auditoria_tarjetas
GROUP BY tarjeta_id
ORDER BY total_cambios DESC
LIMIT 5;
-- Recargas con descripción de la promoción aplicada
SELECT r.recarga_id,
    r.monto,
    r.fecha,
    p.nombre,
    p.descripcion
FROM recargas r
    JOIN promociones p ON r.promocion_id = p.promocion_id;
-- Monto total recargado por cada tipo de promoción en los últimos 3 meses
SELECT recarga_id,
    fecha
FROM recargas;
UPDATE recargas
SET fecha = CURRENT_DATE - INTERVAL '1 month'
WHERE recarga_id BETWEEN 1 AND 5;


SELECT p.tipo,
    SUM(r.monto) AS total_monto
FROM recargas r
    JOIN promociones p ON r.promocion_id = p.promocion_id
WHERE r.fecha >= CURRENT_DATE - INTERVAL '3 months'
GROUP BY p.tipo;
-- Promociones cuyo nombre contenga la palabra bonus
SELECT *
FROM promociones
WHERE LOWER(nombre) LIKE '%bonus%';
-- Viajes sin registro de validación
SELECT *
FROM viajes
WHERE dispositivo_id IS NULL;
-- Validaciones realizadas por dispositivos de tipo móvil en abril de 2025
SELECT viaje_id,
    fecha,
    dispositivo_id
FROM viajes;
UPDATE viajes
SET fecha = '2025-04-10'
WHERE viaje_id = 2;
UPDATE viajes
SET fecha = '2025-04-15'
WHERE viaje_id = 3;
SELECT v.*
FROM viajes v
    JOIN dispositivos d ON v.dispositivo_id = d.dispositivo_id
WHERE d.tipo = 'móvil'
    AND DATE_TRUNC('month', v.fecha) = DATE '2025-04-01';
-- Dispositivo con mayor cantidad de validaciones
SELECT d.dispositivo_id,
    d.tipo,
    COUNT(v.viaje_id) AS total_validaciones
FROM dispositivos d
    JOIN viajes v ON d.dispositivo_id = v.dispositivo_id
GROUP BY d.dispositivo_id,
    d.tipo
ORDER BY total_validaciones DESC
LIMIT 1;
-- Mejora propuesta: tabla incidencias - cantidad de incidencias por tipo
SELECT tipo,
    COUNT(*) AS total
FROM incidencias
GROUP BY tipo;
-- Incidencias por estación de abordaje (JOIN)
SELECT e.nombre,
    COUNT(*) AS total_incidencias
FROM incidencias i
    JOIN viajes v ON i.viaje_id = v.viaje_id
    JOIN estaciones e ON v.estacion_abordaje_id = e.estacion_id
GROUP BY e.nombre;
--  Detalle de incidencias con usuario involucrado (JOIN)
SELECT u.nombre,
    u.apellido,
    i.descripcion,
    i.tipo,
    i.fecha
FROM incidencias i
    JOIN viajes v ON i.viaje_id = v.viaje_id
    JOIN tarjetas t ON v.tarjeta_id = t.tarjeta_id
    JOIN usuarios u ON t.usuario_id = u.usuario_id;