CREATE DATABASE IF NOT EXISTS tienda;
USE tienda;

CREATE TABLE IF NOT EXISTS productos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  stock INT NOT NULL
);

INSERT INTO productos (nombre, precio, stock) VALUES
  ('Laptop', 899990, 10),
  ('Mouse', 15990, 50),
  ('Teclado', 29990, 30),
  ('Monitor', 199990, 15),
  ('Audífonos', 49990, 25);