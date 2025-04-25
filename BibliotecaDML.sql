
USE biblioteca;
-- SET FOREIGN_KEY_CHECKS = 0;  -- Desactivar Claves foraneas
-- TRUNCATE TABLE prestamo;  --  Eliminar datos de una tabla especifica
-- SET FOREIGN_KEY_CHECKS = 1; -- Activar Claves Foranes


-- Cargar autores
LOAD DATA INFILE 'C:/Users/Jesus/Downloads/datos_biblioteca/autores.csv' -- Esta es mi ruta
INTO TABLE autor
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(codigo_autor, nombre, apellidos);


-- Cargar editoriales
LOAD DATA INFILE 'C:/Users/Jesus/Downloads/datos_biblioteca/editorial.csv' -- Esta es mi ruta
INTO TABLE editorial
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
(nombre);



-- Cargar libros
LOAD DATA  INFILE 'C:/Users/Jesus/Downloads/datos_biblioteca/libros.csv' -- Esta es mi ruta
INTO TABLE libro
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(codigo_libro, titulo, isbn, codigo_editorial, paginas);


-- Cargar autor-libro (relación many-to-many)
SET foreign_key_checks = 0;
LOAD DATA INFILE 'C:/Users/Jesus/Downloads/datos_biblioteca/autor_libro.csv' -- Esta es mi ruta
INTO TABLE autor_libro
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(codigo_autor, codigo_libro);
SET foreign_key_checks = 1;



-- Cargar ejemplares
SET foreign_key_checks = 0;
LOAD DATA INFILE 'C:/Users/Jesus/Downloads/datos_biblioteca/ejemplares.csv' -- Esta es mi ruta
INTO TABLE ejemplar
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(localizacion, codigo_libro);
SET foreign_key_checks = 1;

-- Cargar usuarios


LOAD DATA INFILE 'C:/Users/Jesus/Downloads/datos_biblioteca/usuarios_5.csv' -- Esta es mi ruta
INTO TABLE usuario
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(codigo_usuario, nombre, apellidos, telefono, direccion);


-- Cargar préstamos


LOAD DATA INFILE 'C:/Users/Jesus/Downloads/datos_biblioteca/prestamos_10.csv' -- Esta es mi ruta
INTO TABLE prestamo
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(codigo_usuario, id_ejemplar, fecha_prestamo, fecha_dev);




 -- Datos Manuales 

INSERT INTO prestamo (id_prestamo, codigo_usuario, id_ejemplar, fecha_prestamo, fecha_dev)
VALUES (1, 335244, 58371, '2020-02-21', '2020-03-16');

-- Insertar editoriales
INSERT INTO editorial (nombre) VALUES 
('Editorial Anagrama'),
('Alfaguara'),
('Planeta'),
('Penguin Random House'),
('Tusquets Editores');

-- Insertar autores
INSERT INTO autor (nombre, apellidos) VALUES 
('Gabriel', 'García Márquez'),
('Isabel', 'Allende'),
('Jorge Luis', 'Borges'),
('Julio', 'Cortázar'),
('Mario', 'Vargas Llosa');

-- Insertar libros
INSERT INTO libro (codigo_libro, titulo, isbn, codigo_editorial, paginas) VALUES 
('L001', 'Cien años de soledad', '9788420471839', 1, 432),
('L002', 'La casa de los espíritus', '9788401352898', 2, 368),
('L003', 'Ficciones', '9788426405159', 3, 218),
('L004', 'Rayuela', '9788437604572', 4, 635),
('L005', 'La ciudad y los perros', '9788432211928', 5, 382),
('L006', 'El amor en los tiempos del cólera', '9788497592451', 1, 490),
('L007', 'El Aleph', '9788499089515', 3, 210);

-- Relacionar autores con libros
INSERT INTO autor_libro (codigo_autor, codigo_libro) VALUES 
(1, 'L001'), -- García Márquez - Cien años de soledad
(1, 'L006'), -- García Márquez - El amor en los tiempos del cólera
(2, 'L002'), -- Allende - La casa de los espíritus
(3, 'L003'), -- Borges - Ficciones
(3, 'L007'), -- Borges - El Aleph
(4, 'L004'), -- Cortázar - Rayuela
(5, 'L005'); -- Vargas Llosa - La ciudad y los perros

-- Insertar ejemplares
INSERT INTO ejemplar (localizacion, codigo_libro) VALUES 
('Estante A1-01', 'L001'),
('Estante A1-02', 'L001'),
('Estante A2-01', 'L002'),
('Estante B1-01', 'L003'),
('Estante B2-01', 'L004'),
('Estante C1-01', 'L005'),
('Estante A1-03', 'L006'),
('Estante B1-02', 'L007'),
('Estante A2-02', 'L002'),
('Estante C1-02', 'L005');

-- Insertar usuarios
INSERT INTO usuario (nombre, apellidos, telefono, direccion) VALUES 
('Ana', 'Martínez López', '612345678', 'Calle Mayor 15, Madrid'),
('Carlos', 'González Ruiz', '623456789', 'Avenida Libertad 23, Barcelona'),
('Elena', 'Sánchez Pérez', '634567890', 'Plaza España 7, Sevilla'),
('Miguel', 'Rodríguez Torres', '645678901', 'Calle Real 34, Valencia'),
('Laura', 'Fernández Gómez', '656789012', 'Calle Nueva 12, Bilbao');

-- Insertar préstamos
INSERT INTO prestamo (codigo_usuario, id_ejemplar, fecha_prestamo, fecha_dev) VALUES 
(1, 1, '2025-03-01', '2025-03-15'),
(1, 4, '2025-03-10', '2025-03-24'),
(2, 2, '2025-03-05', '2025-03-19'),
(3, 3, '2025-03-07', '2025-03-21'),
(4, 5, '2025-03-12', '2025-03-26'),
(5, 6, '2025-03-15', '2025-03-29'),
(2, 7, '2025-03-20', '2025-04-03'),
(3, 8, '2025-03-22', '2025-04-05');

-- Insertar editoriales
INSERT INTO editorial (nombre) VALUES 
('Editorial Anagrama'),
('Alfaguara'),
('Planeta'),
('Penguin Random House'),
('Tusquets Editores');

-- Insertar autores
INSERT INTO autor (nombre, apellidos) VALUES 
('Gabriel', 'García Márquez'),
('Isabel', 'Allende'),
('Jorge Luis', 'Borges'),
('Julio', 'Cortázar'),
('Mario', 'Vargas Llosa');

-- Insertar libros
INSERT INTO libro (codigo_libro, titulo, isbn, codigo_editorial, paginas) VALUES 
('L001', 'Cien años de soledad', '9788420471839', 1, 432),
('L002', 'La casa de los espíritus', '9788401352898', 2, 368),
('L003', 'Ficciones', '9788426405159', 3, 218),
('L004', 'Rayuela', '9788437604572', 4, 635),
('L005', 'La ciudad y los perros', '9788432211928', 5, 382),
('L006', 'El amor en los tiempos del cólera', '9788497592451', 1, 490),
('L007', 'El Aleph', '9788499089515', 3, 210);

-- Relacionar autores con libros
INSERT INTO autor_libro (codigo_autor, codigo_libro) VALUES 
(1, 'L001'), -- García Márquez - Cien años de soledad
(1, 'L006'), -- García Márquez - El amor en los tiempos del cólera
(2, 'L002'), -- Allende - La casa de los espíritus
(3, 'L003'), -- Borges - Ficciones
(3, 'L007'), -- Borges - El Aleph
(4, 'L004'), -- Cortázar - Rayuela
(5, 'L005'); -- Vargas Llosa - La ciudad y los perros

-- Insertar ejemplares
INSERT INTO ejemplar (localizacion, codigo_libro) VALUES 
('Estante A1-01', 'L001'),
('Estante A1-02', 'L001'),
('Estante A2-01', 'L002'),
('Estante B1-01', 'L003'),
('Estante B2-01', 'L004'),
('Estante C1-01', 'L005'),
('Estante A1-03', 'L006'),
('Estante B1-02', 'L007'),
('Estante A2-02', 'L002'),
('Estante C1-02', 'L005');

-- Insertar usuarios
INSERT INTO usuario (nombre, apellidos, telefono, direccion) VALUES 
('Ana', 'Martínez López', '612345678', 'Calle Mayor 15, Madrid'),
('Carlos', 'González Ruiz', '623456789', 'Avenida Libertad 23, Barcelona'),
('Elena', 'Sánchez Pérez', '634567890', 'Plaza España 7, Sevilla'),
('Miguel', 'Rodríguez Torres', '645678901', 'Calle Real 34, Valencia'),
('Laura', 'Fernández Gómez', '656789012', 'Calle Nueva 12, Bilbao');

-- Insertar préstamos
 -- INSERT INTO prestamo (codigo_usuario, id_ejemplar, fecha_prestamo, fecha_dev) VALUES 
-- (1, 1, '2025-03-01', '2025-03-15'),
-- (1, 4, '2025-03-10', '2025-03-24'),
-- (2, 2, '2025-03-05', '2025-03-19'),
-- (3, 3, '2025-03-07', '2025-03-21'),
-- (4, 5, '2025-03-12', '2025-03-26'),
-- (5, 6, '2025-03-15', '2025-03-29'),
-- (2, 7, '2025-03-20', '2025-04-03'),
-- (3, 8, '2025-03-22', '2025-04-05');


-- Consulta
Select*from autor
Select*from editorial
Select*from ejemplar
Select*from usuario
Select*from prestamo
Select*from autor_libro
