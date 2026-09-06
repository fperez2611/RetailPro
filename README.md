# RetailPro

Proyecto académico de análisis de datos orientado a construir un flujo completo desde SQL hasta Power BI. El repositorio reúne la base de datos, consultas de negocio, consultas con JOINs y entregables de Power BI desarrollados por módulos.

## Objetivo

Transformar datos de ventas de RetailPro en información útil para análisis comercial, incluyendo métricas mensuales, rankings, clientes recurrentes, vistas enriquecidas y un modelo analítico en Power BI.

## Herramientas utilizadas

- SQL Server y SQL Server Management Studio (SSMS)
- Power BI Desktop
- Power Query y lenguaje M
- DAX
- GitHub
- ChatGPT como asistente para revisión, documentación y validación, con verificación manual de los resultados

## Estructura del repositorio

- `ventas_tech_db.sql`: crea las tablas base y carga los datos de ejemplo.
- `m4_consultas_negocio.sql`: consultas de métricas, rankings, recurrencia y comparación mensual.
- `m5_consultas_joins.sql`: consultas con `INNER JOIN`, `LEFT JOIN` y `UNION ALL`.
- `Pipeline_ETL/`: checkpoint de limpieza y transformación en Power BI.
- `M8_Checkpoint2/`: modelo de datos, tabla calendario y medidas DAX core.

## Cómo ejecutar los scripts SQL

1. Abrir SQL Server Management Studio.
2. Crear o seleccionar la base de datos `Ventas_Tech_DB`.
3. Ejecutar `ventas_tech_db.sql` para crear las tablas y cargar los datos.
4. Ejecutar `m4_consultas_negocio.sql` para obtener las métricas de negocio.
5. Ejecutar `m5_consultas_joins.sql` para obtener las vistas enriquecidas y los análisis con JOINs.

> **Importante:** `ventas_tech_db.sql` contiene instrucciones `DROP TABLE IF EXISTS`, por lo que debe ejecutarse con cuidado si ya existen datos que se quieran conservar.

## Compatibilidad SQL Server

El proyecto está desarrollado para SQL Server. Por ese motivo se utiliza `MONTH(fecha_venta)` en lugar de `EXTRACT(MONTH FROM fecha_venta)` y `TOP 5` en lugar de `LIMIT 5`.

## Power BI

- `Pipeline_ETL/Pipeline_ETL_Perez_Fabian.pbix`: limpieza, tipado, merge y documentación en Power Query.
- `M8_Checkpoint2/Perez_Fabian_Checkpoint2.pbix`: relaciones 1:N, tabla `Dim_Fechas` y medidas DAX para ventas, YTD, año anterior y crecimiento anual.

## Criterio de validación

Las sugerencias generadas con IA se utilizan como borrador o apoyo. Las consultas SQL, transformaciones y medidas se validan contra los datos reales antes de incorporarse al proyecto.
