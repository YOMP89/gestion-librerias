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

-- Insertando autores
INSERT INTO Autores (nombre, nacionalidad) VALUES 
('Gabriel García Márquez', 'Colombiana'),
('Jane Austen', 'Británica'),
('J.K. Rowling', 'Británica');

-- Insertando géneros
INSERT INTO Generos (nombre) VALUES 
('Ficción'),
('Romance'),
('Fantasía');

-- Insertando libros
INSERT INTO Libros (titulo, autor_id, genero_id, fecha_publicacion, precio) VALUES 
('Cien años de soledad', 1, 1, '1967-06-05', 19.99),
('Orgullo y prejuicio', 2, 2, '1813-01-28', 12.50),
('Harry Potter y la piedra filosofal', 3, 3, '1997-06-26', 24.99);

-- Insertando clientes
INSERT INTO Clientes (nombre, direccion, telefono) VALUES 
('Juan Pérez', 'Calle Falsa 123', '123456789'),
('María López', 'Av. Siempre Viva 456', '987654321');

-- Insertando ventas
INSERT INTO Ventas (cliente_id, libro_id, fecha_venta, cantidad) VALUES 
(1, 1, '2024-10-23', 1),
(2, 3, '2024-10-23', 2);
