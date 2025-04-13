-- Script de consultas SQL para la base de datos "ventas_papeleria"
-- Autor: Andres Marulanda
-- Fecha: 12 de abril de 2025

-- 1. No. de productos asociados a cada proveedor
SELECT 
    p.nombre AS proveedor,
    COUNT(prod.id) AS numero_productos
FROM 
    proveedor p
LEFT JOIN 
    productos prod ON p.id = prod.proveedor_id
GROUP BY 
    p.id, p.nombre
ORDER BY 
    numero_productos DESC;

-- 2. Valor promedio de todas las ventas totales
SELECT 
    ROUND(AVG(total), 2) AS promedio_ventas
FROM 
    ventas;

-- 3. Tres (o más) días con mayor número de productos vendidos
SELECT 
    fecha,
    SUM(cantidad) AS total_productos_vendidos
FROM 
    ventas
GROUP BY 
    fecha
ORDER BY 
    total_productos_vendidos DESC
LIMIT 3;

-- 4. Tres (o más) clientes con mayores ventas
SELECT 
    c.nombre AS cliente,
    SUM(v.total) AS total_ventas
FROM 
    clientes c
JOIN 
    ventas v ON c.id = v.cliente_id
GROUP BY 
    c.id, c.nombre
ORDER BY 
    total_ventas DESC
LIMIT 3;