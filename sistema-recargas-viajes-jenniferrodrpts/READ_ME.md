Base de datos: sistema_recargas_viajes__jenniferrodrpts

## 🎯 Objetivo del Proyecto

El objetivo principal de este proyecto es diseñar y extender una base de datos para un sistema de transporte que administre tarjetas de usuario, recargas, viajes, dispositivos de validación, auditoría de tarjetas, promociones, y mejoras como el registro de incidencias.
Se busca analizar el comportamiento de los usuarios, el uso de promociones, y el funcionamiento del sistema de validaciones, además de detectar fallos operativos o incidencias.

## 🧩 Modelo Entidad-Relación (ER)

| Tabla                | Atributos Clave                                             | Relaciones y Descripción                                                                 |
|----------------------|-------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| **usuarios**         | `usuario_id` (PK)                                           | Un usuario puede tener varias tarjetas.                                                  |
| **tarjetas**         | `tarjeta_id` (PK), `usuario_id` (FK)                        | Relacionada con usuarios. Puede tener muchas recargas y muchos viajes.                   |
| **recargas**         | `recarga_id` (PK), `tarjeta_id` (FK), `promocion_id` (FK)   | Relacionada con tarjetas y promociones.                                                  |
| **promociones**      | `promocion_id` (PK)                                         | Una promoción puede estar asociada a varias recargas.                                    |
| **viajes**           | `viaje_id` (PK), `tarjeta_id` (FK), `estacion_abordaje_id` (FK), `dispositivo_id` (FK) | Relacionada con tarjetas, estaciones y dispositivos.                          |
| **estaciones**       | `estacion_id` (PK)                                          | Una estación puede tener muchos viajes como punto de abordaje.                          |
| **dispositivos**     | `dispositivo_id` (PK)                                       | Cada dispositivo puede registrar muchos viajes.                                          |
| **auditoria_tarjetas** | `auditoria_id` (PK), `tarjeta_id` (FK)                   | Registra los cambios de estado de cada tarjeta.                                          |
| **incidencias**      | `incidencia_id` (PK), `viaje_id` (FK)                       | Relacionada con viajes. Permite registrar eventos como fallas o retrasos.                |



## 🛠️ Descripción de Mejoras a la Base
Se propusieron e implementaron tres mejoras sobre el modelo base:

Auditoría de tarjetas:
Se agregó una tabla auditoria_tarjetas para llevar un historial de cambios de estado de las tarjetas (por ejemplo, de activa a bloqueada), con fecha de cambio.

Promociones en recargas:
Se creó la tabla promociones y se modificó la tabla recargas para incluir el campo promocion_id, permitiendo así analizar el impacto de promociones en el monto recargado.

Dispositivos e incidencias:

Se creó la tabla dispositivos (tipo, ubicación) y se asoció a viajes, para registrar dónde se validó cada viaje.

Se agregó una mejora adicional con la tabla incidencias, que permite registrar eventos negativos o fallas ocurridas en viajes (como retrasos o errores de validación).

🕵️ Explicación de Auditorías
La auditoría de tarjetas permite:

Registrar cada vez que una tarjeta cambia de estado.

Analizar patrones de cambios por mes o por tarjeta.

Identificar posibles fraudes, errores operativos, o mal uso de las tarjetas.

Este historial es esencial para evaluar la estabilidad del sistema y la experiencia del usuario.

## 📜 Explicación de Scripts

1. Script de estructura
Crea las siguientes tablas adicionales:

auditoria_tarjetas (relacionada con tarjetas)

promociones (relacionada con recargas)

dispositivos (relacionada con viajes)

incidencias (relacionada con viajes)

Y modifica las tablas recargas y viajes para soportar promociones y validación por dispositivos.

2. Script de datos
Agrega datos de prueba en las nuevas tablas:

Cambios de estado en tarjetas.

Promociones y asociación a recargas.

Dispositivos registrados y asignados a viajes.

Incidencias ocurridas en ciertos viajes.

También se actualizan fechas clave para análisis posteriores (viajes en abril 2025, recargas recientes).

3. Script de consultas
Consulta distintos aspectos del sistema:

Cambios mensuales en tarjetas (auditoría).

Top 5 tarjetas con más cambios de estado.

Recargas con su promoción.

Total recargado por tipo de promoción en últimos 3 meses.

Promociones con la palabra "bonus".

Viajes sin dispositivo de validación.

Validaciones hechas por dispositivos móviles en abril 2025.

Dispositivo más usado en validaciones.

Cantidad de incidencias por tipo.

Incidencias por estación de abordaje.

Incidencias con usuario involucrado.

4. Script de auditoría y actualización
Este script:

Actualiza fechas antiguas de auditoría al último año.

Asegura que las recargas y viajes tengan fechas recientes (abril 2025).

Repite las principales consultas de auditoría para mostrar datos actualizados.