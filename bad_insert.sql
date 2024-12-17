
-- LOCAL
INSERT INTO LOCAL (id_local, provincia, ciudad, calle, nombre) VALUES (1, 'Madrid', 'Madrid', 'Gran Vía', '');
INSERT INTO LOCAL (id_local, provincia, ciudad, calle, nombre) VALUES (2, 'Barcelona', 'Barcelona', '', 'Store B');
INSERT INTO LOCAL (id_local, provincia, ciudad, calle, nombre) VALUES (3, 'Valencia', '', 'Avenida del Oeste', 'Store C');
INSERT INTO LOCAL (id_local, provincia, ciudad, calle, nombre) VALUES (4, '', 'Sevilla', 'Calle Tetuán', 'Store D');
INSERT INTO LOCAL (id_local, provincia, ciudad, calle, nombre) VALUES (5, NULL, 'Madrid', 'Calle de Preciados', 'Store E');
INSERT INTO LOCAL (id_local, provincia, ciudad, calle, nombre) VALUES (6, 'Bilbao', 'Bilbao', 'Gran Vía Don Diego López de Haro', NULL);
INSERT INTO LOCAL (id_local, provincia, ciudad, calle, nombre) VALUES (7, 'Zaragoza', 'Zaragoza', 'Calle del Coso', 'Store G');
INSERT INTO LOCAL (id_local, provincia, ciudad, calle, nombre) VALUES (8, 'Murcia', 'Murcia', 'Avenida de la Constitución', '');
INSERT INTO LOCAL (id_local, provincia, ciudad, calle, nombre) VALUES (9, 'Granada', 'Granada', 'Calle de los Reyes Católicos', 'Store I');
INSERT INTO LOCAL (id_local, provincia, ciudad, calle, nombre) VALUES (10, 'Palma', '', 'Carrer de Sant Miquel', 'Store J');
INSERT INTO LOCAL (id_local, provincia, ciudad, calle, nombre) VALUES (11, 'Málaga', 'Málaga', 'Calle Larios', 'Store K');
INSERT INTO LOCAL (id_local, provincia, ciudad, calle, nombre) VALUES (12, 'Alicante', 'Alicante', '', 'Store L');
INSERT INTO LOCAL (id_local, provincia, ciudad, calle, nombre) VALUES (13, 'Vigo', 'Vigo', 'Calle Urzáiz', 'Store M');
INSERT INTO LOCAL (id_local, provincia, ciudad, calle, nombre) VALUES (14, 'Gijón', 'Gijón', 'Calle de la Corrida', 'Store N');
INSERT INTO LOCAL (id_local, provincia, ciudad, calle, nombre) VALUES (15, 'Córdoba', 'Córdoba', 'Calle Capitulares', 'Store O');
INSERT INTO LOCAL (id_local, provincia, ciudad, calle, nombre) VALUES (16, 'Salamanca', 'Salamanca', 'Calle Toro', 'Store P');
INSERT INTO LOCAL (id_local, provincia, ciudad, calle, nombre) VALUES (17, 'Oviedo', 'Oviedo', 'Calle Uría', 'Store Q');
INSERT INTO LOCAL (id_local, provincia, ciudad, calle, nombre) VALUES (18, 'Santander', 'Santander', 'Calle Cádiz', 'Store R');
INSERT INTO LOCAL (id_local, provincia, ciudad, calle, nombre) VALUES (19, 'Valladolid', 'Valladolid', 'Calle de la Constitución', 'Store S');
INSERT INTO LOCAL (id_local, provincia, ciudad, calle, nombre) VALUES (1, 'Madrid', 'Madrid', 'Gran Vía', 'Store Duplicate'); -- Duplicate primary key violation
INSERT INTO LOCAL (id_local, provincia, ciudad, calle, nombre) VALUES (1, 'Madrid', 'Madrid', 'Gran Vía', 'Store Duplicated'); -- Duplicate primary key violation

-- Zona
INSERT INTO ZONA (id_zona, id_local, provincia, ciudad, calle, tipo) VALUES
(1, 1, 'Madrid', 'Madrid', 'Gran Vía', ''); -- Invalid tipo (empty string)
INSERT INTO ZONA (id_zona, id_local, provincia, ciudad, calle, tipo) VALUES
(2, 2, 'Barcelona', 'Barcelona', 'Passeig de Gràcia', NULL); -- Invalid tipo (NULL)
INSERT INTO ZONA (id_zona, id_local, provincia, ciudad, calle, tipo) VALUES
(3, 3, 'Valencia', 'Valencia', '', 'reparacion'); -- Invalid calle (empty string)
INSERT INTO ZONA (id_zona, id_local, provincia, ciudad, calle, tipo) VALUES
(4, 4, '', 'Sevilla', 'Calle Tetuán', 'tienda'); -- Invalid provincia (empty string)
INSERT INTO ZONA (id_zona, id_local, provincia, ciudad, calle, tipo) VALUES
(5, 5, 'Madrid', 'Madrid', 'Calle de Preciados', 'unknown'); -- Invalid tipo (unknown value)
INSERT INTO ZONA (id_zona, id_local, provincia, ciudad, calle, tipo) VALUES
(6, 100, 'Bilbao', 'Bilbao', 'Gran Vía Don Diego López de Haro', 'reparacion'); -- Invalid id_local (doesn't exist in LOCAL)
INSERT INTO ZONA (id_zona, id_local, provincia, ciudad, calle, tipo) VALUES
(7, 7, 'Zaragoza', 'Zaragoza', 'Calle del Coso', ''); -- Invalid tipo (empty string)
INSERT INTO ZONA (id_zona, id_local, provincia, ciudad, calle, tipo) VALUES
(8, 8, 'Murcia', 'Murcia', 'Avenida de la Constitución', NULL); -- Invalid tipo (NULL)
INSERT INTO ZONA (id_zona, id_local, provincia, ciudad, calle, tipo) VALUES
(9, 9, 'Granada', 'Granada', 'Calle de los Reyes Católicos', 'reparacion'); -- Duplicate primary key violation
INSERT INTO ZONA (id_zona, id_local, provincia, ciudad, calle, tipo) VALUES
(10, 10, 'Palma', 'Palma de Mallorca', 'Carrer de Sant Miquel', 'tienda'); -- Duplicate primary key violation
INSERT INTO ZONA (id_zona, id_local, provincia, ciudad, calle, tipo) VALUES
(11, 1, 'Málaga', 'Málaga', 'Calle Larios', 'almacen'); -- Duplicate primary key violation
INSERT INTO ZONA (id_zona, id_local, provincia, ciudad, calle, tipo) VALUES
(12, 12, 'Alicante', 'Alicante', 'Calle Maisonnave', 'reparacion');
INSERT INTO ZONA (id_zona, id_local, provincia, ciudad, calle, tipo) VALUES
(13, 13, 'Vigo', 'Vigo', 'Calle Urzáiz', ''); -- Invalid tipo (empty string)
INSERT INTO ZONA (id_zona, id_local, provincia, ciudad, calle, tipo) VALUES
(14, 14, 'Gijón', 'Gijón', 'Calle de la Corrida', NULL); -- Invalid tipo (NULL)
INSERT INTO ZONA (id_zona, id_local, provincia, ciudad, calle, tipo) VALUES
(15, 15, 'Córdoba', 'Córdoba', 'Calle Capitulares', 'unknown'); -- Invalid tipo (unknown)
INSERT INTO ZONA (id_zona, id_local, provincia, ciudad, calle, tipo) VALUES
(16, 16, 'Salamanca', 'Salamanca', 'Calle Toro', 'tienda');
INSERT INTO ZONA (id_zona, id_local, provincia, ciudad, calle, tipo) VALUES
(17, 17, 'Oviedo', 'Oviedo', 'Calle Uría', ''); -- Invalid tipo (empty string)
INSERT INTO ZONA (id_zona, id_local, provincia, ciudad, calle, tipo) VALUES
(18, 18, 'Santander', 'Santander', 'Calle Cádiz', NULL); -- Invalid tipo (NULL)
INSERT INTO ZONA (id_zona, id_local, provincia, ciudad, calle, tipo) VALUES
(19, 19, 'Valladolid', 'Valladolid', 'Calle de la Constitución', 'tienda');
INSERT INTO ZONA (id_zona, id_local, provincia, ciudad, calle, tipo) VALUES
(1, 1, 'Madrid', 'Madrid', 'Gran Vía', 'tienda'); -- Duplicate primary key violation

-- Producto
INSERT INTO PRODUCTO (id_producto, nombre, tipo, precio_unidad, ram, almacenamiento, marca, stock) VALUES
(1, '', 'sobremesa', 1200.50, '8 GB', '512 GB SSD', 'HP', 100); -- Invalid nombre (empty string)
INSERT INTO PRODUCTO (id_producto, nombre, tipo, precio_unidad, ram, almacenamiento, marca, stock) VALUES
(2, 'Laptop B', 'portatil', 1500.00, '16 GB', '1 TB SSD', NULL, 50); -- Invalid marca (NULL)
INSERT INTO PRODUCTO (id_producto, nombre, tipo, precio_unidad, ram, almacenamiento, marca, stock) VALUES
(3, 'Smartphone X', 'dispositivos moviles', -500.00, '6 GB', '128 GB', 'Samsung', 200); -- Invalid precio_unidad (negative price)
INSERT INTO PRODUCTO (id_producto, nombre, tipo, precio_unidad, ram, almacenamiento, marca, stock) VALUES
(4, 'Smartphone Y', 'dispositivos moviles', 800.00, '', '256 GB', 'Apple', 150); -- Invalid ram (empty string)
INSERT INTO PRODUCTO (id_producto, nombre, tipo, precio_unidad, ram, almacenamiento, marca, stock) VALUES
(5, 'Consola Play X', 'consolas', 400.00, '4 GB', '', 'Sony', 300); -- Invalid almacenamiento (empty string)
INSERT INTO PRODUCTO (id_producto, nombre, tipo, precio_unidad, ram, almacenamiento, marca, stock) VALUES
(6, 'Consola Xbox Z', 'consolas', 450.00, '8 GB', '1 TB', 'Microsoft', -50); -- Invalid stock (negative value)
INSERT INTO PRODUCTO (id_producto, nombre, tipo, precio_unidad, ram, almacenamiento, marca, stock) VALUES
(7, 'Desktop Tower', 'sobremesa', 1000.00, '16 GB', '2 TB HDD', 'Lenovo', NULL); -- Invalid stock (NULL)
INSERT INTO PRODUCTO (id_producto, nombre, tipo, precio_unidad, ram, almacenamiento, marca, stock) VALUES
(8, 'Tablet A', 'portatil', 350.00, '4 GB', '64 GB', 'Huawei', 250); -- Duplicate primary key violation
INSERT INTO PRODUCTO (id_producto, nombre, tipo, precio_unidad, ram, almacenamiento, marca, stock) VALUES
(9, 'Tablet B', 'portatil', 400.00, '6 GB', '128 GB', 'Samsung', -10); -- Invalid stock (negative value)
INSERT INTO PRODUCTO (id_producto, nombre, tipo, precio_unidad, ram, almacenamiento, marca, stock) VALUES
(10, 'Smartwatch C', 'dispositivos moviles', 250.00, '2 GB', '16 GB', 'Garmin', 500); -- Duplicate primary key violation
INSERT INTO PRODUCTO (id_producto, nombre, tipo, precio_unidad, ram, almacenamiento, marca, stock) VALUES
(11, 'Laptop C', 'portatil', 1300.00, '8 GB', '256 GB SSD', 'Acer', -20); -- Invalid stock (negative value)
INSERT INTO PRODUCTO (id_producto, nombre, tipo, precio_unidad, ram, almacenamiento, marca, stock) VALUES
(12, 'Smartphone Z', 'dispositivos moviles', 900.00, '8 GB', '512 GB', 'Google', 220); -- Duplicate primary key violation
INSERT INTO PRODUCTO (id_producto, nombre, tipo, precio_unidad, ram, almacenamiento, marca, stock) VALUES
(13, 'Desktop Pro', 'sobremesa', 1700.00, '32 GB', '2 TB SSD', 'Apple', 90);
INSERT INTO PRODUCTO (id_producto, nombre, tipo, precio_unidad, ram, almacenamiento, marca, stock) VALUES
(14, 'Laptop X', 'portatil', 2000.00, '32 GB', '1 TB SSD', 'MSI', 80); -- Duplicate primary key violation
INSERT INTO PRODUCTO (id_producto, nombre, tipo, precio_unidad, ram, almacenamiento, marca, stock) VALUES
(15, 'Smartphone V', 'dispositivos moviles', 750.00, '8 GB', '128 GB', 'OnePlus', 200); -- Duplicate primary key violation
INSERT INTO PRODUCTO (id_producto, nombre, tipo, precio_unidad, ram, almacenamiento, marca, stock) VALUES
(16, 'Smartphone W', 'dispositivos moviles', 850.00, '12 GB', '256 GB', 'Xiaomi', 160); -- Duplicate primary key violation
INSERT INTO PRODUCTO (id_producto, nombre, tipo, precio_unidad, ram, almacenamiento, marca, stock) VALUES
(17, 'Consola Switch', 'consolas', 350.00, '4 GB', '32 GB', 'Nintendo', 300); -- Duplicate primary key violation
INSERT INTO PRODUCTO (id_producto, nombre, tipo, precio_unidad, ram, almacenamiento, marca, stock) VALUES
(18, 'Smartwatch D', 'dispositivos moviles', 150.00, '1 GB', '8 GB', 'Fitbit', 600);
INSERT INTO PRODUCTO (id_producto, nombre, tipo, precio_unidad, ram, almacenamiento, marca, stock) VALUES
(19, 'Desktop Elite', 'sobremesa', 2500.00, '64 GB', '4 TB SSD', 'Alienware', 50);

-- Zona_producto
INSERT INTO ZONA_PRODUCTO (id_local, id_zona, id_producto, provincia, ciudad, calle) VALUES
(1, 1, 100, 'Madrid', 'Madrid', 'Gran Vía'); -- Invalid id_producto (does not exist in PRODUCTO)
INSERT INTO ZONA_PRODUCTO (id_local, id_zona, id_producto, provincia, ciudad, calle) VALUES
(1, 1, 1, 'Madrid', 'Madrid', 'NonExistentStreet'); -- Invalid calle (does not exist in ZONA)
INSERT INTO ZONA_PRODUCTO (id_local, id_zona, id_producto, provincia, ciudad, calle) VALUES
(100, 1, 1, 'Madrid', 'Madrid', 'Gran Vía'); -- Invalid id_local (does not exist in ZONA)
INSERT INTO ZONA_PRODUCTO (id_local, id_zona, id_producto, provincia, ciudad, calle) VALUES
(1, 99, 1, 'Madrid', 'Madrid', 'Gran Vía'); -- Invalid id_zona (does not exist in ZONA)
INSERT INTO ZONA_PRODUCTO (id_local, id_zona, id_producto, provincia, ciudad, calle) VALUES
(1, 1, 1, 'Madrid', 'Madrid', 'Gran Vía'); -- Duplicate primary key violation
INSERT INTO ZONA_PRODUCTO (id_local, id_zona, id_producto, provincia, ciudad, calle) VALUES
(1, 2, 2, 'Madrid', 'Madrid', 'Gran Vía'); -- Invalid id_zona (does not match in ZONA)
INSERT INTO ZONA_PRODUCTO (id_local, id_zona, id_producto, provincia, ciudad, calle) VALUES
(10, 10, 10, 'Málaga', 'Málaga', 'Calle Larios'); -- Invalid id_zona (does not exist in ZONA)
INSERT INTO ZONA_PRODUCTO (id_local, id_zona, id_producto, provincia, ciudad, calle) VALUES
(5, 5, 5, 'Bilbao', 'Bilbao', 'Gran Vía Don Diego López de Haro'); -- Duplicate primary key violation
INSERT INTO ZONA_PRODUCTO (id_local, id_zona, id_producto, provincia, ciudad, calle) VALUES
(6, 6, 6, 'Zaragoza', 'Zaragoza', 'Calle del Coso'); -- Duplicate primary key violation
INSERT INTO ZONA_PRODUCTO (id_local, id_zona, id_producto, provincia, ciudad, calle) VALUES
(7, 7, 7, 'Murcia', 'Murcia', 'Avenida de la Constitución'); -- Duplicate primary key violation
INSERT INTO ZONA_PRODUCTO (id_local, id_zona, id_producto, provincia, ciudad, calle) VALUES
(1, 1, 2, 'Madrid', 'Madrid', 'Gran Vía'); -- Invalid id_producto (does not exist in PRODUCTO)
INSERT INTO ZONA_PRODUCTO (id_local, id_zona, id_producto, provincia, ciudad, calle) VALUES
(1, 2, 1, 'Madrid', 'Madrid', 'Gran Vía'); -- Invalid id_zona (does not exist in ZONA)
INSERT INTO ZONA_PRODUCTO (id_local, id_zona, id_producto, provincia, ciudad, calle) VALUES
(1, 2, 20, 'Madrid', 'Madrid', 'Calle Preciados'); -- Invalid id_zona (does not exist in ZONA)
INSERT INTO ZONA_PRODUCTO (id_local, id_zona, id_producto, provincia, ciudad, calle) VALUES
(1, 3, 1, 'Madrid', 'Madrid', 'Gran Vía'); -- Invalid id_zona (does not exist in ZONA)
INSERT INTO ZONA_PRODUCTO (id_local, id_zona, id_producto, provincia, ciudad, calle) VALUES
(1, 4, 1, 'Madrid', 'Madrid', 'Gran Vía'); -- Invalid id_zona (does not exist in ZONA)
INSERT INTO ZONA_PRODUCTO (id_local, id_zona, id_producto, provincia, ciudad, calle) VALUES
(2, 2, 2, 'Barcelona', 'Barcelona', 'Carrer de Pau Claris'); -- Duplicate primary key violation
INSERT INTO ZONA_PRODUCTO (id_local, id_zona, id_producto, provincia, ciudad, calle) VALUES
(19, 19, 19, 'Madrid', 'Madrid', 'Calle Preciados'); -- Invalid id_zona (does not exist in ZONA)
INSERT INTO ZONA_PRODUCTO (id_local, id_zona, id_producto, provincia, ciudad, calle) VALUES
(20, 20, 20, 'Barcelona', 'Barcelona', 'Carrer del Consell de Cent'); -- Invalid id_zona (does not exist in ZONA)

-- Empleados
INSERT INTO EMPLEADO (dni, nombre, apellidos, datos_bancarios) VALUES
('12345A', 'John', 'Doe', 'IBAN123456789'),  -- DNI is too short
('2345678B', 'Jane', 'Smith', 'IBAN987654321'),  -- DNI has incorrect length
('34567890Z', '', 'Gomez', 'IBAN456123789'),  -- Empty name
('45678901D', 'Maria', '', 'IBAN789123456'),  -- Empty surname
('56789012E', 'Luis', 'Martinez', ''),  -- Empty bank data
('67890123F', 'Anna', 'Lopez', '');  -- Empty bank data
('78901234G', 'Pedro', 'Hernandez', 'INVALIDIBAN'),  -- Invalid IBAN format
('89012345H', 'Laura', 'Sanchez', 'IBAN12345'),  -- Invalid IBAN length
('90123456I', 'Marta', 'Perez', 'IBAN$%@123'),  -- Invalid characters in IBAN
('12345678J', 'David', 'Diaz', '1234567890'),  -- Invalid IBAN format
('23456789K', 'Sara', 'Fernandez', 'IBAN1234567890'),  -- Invalid IBAN length
('34567890L', 'Antonio', 'Ruiz', 'IBANabcdefg12345'),  -- Invalid IBAN format
('45678901M', 'Eva', 'Ramirez', '9876543210IBAN'),  -- Invalid IBAN format
('56789012N', 'Miguel', 'Jimenez', 'IBAN1234A56789'),  -- Invalid IBAN format
('67890123O', 'Jose', 'Vazquez', 'IBAN5678901234567'),  -- Invalid IBAN length
('78901234P', 'Elena', 'Gonzalez', 'IBANABCD1234'),  -- Invalid IBAN format
('89012345Q', 'Rosa', 'Mendez', 'ABC12345678'),  -- Invalid IBAN format
('90123456R', 'Pablo', 'Torres', 'IBAN$12A34567'),  -- Invalid IBAN format
('12345678S', 'Isabel', 'Castro', 'IBAN258741963'),  -- Invalid IBAN length
('23456789T', 'Victor', 'Moreno', 'ABCDEFG12345');  -- Invalid IBAN format

-- Socio
 INSERT INTO SOCIO (id_socio, dni, nombre, apellidos, datos_bancarios) VALUES
(1, '12345A', 'John', 'Doe', 'ES1234567890123456789012345678901234');
INSERT INTO SOCIO (id_socio, dni, nombre, apellidos, datos_bancarios) VALUES
(2, '2345678B', 'Jane', 'Smith', 'ES9876543210987654321098765432109876');
INSERT INTO SOCIO (id_socio, dni, nombre, apellidos, datos_bancarios) VALUES
(3, '34567890Z', '', 'Gomez', 'ES4561237890123456789012345678901234');
INSERT INTO SOCIO (id_socio, dni, nombre, apellidos, datos_bancarios) VALUES
(4, '45678901D', 'Maria', '', 'ES7891234560987654321098765432109876');
INSERT INTO SOCIO (id_socio, dni, nombre, apellidos, datos_bancarios) VALUES
(5, '56789012E', 'Luis', 'Martinez', '');
INSERT INTO SOCIO (id_socio, dni, nombre, apellidos, datos_bancarios) VALUES
(6, '67890123F', 'Anna', 'Lopez', '');
INSERT INTO SOCIO (id_socio, dni, nombre, apellidos, datos_bancarios) VALUES
(7, '78901234G', 'Pedro', 'Hernandez', 'INVALIDIBAN1234567890123456789012345678');
INSERT INTO SOCIO (id_socio, dni, nombre, apellidos, datos_bancarios) VALUES
(8, '89012345H', 'Laura', 'Sanchez', 'ES12345');
INSERT INTO SOCIO (id_socio, dni, nombre, apellidos, datos_bancarios) VALUES
(9, '90123456I', 'Marta', 'Perez', 'IBAN1234567890123456789012345678901234');
INSERT INTO SOCIO (id_socio, dni, nombre, apellidos, datos_bancarios) VALUES
(10, '12345678J', 'David', 'Diaz', '1234567890123456789012345678901234');
INSERT INTO SOCIO (id_socio, dni, nombre, apellidos, datos_bancarios) VALUES
(11, '23456789K', 'Sara', 'Fernandez', 'ES258369741098765432109876543210987');
INSERT INTO SOCIO (id_socio, dni, nombre, apellidos, datos_bancarios) VALUES
(12, '34567890L', 'Antonio', 'Ruiz', 'ES36925814701234567890123456789012345');
INSERT INTO SOCIO (id_socio, dni, nombre, apellidos, datos_bancarios) VALUES
(13, '45678901M', 'Eva', 'Ramirez', 'ES12398765409876543210987654321098765');
INSERT INTO SOCIO (id_socio, dni, nombre, apellidos, datos_bancarios) VALUES
(14, '56789012N', 'Miguel', 'Jimenez', '12345678ABCD1234');
INSERT INTO SOCIO (id_socio, dni, nombre, apellidos, datos_bancarios) VALUES
(15, '67890123O', 'Jose', 'Vazquez', 'ES65498732109876543210987654321098765');
INSERT INTO SOCIO (id_socio, dni, nombre, apellidos, datos_bancarios) VALUES
(16, '78901234P', 'Elena', 'Gonzalez', 'ABC123456789');

