CREATE DATABASE Libreria;
USE Libreria;

-- Tabla de Autores
CREATE TABLE Autores (
    autor_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(50)
);

-- Tabla de Géneros
CREATE TABLE Generos (
    genero_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla de Libros
CREATE TABLE Libros (
    libro_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    autor_id INT,
    genero_id INT,
    fecha_publicacion DATE,
    precio DECIMAL(8, 2),
    FOREIGN KEY (autor_id) REFERENCES Autores(autor_id),
    FOREIGN KEY (genero_id) REFERENCES Generos(genero_id)
);

-- Tabla de Clientes
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(15)
);

-- Tabla de Ventas
CREATE TABLE Ventas (
    venta_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    libro_id INT,
    fecha_venta DATE NOT NULL,
    cantidad INT DEFAULT 1,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (libro_id) REFERENCES Libros(libro_id)
);
