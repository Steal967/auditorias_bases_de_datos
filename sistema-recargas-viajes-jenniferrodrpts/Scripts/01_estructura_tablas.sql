
create database sistema_recargas_viajes_grupito_bd template sistema_recargas_viajes_base;


SELECT * FROM tarjetas;

CREATE TABLE auditoria_tarjetas (
    auditoria_id SERIAL PRIMARY KEY,
    tarjeta_id INT REFERENCES tarjetas(tarjeta_id),
    estado_anterior VARCHAR(50),
    estado_nuevo VARCHAR(50),
    fecha_cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE promociones (
    promocion_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    tipo VARCHAR(50)  
);

ALTER TABLE recargas ADD COLUMN promocion_id INT REFERENCES promociones(promocion_id);

CREATE TABLE dispositivos (
    dispositivo_id SERIAL PRIMARY KEY,
    tipo VARCHAR(50), 
    ubicacion VARCHAR(100)
);

ALTER TABLE viajes ADD COLUMN dispositivo_id INT REFERENCES dispositivos(dispositivo_id);


CREATE TABLE incidencias (
    incidencia_id SERIAL PRIMARY KEY,
    viaje_id INT REFERENCES viajes(viaje_id),
    descripcion TEXT,
    tipo VARCHAR(50), 
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
