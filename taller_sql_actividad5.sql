/*
 * TALLER SQL ACTIVIDAD 5
 * Autor: Andres Marulanda
 * Fecha: 12 de abril de 2025
 * Motor utilizado: PostgreSQL 14.17 (macOS/Homebrew)
 */

-- IMPORTANTE: Este script está diseñado para PostgreSQL.
-- AVISO: Los comandos \c son específicos de psql (cliente de línea de comandos).
-- Si estás usando DataGrip o pgAdmin, deberás seleccionar manualmente las bases de datos.

-- Eliminar bases de datos si existen previamente (solo si estás usando psql)
DROP DATABASE IF EXISTS ventas_papeleria;
DROP DATABASE IF EXISTS universidad_academica;

-- Crear las bases de datos usando template0 para evitar problemas de conexión
CREATE DATABASE ventas_papeleria TEMPLATE template0;
CREATE DATABASE universidad_academica TEMPLATE template0;

-- --------------- ---------------------------
-- PARTE 1: BASE DE DATOS VENTAS_PAPELERIA
-- ------------------------------------------

-- NOTA: A partir de este punto, conectarse manualmente a la BD ventas_papeleria
-- Si estás usando psql, descomentar la siguiente línea:
-- \c ventas_papeleria

/*
 * PARTE 1: BASE DE DATOS VENTAS_PAPELERIA
 * Creación de tablas, inserción de datos y consultas SQL
 */

-- Creación de tablas para la base de datos ventas_papeleria
-- IMPORTANTE: Ejecutar estas instrucciones conectado a la BD ventas_papeleria

CREATE TABLE proveedor (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(100)
);

CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    proveedor_id INT REFERENCES proveedor(id) ON DELETE CASCADE
);

CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(100)
);

CREATE TABLE ventas (
    id SERIAL PRIMARY KEY,
    producto_id INT REFERENCES productos(id) ON DELETE CASCADE,
    cliente_id INT REFERENCES clientes(id) ON DELETE CASCADE,
    fecha DATE NOT NULL,
    cantidad INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL
);

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

-- Inserción de datos para la tabla ventas
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

-- CONSULTAS SQL PARA VENTAS_PAPELERIA

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

-- ------------------------------------------
-- PARTE 2: BASE DE DATOS UNIVERSIDAD_ACADEMICA
-- ------------------------------------------

-- NOTA: A partir de este punto, conectarse manualmente a la BD universidad_academica
-- Si estás usando psql, descomentar la siguiente línea:
-- \c universidad_academica

/*
 * PARTE 2: BASE DE DATOS UNIVERSIDAD_ACADEMICA
 * Creación de tablas, inserción de datos y consultas SQL
 */

-- Creación de tablas para la base de datos universidad_academica
-- IMPORTANTE: Ejecutar estas instrucciones conectado a la BD universidad_academica

CREATE TABLE facultad (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE programa (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    facultad_id INT REFERENCES facultad(id) ON DELETE CASCADE
);

CREATE TABLE rol (
    id SERIAL PRIMARY KEY,
    tipo VARCHAR(50) CHECK (tipo IN ('estudiante', 'docente')) NOT NULL
);

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    rol_id INT REFERENCES rol(id) ON DELETE SET NULL
);

CREATE TABLE cursos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    programa_id INT REFERENCES programa(id) ON DELETE CASCADE
);

CREATE TABLE clases (
    id SERIAL PRIMARY KEY,
    curso_id INT REFERENCES cursos(id) ON DELETE CASCADE,
    profesor_id INT REFERENCES usuarios(id) ON DELETE SET NULL,
    horario VARCHAR(100) NOT NULL,
    salon VARCHAR(50) NOT NULL
);

CREATE TABLE matricula (
    id SERIAL PRIMARY KEY,
    estudiante_id INT REFERENCES usuarios(id) ON DELETE CASCADE,
    clase_id INT REFERENCES clases(id) ON DELETE CASCADE
);

-- Inserción de datos para la tabla facultad
INSERT INTO facultad (nombre) VALUES
    ('Facultad de Ingeniería'),
    ('Facultad de Ciencias Económicas');

-- Inserción de datos para la tabla programa
INSERT INTO programa (nombre, facultad_id) VALUES
    ('Ingeniería de Software', 1),
    ('Ingeniería de Sistemas', 1),
    ('Administración de Empresas', 2);

-- Inserción de datos para la tabla rol
INSERT INTO rol (tipo) VALUES
    ('docente'),
    ('estudiante');

-- Inserción de datos para la tabla usuarios (docentes)
INSERT INTO usuarios (nombre, correo, rol_id) VALUES
    ('Carlos Rodríguez', 'crodriguez@universidad.edu', 1),
    ('María González', 'mgonzalez@universidad.edu', 1),
    ('Juan López', 'jlopez@universidad.edu', 1),
    ('Laura Martínez', 'lmartinez@universidad.edu', 1),
    ('Pedro Sánchez', 'psanchez@universidad.edu', 1);

-- Inserción de datos para la tabla usuarios (estudiantes)
INSERT INTO usuarios (nombre, correo, rol_id) VALUES
    ('Ana Torres', 'atorres@estudiante.edu', 2),
    ('Luis García', 'lgarcia@estudiante.edu', 2),
    ('Sofia Ramírez', 'sramirez@estudiante.edu', 2),
    ('Daniel Castro', 'dcastro@estudiante.edu', 2),
    ('Valentina Morales', 'vmorales@estudiante.edu', 2),
    ('Andrés Pérez', 'aperez@estudiante.edu', 2),
    ('Carolina Flores', 'cflores@estudiante.edu', 2),
    ('Javier Díaz', 'jdiaz@estudiante.edu', 2),
    ('Natalia Vargas', 'nvargas@estudiante.edu', 2),
    ('Roberto Gómez', 'rgomez@estudiante.edu', 2);

-- Inserción de datos para la tabla cursos
INSERT INTO cursos (nombre, programa_id) VALUES
    ('Programación Orientada a Objetos', 1),
    ('Base de Datos Avanzadas', 1),
    ('Arquitectura de Software', 1),
    ('Redes de Computadores', 2),
    ('Contabilidad Financiera', 3);

-- Inserción de datos para la tabla clases
INSERT INTO clases (curso_id, profesor_id, horario, salon) VALUES
    (1, 1, 'Lunes y Miércoles 8:00-10:00', 'A101'),
    (2, 2, 'Martes y Jueves 10:00-12:00', 'B202'),
    (3, 3, 'Viernes 14:00-18:00', 'C303'),
    (4, 4, 'Miércoles y Viernes 7:00-9:00', 'D404'),
    (5, 5, 'Lunes y Jueves 16:00-18:00', 'E505');

-- Inserción de datos para la tabla matricula
INSERT INTO matricula (estudiante_id, clase_id) VALUES
    (6, 1),  -- Ana Torres en Programación Orientada a Objetos
    (6, 2),  -- Ana Torres en Base de Datos Avanzadas
    (6, 3),  -- Ana Torres en Arquitectura de Software
    (7, 1),  -- Luis García en Programación Orientada a Objetos
    (7, 2),  -- Luis García en Base de Datos Avanzadas
    (8, 1),  -- Sofia Ramírez en Programación Orientada a Objetos
    (8, 3),  -- Sofia Ramírez en Arquitectura de Software
    (9, 2),  -- Daniel Castro en Base de Datos Avanzadas
    (9, 3),  -- Daniel Castro en Arquitectura de Software
    (10, 1), -- Valentina Morales en Programación Orientada a Objetos
    (10, 2), -- Valentina Morales en Base de Datos Avanzadas
    (11, 4), -- Andrés Pérez en Redes de Computadores
    (12, 4), -- Carolina Flores en Redes de Computadores
    (12, 5), -- Carolina Flores en Contabilidad Financiera
    (13, 5), -- Javier Díaz en Contabilidad Financiera
    (14, 4), -- Natalia Vargas en Redes de Computadores
    (14, 5), -- Natalia Vargas en Contabilidad Financiera
    (15, 3), -- Roberto Gómez en Arquitectura de Software
    (15, 4), -- Roberto Gómez en Redes de Computadores
    (15, 5); -- Roberto Gómez en Contabilidad Financiera

-- CONSULTAS SQL PARA UNIVERSIDAD_ACADEMICA

-- 1. Programas por facultades
SELECT 
    f.nombre AS facultad, 
    p.nombre AS programa
FROM 
    facultad f
JOIN 
    programa p ON f.id = p.facultad_id
ORDER BY 
    f.nombre, p.nombre;

-- 2. Estudiantes matriculados en cursos del programa "Ingeniería de Software"
SELECT DISTINCT
    u.nombre AS estudiante,
    c.nombre AS curso
FROM 
    usuarios u
JOIN 
    matricula m ON u.id = m.estudiante_id
JOIN 
    clases cl ON m.clase_id = cl.id
JOIN 
    cursos c ON cl.curso_id = c.id
JOIN 
    programa p ON c.programa_id = p.id
WHERE 
    p.nombre = 'Ingeniería de Software' AND u.rol_id = 2
ORDER BY 
    u.nombre, c.nombre;

-- 3. Cursos con estudiantes matriculados (y número de estudiantes por curso)
SELECT 
    c.nombre AS curso,
    COUNT(DISTINCT m.estudiante_id) AS num_estudiantes
FROM 
    cursos c
JOIN 
    clases cl ON c.id = cl.curso_id
JOIN 
    matricula m ON cl.id = m.clase_id
GROUP BY 
    c.id, c.nombre
ORDER BY 
    num_estudiantes DESC;

-- 4. Número de materias matriculadas por estudiante
SELECT 
    u.nombre AS estudiante,
    COUNT(DISTINCT cl.curso_id) AS num_materias_matriculadas
FROM 
    usuarios u
LEFT JOIN 
    matricula m ON u.id = m.estudiante_id
LEFT JOIN 
    clases cl ON m.clase_id = cl.id
WHERE 
    u.rol_id = 2
GROUP BY 
    u.id, u.nombre
ORDER BY 
    num_materias_matriculadas DESC;

-- 5. Estudiantes sin materias matriculadas
SELECT 
    u.nombre AS estudiante,
    u.correo
FROM 
    usuarios u
LEFT JOIN 
    matricula m ON u.id = m.estudiante_id
WHERE 
    u.rol_id = 2 AND m.id IS NULL;

-- 6. Número de estudiantes a cargo de cada profesor en cada curso
SELECT 
    prof.nombre AS profesor,
    c.nombre AS curso,
    COUNT(DISTINCT m.estudiante_id) AS num_estudiantes
FROM 
    usuarios prof
JOIN 
    clases cl ON prof.id = cl.profesor_id
JOIN 
    cursos c ON cl.curso_id = c.id
LEFT JOIN 
    matricula m ON cl.id = m.clase_id
WHERE 
    prof.rol_id = 1
GROUP BY 
    prof.id, prof.nombre, c.id, c.nombre
ORDER BY 
    prof.nombre, c.nombre;