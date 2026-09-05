-- ══════════════════════════════════════════════════════════════════
-- Proyecto Final: Checkpoint - Script SQL de Ingeniería de Datos
-- Base de Datos: Ventas_Tech_DB
-- Versión optimizada para SQL Server
-- ══════════════════════════════════════════════════════════════════
--CREATE DATABASE Ventas_Tech_DB

-- ── PASO 1: SECCIÓN DDL (DROP TABLES) ─────────────────────────────
-- Eliminamos las tablas con el orden correcto de dependencias.
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;


-- ── PASO 2: SECCIÓN DDL (CREATE TABLES) ───────────────────────────

-- 1. Tabla: categorias
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200)
);

-- 2. Tabla: clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    ciudad VARCHAR(50),
    fecha_registro DATE NOT NULL
);

-- 3. Tabla: productos
CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    id_categoria INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    activo SMALLINT DEFAULT 1,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- 4. Tabla: ventas
CREATE TABLE ventas (
    id_venta INT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    fecha_venta DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);


-- ── PASO 3: SECCIÓN DML (INSERT DATA) ─────────────────────────────

-- Carga en categorias
INSERT INTO categorias (id_categoria, nombre_categoria, descripcion) VALUES 
(1, 'Computación', 'Laptops, PCs y monitores'),
(2, 'Accesorios', 'Periféricos y complementos'),
(3, 'Audio', 'Auriculares y parlantes'),
(4, 'Almacenamiento', 'Discos y memorias');

-- Carga en clientes
INSERT INTO clientes (id_cliente, nombre, email, ciudad, fecha_registro) VALUES 
(1, 'María López', 'maria@mail.com', 'Buenos Aires', '2024-01-05'),
(2, 'Carlos Ruiz', 'carlos@mail.com', 'Córdoba', '2024-01-10'),
(3, 'Ana Gómez', 'ana@mail.com', 'Rosario', '2024-02-01'),
(4, 'Pedro Sanz', 'pedro@mail.com', 'Mendoza', '2024-02-15'),
(5, 'Laura Torres', 'laura@mail.com', 'Tucumán', '2024-03-01');


-- Clientes adicionales para análisis del Módulo 5
INSERT INTO clientes
    (id_cliente, nombre, email, ciudad, fecha_registro)
VALUES
    (6, 'Sofía Martínez', 'sofia@mail.com', 'La Plata', '2024-06-10'),
    (7, 'Diego Fernández', 'diego@mail.com', 'Mar del Plata', '2024-06-15');

-- Carga en productos
INSERT INTO productos (id_producto, nombre_producto, id_categoria, precio, stock, activo) VALUES 
(1, 'Laptop Pro 15', 1, 1200.00, 15, 1),
(2, 'Mouse Inalámbrico', 2, 28.00, 80, 1),
(3, 'Monitor 4K 27"', 1, 450.00, 12, 1),
(4, 'Auriculares BT Pro', 3, 120.00, 35, 1),
(5, 'SSD Externo 1TB', 4, 130.00, 18, 1),
(6, 'Teclado Mecánico', 2, 95.00, 40, 1);


-- Productos adicionales para análisis del Módulo 5
INSERT INTO productos
    (id_producto, nombre_producto, id_categoria, precio, stock, activo)
VALUES
    (7, 'Webcam Full HD', 2, 75.00, 20, 1),
    (8, 'Pendrive 128GB', 4, 35.00, 50, 1);

-- Carga en ventas
INSERT INTO ventas (id_venta, id_cliente, id_producto, cantidad, precio_unitario, fecha_venta) VALUES 
(1, 1, 1, 2, 1200.00, '2024-03-05'),
(2, 2, 2, 5, 28.00, '2024-03-06'),
(3, 3, 3, 1, 450.00, '2024-03-07'),
(4, 1, 4, 2, 120.00, '2024-03-08'),
(5, 4, 5, 3, 130.00, '2024-03-10'),
(6, 2, 6, 4, 95.00, '2024-03-11'),
(7, 5, 1, 1, 1200.00, '2024-03-12'),
(8, 3, 2, 8, 28.00, '2024-03-13'),
(9, 4, 4, 1, 120.00, '2024-03-14'),
(10, 5, 3, 2, 450.00, '2024-03-15');


-- Ventas adicionales para análisis del Módulo 4
INSERT INTO ventas
    (id_venta, id_cliente, id_producto, cantidad, precio_unitario, fecha_venta)
VALUES
-- ENERO 2024
(11, 1, 2, 3, 28.00,   '2024-01-08'),
(12, 2, 5, 1, 130.00,  '2024-01-12'),
(13, 3, 4, 2, 120.00,  '2024-01-18'),
(14, 4, 6, 1, 95.00,   '2024-01-25'),

-- FEBRERO 2024
(15, 5, 3, 1, 450.00,  '2024-02-03'),
(16, 1, 2, 4, 28.00,   '2024-02-10'),
(17, 2, 4, 1, 120.00,  '2024-02-14'),
(18, 3, 5, 2, 130.00,  '2024-02-21'),

-- ABRIL 2024
(19, 4, 1, 1, 1200.00, '2024-04-02'),
(20, 5, 6, 3, 95.00,   '2024-04-09'),
(21, 1, 5, 2, 130.00,  '2024-04-16'),
(22, 2, 2, 6, 28.00,   '2024-04-24'),

-- MAYO 2024
(23, 3, 3, 2, 450.00,  '2024-05-05'),
(24, 4, 4, 3, 120.00,  '2024-05-11'),
(25, 5, 2, 5, 28.00,   '2024-05-18'),
(26, 1, 6, 2, 95.00,   '2024-05-27'),

-- JUNIO 2024
(27, 2, 1, 1, 1200.00, '2024-06-04'),
(28, 3, 5, 3, 130.00,  '2024-06-12'),
(29, 4, 3, 1, 450.00,  '2024-06-19'),
(30, 5, 4, 2, 120.00,  '2024-06-26');


-- ── PASO 4: VALIDACIÓN ───────────────────────────────────────────
SELECT * FROM categorias;
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM ventas;
