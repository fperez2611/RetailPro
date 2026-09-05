-- Consulta 1 - Vista base del proyecto con INNER JOIN
SELECT
    v.fecha_venta AS fecha,
    c.id_cliente,
    c.nombre AS nombre_cliente,
    c.ciudad,
    p.id_producto,
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    v.cantidad,
    v.precio_unitario,
    (v.cantidad * v.precio_unitario) AS total_venta
FROM ventas v
INNER JOIN clientes c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos p
    ON v.id_producto = p.id_producto
INNER JOIN categorias cat
    ON p.id_categoria = cat.id_categoria
ORDER BY v.fecha_venta, v.id_venta;



-- Consulta 2 - Clientes sin ventas
SELECT
    c.nombre,
    c.email,
    c.fecha_registro
FROM clientes c
LEFT JOIN ventas v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL
ORDER BY c.nombre;



-- Consulta 3 - Productos sin ventas
SELECT
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    p.precio
FROM productos p
LEFT JOIN ventas v
    ON p.id_producto = v.id_producto
INNER JOIN categorias cat
    ON p.id_categoria = cat.id_categoria
WHERE v.id_venta IS NULL
ORDER BY p.nombre_producto;



-- Consulta 4 - Consolidado por canal con UNION ALL
WITH ventas_por_origen AS (

    SELECT
        fecha_venta AS fecha,
        (cantidad * precio_unitario) AS total,
        'Primer periodo' AS canal
    FROM ventas
    WHERE MONTH(fecha_venta) BETWEEN 1 AND 3

    UNION ALL

    SELECT
        fecha_venta AS fecha,
        (cantidad * precio_unitario) AS total,
        'Segundo periodo' AS canal
    FROM ventas
    WHERE MONTH(fecha_venta) BETWEEN 4 AND 6
)

SELECT
    canal,
    SUM(total) AS total_facturado
FROM ventas_por_origen
GROUP BY canal
ORDER BY canal;