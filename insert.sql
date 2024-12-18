-- Local
INSERT INTO LOCAL (id_local, provincia, ciudad, calle, nombre) VALUES
(1, 'Madrid', 'Madrid', 'Gran Vía', 'Store A'),
(2, 'Barcelona', 'Barcelona', 'Passeig de Gràcia', 'Store B'),
(3, 'Valencia', 'Valencia', 'Avenida del Oeste', 'Store C'),
(4, 'Sevilla', 'Sevilla', 'Calle Tetuán', 'Store D'),
(5, 'Madrid', 'Madrid', 'Calle de Preciados', 'Store E'),
(6, 'Bilbao', 'Bilbao', 'Gran Vía Don Diego López de Haro', 'Store F'),
(7, 'Zaragoza', 'Zaragoza', 'Calle del Coso', 'Store G'),
(8, 'Murcia', 'Murcia', 'Avenida de la Constitución', 'Store H'),
(9, 'Granada', 'Granada', 'Calle de los Reyes Católicos', 'Store I'),
(10, 'Palma', 'Palma de Mallorca', 'Carrer de Sant Miquel', 'Store J'),
(11, 'Málaga', 'Málaga', 'Calle Larios', 'Store K'),
(12, 'Alicante', 'Alicante', 'Calle Maisonnave', 'Store L'),
(13, 'Vigo', 'Vigo', 'Calle Urzáiz', 'Store M'),
(14, 'Gijón', 'Gijón', 'Calle de la Corrida', 'Store N'),
(15, 'Córdoba', 'Córdoba', 'Calle Capitulares', 'Store O'),
(16, 'Salamanca', 'Salamanca', 'Calle Toro', 'Store P'),
(17, 'Oviedo', 'Oviedo', 'Calle Uría', 'Store Q'),
(18, 'Santander', 'Santander', 'Calle Cádiz', 'Store R'),
(19, 'Valladolid', 'Valladolid', 'Calle de la Constitución', 'Store S'),
(20, 'Logroño', 'Logroño', 'Calle Portales', 'Store T');

-- Zona
INSERT INTO ZONA (id_zona, id_local, provincia, ciudad, calle, tipo) VALUES
(1, 1, 'Madrid', 'Madrid', 'Gran Vía', 'tienda'),
(2, 2, 'Barcelona', 'Barcelona', 'Passeig de Gràcia', 'almacen'),
(3, 3, 'Valencia', 'Valencia', 'Avenida del Oeste', 'reparacion'),
(4, 4, 'Sevilla', 'Sevilla', 'Calle Tetuán', 'tienda'),
(5, 5, 'Madrid', 'Madrid', 'Calle de Preciados', 'almacen'),
(6, 6, 'Bilbao', 'Bilbao', 'Gran Vía Don Diego López de Haro', 'reparacion'),
(7, 7, 'Zaragoza', 'Zaragoza', 'Calle del Coso', 'tienda'),
(8, 8, 'Murcia', 'Murcia', 'Avenida de la Constitución', 'almacen'),
(9, 9, 'Granada', 'Granada', 'Calle de los Reyes Católicos', 'reparacion'),
(10, 10, 'Palma', 'Palma de Mallorca', 'Carrer de Sant Miquel', 'tienda'),
(11, 11, 'Málaga', 'Málaga', 'Calle Larios', 'almacen'),
(12, 12, 'Alicante', 'Alicante', 'Calle Maisonnave', 'reparacion'),
(13, 13, 'Vigo', 'Vigo', 'Calle Urzáiz', 'tienda'),
(14, 14, 'Gijón', 'Gijón', 'Calle de la Corrida', 'almacen'),
(15, 15, 'Córdoba', 'Córdoba', 'Calle Capitulares', 'reparacion'),
(16, 16, 'Salamanca', 'Salamanca', 'Calle Toro', 'tienda'),
(17, 17, 'Oviedo', 'Oviedo', 'Calle Uría', 'almacen'),
(18, 18, 'Santander', 'Santander', 'Calle Cádiz', 'reparacion'),
(19, 19, 'Valladolid', 'Valladolid', 'Calle de la Constitución', 'tienda'),
(20, 20, 'Logroño', 'Logroño', 'Calle Portales', 'almacen');

-- Producto
INSERT INTO PRODUCTO (id_producto, nombre, tipo, precio_unidad, ram, almacenamiento, marca, stock) VALUES
(1, 'Laptop A', 'sobremesa', 1200.50, '8 GB', '512 GB SSD', 'HP', 100),
(2, 'Laptop B', 'portatil', 1500.00, '16 GB', '1 TB SSD', 'Dell', 50),
(3, 'Smartphone X', 'dispositivos moviles', 700.99, '6 GB', '128 GB', 'Samsung', 200),
(4, 'Smartphone Y', 'dispositivos moviles', 800.00, '8 GB', '256 GB', 'Apple', 150),
(5, 'Consola Play X', 'consolas', 400.00, '4 GB', '1 TB', 'Sony', 300),
(6, 'Consola Xbox Z', 'consolas', 450.00, '8 GB', '1 TB', 'Microsoft', 180),
(7, 'Desktop Tower', 'sobremesa', 1000.00, '16 GB', '2 TB HDD', 'Lenovo', 120),
(8, 'Tablet A', 'portatil', 350.00, '4 GB', '64 GB', 'Huawei', 250),
(9, 'Tablet B', 'portatil', 400.00, '6 GB', '128 GB', 'Samsung', 180),
(10, 'Smartwatch C', 'dispositivos moviles', 250.00, '2 GB', '16 GB', 'Garmin', 500),
(11, 'Laptop C', 'portatil', 1300.00, '8 GB', '256 GB SSD', 'Acer', 110),
(12, 'Smartphone Z', 'dispositivos moviles', 900.00, '8 GB', '512 GB', 'Google', 220),
(13, 'Desktop Pro', 'sobremesa', 1700.00, '32 GB', '2 TB SSD', 'Apple', 90),
(14, 'Laptop X', 'portatil', 2000.00, '32 GB', '1 TB SSD', 'MSI', 80),
(15, 'Smartphone V', 'dispositivos moviles', 750.00, '8 GB', '128 GB', 'OnePlus', 200),
(16, 'Smartphone W', 'dispositivos moviles', 850.00, '12 GB', '256 GB', 'Xiaomi', 160),
(17, 'Consola Switch', 'consolas', 350.00, '4 GB', '32 GB', 'Nintendo', 300),
(18, 'Smartwatch D', 'dispositivos moviles', 150.00, '1 GB', '8 GB', 'Fitbit', 600),
(19, 'Desktop Elite', 'sobremesa', 2500.00, '64 GB', '4 TB SSD', 'Alienware', 50),
(20, 'Laptop Y', 'portatil', 2200.00, '16 GB', '1 TB SSD', 'Razer', 40);

-- Zona_producto
INSERT INTO ZONA_PRODUCTO (id_local, id_zona, id_producto, provincia, ciudad, calle) VALUES
(1, 1, 1, 'Madrid', 'Madrid', 'Gran Vía'),
(2, 2, 2, 'Barcelona', 'Barcelona', 'Passeig de Gràcia'),
(3, 3, 3, 'Valencia', 'Valencia', 'Avenida del Oeste'),
(4, 4, 4, 'Sevilla', 'Sevilla', 'Calle Tetuán'),
(5, 5, 5, 'Madrid', 'Madrid', 'Calle de Preciados'),
(6, 6, 6, 'Bilbao', 'Bilbao', 'Gran Vía Don Diego López de Haro'),
(7, 7, 7, 'Zaragoza', 'Zaragoza', 'Calle del Coso'),
(8, 8, 8, 'Murcia', 'Murcia', 'Avenida de la Constitución'),
(9, 9, 9, 'Granada', 'Granada', 'Calle de los Reyes Católicos'),
(10, 10, 10, 'Palma', 'Palma de Mallorca', 'Carrer de Sant Miquel'),
(11, 11, 11, 'Málaga', 'Málaga', 'Calle Larios'),
(12, 12, 12, 'Alicante', 'Alicante', 'Calle Maisonnave'),
(13, 13, 13, 'Vigo', 'Vigo', 'Calle Urzáiz'),
(14, 14, 14, 'Gijón', 'Gijón', 'Calle de la Corrida'),
(15, 15, 15, 'Córdoba', 'Córdoba', 'Calle Capitulares'),
(16, 16, 16, 'Salamanca', 'Salamanca', 'Calle Toro'),
(17, 17, 17, 'Oviedo', 'Oviedo', 'Calle Uría'),
(18, 18, 18, 'Santander', 'Santander', 'Calle Cádiz'),
(19, 19, 19, 'Valladolid', 'Valladolid', 'Calle de la Constitución'),
(20, 20, 20, 'Logroño', 'Logroño', 'Calle Portales');

-- Empleado
INSERT INTO EMPLEADO (id_empleado, dni, nombre, apellidos, datos_bancarios) VALUES
(1, '12345678A', 'John', 'Doe', 'IBAN123456789'),
(2, '23456789B', 'Jane', 'Smith', 'IBAN987654321'),
(3, '34567890C', 'Carlos', 'Gomez', 'IBAN456123789'),
(4, '45678901D', 'Maria', 'Garcia', 'IBAN789123456'),
(5, '56789012E', 'Luis', 'Martinez', 'IBAN321456987'),
(6, '67890123F', 'Anna', 'Lopez', 'IBAN654321654'),
(7, '78901234G', 'Pedro', 'Hernandez', 'IBAN852963741'),
(8, '89012345H', 'Laura', 'Sanchez', 'IBAN741852963'),
(9, '90123456I', 'Marta', 'Perez', 'IBAN963741852'),
(10, '12345678J', 'David', 'Diaz', 'IBAN741963852'),
(11, '23456789K', 'Sara', 'Fernandez', 'IBAN258369741'),
(12, '34567890L', 'Antonio', 'Ruiz', 'IBAN369258147'),
(13, '45678901M', 'Eva', 'Ramirez', 'IBAN123987654'),
(14, '56789012N', 'Miguel', 'Jimenez', 'IBAN987321654'),
(15, '67890123O', 'Jose', 'Vazquez', 'IBAN654987321'),
(16, '78901234P', 'Elena', 'Gonzalez', 'IBAN258741963'),
(17, '89012345Q', 'Rosa', 'Mendez', 'IBAN369852741'),
(18, '90123456R', 'Pablo', 'Torres', 'IBAN852741963'),
(19, '12345678S', 'Isabel', 'Castro', 'IBAN147258369'),
(20, '23456789T', 'Victor', 'Moreno', 'IBAN258369147');

-- Socio
INSERT INTO SOCIO (id_socio, dni, nombre, apellidos, datos_bancarios) VALUES
(1, '12345678A', 'John', 'Doe', 'ES1234567890123456789012345678901234'),
(2, '23456789B', 'Jane', 'Smith', 'ES9876543210987654321098765432109876'),
(3, '34567890C', 'Carlos', 'Gomez', 'ES4561237890123456789012345678901234'),
(4, '45678901D', 'Maria', 'Garcia', 'ES7891234560987654321098765432109876'),
(5, '56789012E', 'Luis', 'Martinez', 'ES3214569870123456789012345678901234'),
(6, '67890123F', 'Anna', 'Lopez', 'ES6543216540987654321098765432109876'),
(7, '78901234G', 'Pedro', 'Hernandez', 'ES8529637410987654321098765432109876'),
(8, '89012345H', 'Laura', 'Sanchez', 'ES7418529630123456789012345678901234'),
(9, '90123456I', 'Marta', 'Perez', 'ES9637418520987654321098765432109876'),
(10, '12345678J', 'David', 'Diaz', 'ES7419638520123456789012345678901234'),
(11, '23456789K', 'Sara', 'Fernandez', 'ES2583697410987654321098765432109876'),
(12, '34567890L', 'Antonio', 'Ruiz', 'ES3692581470123456789012345678901234'),
(13, '45678901M', 'Eva', 'Ramirez', 'ES1239876540987654321098765432109876'),
(14, '56789012N', 'Miguel', 'Jimenez', 'ES9873216540123456789012345678901234'),
(15, '67890123O', 'Jose', 'Vazquez', 'ES6549873210987654321098765432109876'),
(16, '78901234P', 'Elena', 'Gonzalez', 'ES2587419630123456789012345678901234'),
(17, '89012345Q', 'Rosa', 'Mendez', 'ES3698527410987654321098765432109876'),
(18, '90123456R', 'Pablo', 'Torres', 'ES8527419630123456789012345678901234'),
(19, '12345678S', 'Isabel', 'Castro', 'ES1472583690987654321098765432109876'),
(20, '23456789T', 'Victor', 'Moreno', 'ES2583691470123456789012345678901234');

-- Trabaja
INSERT INTO TRABAJA (id_empleado, id_local, id_zona, provincia, ciudad, calle, fecha_inicio, fecha_final, horario) VALUES
(1, 1, 1, 'Madrid', 'Madrid', 'Gran Vía', '2023-01-01', NULL, ARRAY['09:00'::TIME, '17:00'::TIME]),
(2, 2, 2, 'Barcelona', 'Barcelona', 'Passeig de Gràcia', '2023-02-01', '2023-12-31', ARRAY['08:00'::TIME, '16:00'::TIME]),
(3, 3, 3, 'Valencia', 'Valencia', 'Avenida del Oeste', '2023-03-01', NULL, ARRAY['10:00'::TIME, '18:00'::TIME]),
(4, 4, 4, 'Sevilla', 'Sevilla', 'Calle Tetuán', '2023-04-01', '2023-10-31', ARRAY['07:00'::TIME, '15:00'::TIME]),
(5, 5, 5, 'Madrid', 'Madrid', 'Calle de Preciados', '2023-05-01', NULL, ARRAY['12:00'::TIME, '20:00'::TIME]),
(6, 6, 6, 'Bilbao', 'Bilbao', 'Gran Vía Don Diego López de Haro', '2023-06-01', '2023-12-31', ARRAY['09:00'::TIME, '17:00'::TIME]),
(7, 7, 7, 'Zaragoza', 'Zaragoza', 'Calle del Coso', '2023-07-01', NULL, ARRAY['08:00'::TIME, '16:00'::TIME]),
(8, 8, 8, 'Murcia', 'Murcia', 'Avenida de la Constitución', '2023-08-01', '2023-10-31', ARRAY['10:00'::TIME, '18:00'::TIME]),
(9, 9, 9, 'Granada', 'Granada', 'Calle de los Reyes Católicos', '2023-09-01', NULL, ARRAY['07:00'::TIME, '15:00'::TIME]),
(10, 10, 10, 'Palma', 'Palma de Mallorca', 'Carrer de Sant Miquel', '2023-10-01', '2023-12-31', ARRAY['12:00'::TIME, '20:00'::TIME]),
(11, 11, 11, 'Málaga', 'Málaga', 'Calle Larios', '2023-11-01', NULL, ARRAY['09:00'::TIME, '17:00'::TIME]),
(12, 12, 12, 'Alicante', 'Alicante', 'Calle Maisonnave', '2023-12-01', '2023-12-31', ARRAY['08:00'::TIME, '16:00'::TIME]),
(13, 13, 13, 'Vigo', 'Vigo', 'Calle Urzáiz', '2024-01-01', NULL, ARRAY['10:00'::TIME, '18:00'::TIME]),
(14, 14, 14, 'Gijón', 'Gijón', 'Calle de la Corrida', '2024-02-01', '2024-12-31', ARRAY['07:00'::TIME, '15:00'::TIME]),
(15, 15, 15, 'Córdoba', 'Córdoba', 'Calle Capitulares', '2024-03-01', NULL, ARRAY['12:00'::TIME, '20:00'::TIME]),
(16, 16, 16, 'Salamanca', 'Salamanca', 'Calle Toro', '2024-04-01', '2024-10-31', ARRAY['09:00'::TIME, '17:00'::TIME]),
(17, 17, 17, 'Oviedo', 'Oviedo', 'Calle Uría', '2024-05-01', NULL, ARRAY['08:00'::TIME, '16:00'::TIME]),
(18, 18, 18, 'Santander', 'Santander', 'Calle Cádiz', '2024-06-01', '2024-12-31', ARRAY['10:00'::TIME, '18:00'::TIME]),
(19, 19, 19, 'Valladolid', 'Valladolid', 'Calle de la Constitución', '2024-07-01', NULL, ARRAY['07:00'::TIME, '15:00'::TIME]),
(20, 20, 20, 'Logroño', 'Logroño', 'Calle Portales', '2024-08-01', '2024-10-31', ARRAY['12:00'::TIME, '20:00'::TIME]);


-- Pedido
INSERT INTO PEDIDO (id_pedido, id_empleado, id_socio, fecha, importe_total) VALUES
(1, 1, 1, '2024-12-01', 500.00),
(2, 1, 2, '2024-12-02', 1200.50),
(3, 3, NULL, '2024-12-05', 800.00), -- Pedido sin socio
(4, 3, 4, '2024-12-07', 450.75),
(5, 5, 5, '2024-12-10', 300.00),
(6, 5, NULL, '2024-12-12', 900.99), -- Pedido de un cliente no socio
(7, 7, 7, '2024-12-15', 1100.00),
(8, 7, 8, '2024-12-16', 750.25),
(9, 11, 9, '2024-12-17', 2000.00),
(10, 11, 10, '2024-11-20', 350.00),
(11, 13, 11, '2024-11-22', 400.00),
(12, 13, 12, '2024-11-25', 800.00),
(13, 15, 13, '2024-11-27', 450.00),
(14, 15, 14, '2024-11-27', 600.00),
(15, 17, 15, '2024-08-01', 700.00),
(16, 17, 16, '2024-08-02', 350.00),
(17, 19, 17, '2024-08-05', 400.00),
(18, 19, 18, '2024-08-07', 800.00),
(19, 9, 19, '2024-08-10', 450.00),
(20, 9, 20, '2024-08-12', 600.00);

-- Pedido_producto
INSERT INTO PEDIDO_PRODUCTO (id_producto, id_pedido, unidades) VALUES
(1, 1, 2),  
(2, 1, 1),  
(3, 1, 4),  

(4, 2, 3),  
(5, 2, 2), 

(6, 3, 5),

(7, 4, 1),  
(8, 4, 3),  
(9, 4, 2),  

(10, 5, 1),

(11, 6, 3),  

(12, 7, 2),  
(13, 7, 1),  
(14, 7, 3), 

(15, 8, 4),

(16, 9, 1),

(17, 10, 2),  
(18, 10, 1),  
(19, 10, 3),  

(20, 11, 4);

-- Libre
INSERT INTO LIBRE (id_empleado, fecha_inicio, fecha_final, motivo, baja) VALUES
(1, '2024-01-10', '2024-01-15', 'Vacaciones anuales', FALSE),
(2, '2024-02-05', '2024-02-10', 'Permiso médico', TRUE),
(3, '2024-03-01', '2024-03-03', 'Asuntos personales', FALSE),
(4, '2024-03-15', '2024-03-18', 'Baja por accidente', TRUE),
(5, '2024-04-01', '2024-04-05', 'Viaje familiar', FALSE),
(6, '2024-04-20', '2024-04-25', 'Cuidado de un familiar enfermo', FALSE),
(7, '2024-05-10', '2024-05-12', 'Asistencia a una boda', FALSE),
(8, '2024-06-01', '2024-06-10', 'Vacaciones en el extranjero', FALSE),
(9, '2024-07-01', '2024-07-07', 'Reposo médico', TRUE),
(10, '2024-08-15', '2024-08-20', 'Mudanza', FALSE),
(11, '2024-09-01', '2024-09-03', 'Permiso por examen académico', FALSE),
(12, '2024-10-05', '2024-10-10', 'Baja por enfermedad prolongada', TRUE),
(13, '2024-11-01', '2024-11-07', 'Viaje de emergencia', FALSE),
(14, '2024-11-15', '2024-11-20', 'Asistencia a una conferencia', FALSE),
(15, '2024-12-01', '2024-12-05', 'Recuperación de cirugía', TRUE),
(16, '2024-12-10', '2024-12-15', 'Cuidados postnatales', FALSE),
(17, '2024-12-13', '2024-12-15', 'Visita familiar', FALSE),
(18, '2024-12-14', '2024-12-17', 'Permiso por duelo', FALSE),
(19, '2024-12-15', '2024-12-20', 'Viaje de estudios', FALSE),
(20, '2024-12-16', '2024-12-22', 'Baja médica', TRUE);

-- Sobremesa
INSERT INTO SOBREMESA (id_producto, caja, refrigeracion, placa_base, fuente) VALUES
(1, 'Torre estándar', 'Activa', 'Intel B560', '650W'),
(7, 'Torre compacta', 'Pasiva', 'AMD X570', '750W'),
(13, 'Torre personalizada', 'Activa', 'Intel Z590', '850W'),
(19, 'Torre de alto rendimiento', 'Activa', 'Intel Z690', '1000W');

-- Portatiles
INSERT INTO PORTATILES (id_producto, bateria, pulgadas) VALUES
(2, 'Li-Ion 68Wh', '15.6"'),
(8, 'Li-Po 4500mAh', '10.1"'),
(9, 'Li-Ion 5000mAh', '10.5"'),
(11, 'Li-Ion 48Wh', '14"'),
(14, 'Li-Ion 90Wh', '17"'),
(20, 'Li-Ion 75Wh', '15.6"');

-- Dispositivos moviles
INSERT INTO DISPOSITIVOS_MOVILES (id_producto, bateria, pulgadas, camara) VALUES
(3, 'Li-Ion 4000mAh', '6.5"', 'Triple 12MP'),
(4, 'Li-Ion 3500mAh', '6.1"', 'Dual 12MP'),
(10, 'Li-Ion 300mAh', '1.3"', 'GPS'),
(12, 'Li-Ion 4500mAh', '6.3"', 'Doble 48MP'),
(15, 'Li-Ion 3800mAh', '6.55"', 'Cuádruple 64MP'),
(16, 'Li-Ion 4000mAh', '6.8"', 'Triple 108MP'),
(18, 'Li-Ion 150mAh', '1.4"', 'Mono 8MP');

-- Consola
INSERT INTO CONSOLA (id_producto, portable) VALUES
(5, FALSE),
(6, FALSE),
(17, TRUE);

