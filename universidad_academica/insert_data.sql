-- Script de inserción de datos para la base de datos "universidad_academica"
-- Autor: Andres Marulanda
-- Fecha: 12 de abril de 2025

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

-- Inserción de datos para la tabla matricula (20 matrículas)
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