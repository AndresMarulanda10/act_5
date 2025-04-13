-- Script de inserción de datos para la base de datos "ventas_papeleria"
-- Autor: Andres Marulanda
-- Fecha: 12 de abril de 2025

-- Inserción de datos para la tabla proveedor
INSERT INTO proveedor (nombre, contacto) VALUES
    ('Distribuidora ABC', 'contacto@abc.com'),
    ('Papeles Universales', 'info@papelesuniversales.com'),
    ('Norma S.A.', 'ventas@norma.com');

-- Inserción de datos para la tabla productos
INSERT INTO productos (nombre, precio, proveedor_id) VALUES
    ('Resma papel carta', 15000, 1),
    ('Cuaderno argollado', 8500, 2),
    ('Bolígrafo azul', 1200, 3),
    ('Carpeta plástica', 2500, 1),
    ('Marcadores colores x12', 12800, 2),
    ('Tijeras ergonómicas', 5500, 3),
    ('Pegante en barra', 3200, 1);

-- Inserción de datos para la tabla clientes
INSERT INTO clientes (nombre, contacto) VALUES
    ('Colegio San José', 'compras@sanjose.edu'),
    ('Oficina Legal Martínez', 'omartinez@legal.com'),
    ('Librería Central', 'pedidos@libreriacentral.com'),
    ('Universidad del Norte', 'suministros@uninorte.edu'),
    ('Consultores Asociados', 'info@consultores.com');

-- Inserción de datos para la tabla ventas (15 ventas en total)
INSERT INTO ventas (producto_id, cliente_id, fecha, cantidad, total) VALUES
    (1, 1, '2025-01-15', 20, 300000),
    (2, 1, '2025-01-15', 50, 425000),
    (3, 1, '2025-01-15', 100, 120000),
    (1, 2, '2025-02-03', 5, 75000),
    (3, 2, '2025-02-03', 20, 24000),
    (4, 2, '2025-02-10', 10, 25000),
    (2, 3, '2025-02-22', 30, 255000),
    (5, 3, '2025-03-01', 15, 192000),
    (6, 4, '2025-03-05', 20, 110000),
    (7, 4, '2025-03-05', 15, 48000),
    (1, 4, '2025-03-12', 30, 450000),
    (2, 5, '2025-03-18', 10, 85000),
    (3, 5, '2025-03-19', 50, 60000),
    (5, 5, '2025-03-20', 5, 64000),
    (7, 3, '2025-04-01', 25, 80000);