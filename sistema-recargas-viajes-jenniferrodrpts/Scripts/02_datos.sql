INSERT INTO auditoria_tarjetas (tarjeta_id, estado_anterior, estado_nuevo, fecha_cambio) VALUES
(1, 'Activa', 'Bloqueada', '2024-01-15'),
(1, 'Bloqueada', 'Activa', '2024-03-10'),
(2, 'Activa', 'Cancelada', '2024-02-20'),
(3, 'Activa', 'Bloqueada', '2024-03-15'),
(4, 'Bloqueada', 'Activa', '2024-04-01');

INSERT INTO promociones (promocion_id, nombre, descripcion, tipo) VALUES
(1, 'Bonus Bienvenida', 'Recibe un 10% extra en tu primera recarga', 'bono'),
(2, 'Descuento Estudiante', '20% de descuento para estudiantes', 'descuento'),
(3, 'Promo Bonus Abril', 'Bonificación especial durante abril', 'bono');

UPDATE recargas SET promocion_id = 1 WHERE recarga_id = 1;
UPDATE recargas SET promocion_id = 2 WHERE recarga_id = 2;
UPDATE recargas SET promocion_id = 3 WHERE recarga_id = 3;
UPDATE recargas SET promocion_id = 1 WHERE recarga_id = 4;
UPDATE recargas SET promocion_id = 3 WHERE recarga_id = 5;

INSERT INTO dispositivos (dispositivo_id, tipo, ubicacion) VALUES
(1, 'torniquete', 'Estación Central'),
(2, 'móvil', 'Bus Línea 102'),
(3, 'móvil', 'Bus Línea 203'),
(4, 'torniquete', 'Estación Norte');

UPDATE viajes SET dispositivo_id = 1 WHERE viaje_id = 1;
UPDATE viajes SET dispositivo_id = 2 WHERE viaje_id = 2;
UPDATE viajes SET dispositivo_id = 2 WHERE viaje_id = 3;
UPDATE viajes SET dispositivo_id = NULL WHERE viaje_id = 4; 
UPDATE viajes SET dispositivo_id = 3 WHERE viaje_id = 5;

INSERT INTO incidencias (incidencia_id, viaje_id, descripcion, tipo, fecha) VALUES
(1, 1, 'El torniquete no funcionaba', 'falla técnica', '2025-04-30'),
(2, 2, 'Retraso de más de 15 minutos', 'retraso', '2025-04-28'),
(3, 3, 'Problema con la tarjeta al validar', 'fallo de validación', '2025-04-29');
