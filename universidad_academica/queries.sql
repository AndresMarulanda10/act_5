-- Script de consultas SQL para la base de datos "universidad_academica"
-- Autor: Andres Marulanda
-- Fecha: 12 de abril de 2025

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