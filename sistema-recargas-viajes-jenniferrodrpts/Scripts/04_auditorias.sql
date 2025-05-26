
UPDATE auditoria_tarjetas
SET fecha_cambio = fecha_cambio + INTERVAL '1 year'
WHERE fecha_cambio < CURRENT_DATE - INTERVAL '1 year';


UPDATE recargas
SET fecha = CURRENT_DATE - INTERVAL '1 month'
WHERE recarga_id IN (1, 2, 3, 4, 5);

UPDATE viajes
SET fecha = '2025-04-10'
WHERE viaje_id = 2;
UPDATE viajes
SET fecha = '2025-04-15'
WHERE viaje_id = 3;

SELECT TO_CHAR(DATE_TRUNC('month', fecha_cambio), 'YYYY-MM') AS mes,
    COUNT(*) AS cambios
FROM auditoria_tarjetas
WHERE fecha_cambio >= CURRENT_DATE - INTERVAL '1 year'
GROUP BY DATE_TRUNC('month', fecha_cambio)
ORDER BY mes;

SELECT tarjeta_id,
    COUNT(*) AS total_cambios
FROM auditoria_tarjetas
GROUP BY tarjeta_id
ORDER BY total_cambios DESC
LIMIT 5;