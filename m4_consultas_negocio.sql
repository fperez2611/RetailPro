-- Nota:
-- La consigna utiliza EXTRACT(MONTH FROM fecha_venta).
-- Como la base Ventas_Tech_DB fue desarrollada en SQL Server,
-- se utiliza MONTH(fecha_venta), que es su equivalente en este motor.
-- Consulta 1 - Resumen ejecutivo mensual
SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;


-- Consulta 2 - Ranking de productos
SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;



-- Consulta 3 - Clientes recurrentes
SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY total_gastado DESC;



-- Consulta 4 - Meses por encima o por debajo del promedio mensual
WITH ventas_mensuales AS (
    SELECT
        MONTH(fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY MONTH(fecha_venta)
)

SELECT
    mes,
    total_facturado,
    CASE
        WHEN total_facturado > (
            SELECT AVG(total_facturado)
            FROM ventas_mensuales
        )
        THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM ventas_mensuales
ORDER BY mes;



-- ── HALLAZGOS ─────────────────────────────────────────────────────
-- 1. Marzo fue el mes de mayor facturación, con un total de 6444.00.
-- 2. El producto 1 lideró el ranking, con 5 unidades vendidas y 6000.00 facturados.
-- 3. El cliente 1 fue el de mayor gasto acumulado, con 3286.00 en 6 pedidos.
