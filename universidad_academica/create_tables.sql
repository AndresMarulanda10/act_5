-- SQL statements to create the necessary tables for the "universidad_academica" database

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