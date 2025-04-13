-- SQL statements to create the necessary tables for the "ventas_papeleria" database

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