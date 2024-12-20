\o spool.lst
----------------------------------------------------------------------------------------------
-------------------------------------------INSERTS--------------------------------------------
----------------------------------------------------------------------------------------------
\i empty.sql

--Local
INSERT INTO LOCAL (id_local, provincia, ciudad, calle, nombre) VALUES
(1, 'Madrid', 'Madrid', 'Gran Vía', 'Store A');


-- Zona
INSERT INTO ZONA (id_zona, id_local, provincia, ciudad, calle, tipo) VALUES
(1, 1, 'Madrid', 'Madrid', 'Gran Vía', 'tienda');


-- Producto
INSERT INTO PRODUCTO (id_producto, nombre, tipo, precio_unidad, ram, almacenamiento, marca, stock) VALUES
(1, 'Laptop A', 'sobremesa', 1200.50, '8 GB', '512 GB SSD', 'HP', 100);


-- Zona_producto
INSERT INTO ZONA_PRODUCTO (id_local, id_zona, id_producto, provincia, ciudad, calle) VALUES
(1, 1, 1, 'Madrid', 'Madrid', 'Gran Vía');


-- Empleado
INSERT INTO EMPLEADO (id_empleado, dni, nombre, apellidos, datos_bancarios) VALUES
(1, '12345678A', 'John', 'Doe', 'IBAN123456789');


-- Socio
INSERT INTO SOCIO (id_socio, dni, nombre, apellidos, datos_bancarios) VALUES
(1, '12345678A', 'John', 'Doe', 'ES1234567890123456789012345678901234');


-- Trabaja
INSERT INTO TRABAJA (id_empleado, id_local, id_zona, provincia, ciudad, calle, fecha_inicio, fecha_final, horario) VALUES
(1, 1, 1, 'Madrid', 'Madrid', 'Gran Vía', '2023-01-01', NULL, ARRAY['09:00'::TIME, '17:00'::TIME]);


-- Pedido
INSERT INTO PEDIDO (id_pedido, id_empleado, id_socio, fecha, importe_total) VALUES
(1, 1, 1, '2024-12-01', 500.00);


-- Pedido_producto
INSERT INTO PEDIDO_PRODUCTO (id_producto, id_pedido, unidades) VALUES
(1, 1, 2);


-- Libre
INSERT INTO LIBRE (id_empleado, fecha_inicio, fecha_final, motivo, baja) VALUES
(1, '2024-01-10', '2024-01-15', 'Vacaciones anuales', FALSE);


-- Sobremesa
INSERT INTO SOBREMESA (id_producto, caja, refrigeracion, placa_base, fuente) VALUES
(1, 'Torre estándar', 'Activa', 'Intel B560', '650W');


-- Portatiles
INSERT INTO PORTATILES (id_producto, bateria, pulgadas) VALUES
(2, 'Li-Ion 68Wh', '15.6"');

-- Dispositivos moviles
INSERT INTO DISPOSITIVOS_MOVILES (id_producto, bateria, pulgadas, camara) VALUES
(3, 'Li-Ion 4000mAh', '6.5"', 'Triple 12MP');

-- Consola
INSERT INTO CONSOLA (id_producto, portable) VALUES
(5, FALSE);

-- \i insert.sql
-- ----------------------------------------------------------------------------------------------
-- -------------------------------------------UPDATES--------------------------------------------
-- ----------------------------------------------------------------------------------------------
-- -- Local
-- SELECT 'TABLA LOCAL';
-- UPDATE LOCAL SET provincia = 'Valencia', calle = 'Calle Nueva' WHERE id_local = 2;
-- 
-- -- Zona
-- SELECT 'TABLA ZONA';
-- UPDATE ZONA SET tipo = 'tienda' WHERE id_zona = 1;
-- 
-- -- Producto
-- SELECT 'TABLA PRODUCTO';
-- UPDATE PRODUCTO SET stock = 120 WHERE id_producto = 1;
-- 
-- -- Zona_producto
-- SELECT 'TABLA ZONA_PRODUCTO';
-- UPDATE ZONA_PRODUCTO SET provincia = 'Madrid', ciudad = 'Madrid', calle = 'Gran Vía' WHERE id_local = 1 AND id_zona = 1 AND id_producto = 1;
-- 
-- -- Empleado 
-- SELECT 'TABLA EMPLEADO ';
-- UPDATE EMPLEADO SET nombre = 'Johnathan' WHERE id_empleado = 1;
-- 
-- -- Socio
-- SELECT 'TABLA SOCIO';
-- UPDATE SOCIO SET nombre = 'Carlos Updated' WHERE id_socio = 1;
-- 
-- -- Pedido
-- SELECT 'TABLA PEDIDO';
-- UPDATE PEDIDO SET importe_total = 550.00, fecha = '2024-12-03' WHERE id_pedido = 1;
-- 
-- -- Trabaja
-- SELECT 'TABLA TRABAJA';
-- UPDATE TRABAJA 
-- SET fecha_final = '2024-12-31', horario = ARRAY['09:00'::TIME, '17:00'::TIME] WHERE id_empleado = 2 AND fecha_inicio = '2023-02-01';
-- 
-- -- PEDIDO_PRODUCTO
-- SELECT 'TABLA PEDIDO_PRODUCTO';
-- UPDATE PEDIDO_PRODUCTO SET unidades = 3 WHERE id_producto = 1 AND id_pedido = 1;
-- 
-- -- Libre
-- SELECT 'TABLA LIBRE';
-- UPDATE LIBRE SET fecha_final = '2024-01-18', motivo = 'Vacaciones anuales extendidas' WHERE id_empleado = 1 AND fecha_inicio = '2024-01-10';
-- 
-- -- Sobremesa
-- SELECT 'TABLA SOBREMESA';
-- UPDATE SOBREMESA SET caja = 'Torre avanzada', refrigeracion = 'Activa', placa_base = 'Intel Z590', fuente = '1000W' WHERE id_producto = 1;
-- 
-- -- Portatiles
-- SELECT 'TABLA PORTATILES';
-- UPDATE PORTATILES SET bateria = 'Li-Ion 72Wh', pulgadas = '16"' WHERE id_producto = 2;
-- 
-- -- Dispositivos moviles
-- SELECT 'TABLA DISPOSITIVOS_MOVILES';
-- UPDATE DISPOSITIVOS_MOVILES SET bateria = 'Li-Ion 5000mAh', pulgadas = '6.7"', camara = 'Cuádruple 64MP' WHERE id_producto = 3;
-- 
-- -- Consola
-- SELECT 'TABLA CONSOLA';
-- UPDATE CONSOLA SET portable = TRUE WHERE id_producto = 5;
-- 
-- \i update.sql
-- ----------------------------------------------------------------------------------------------
-- -------------------------------------------DELETES--------------------------------------------
-- ----------------------------------------------------------------------------------------------
-- 
-- DELETE FROM CONSOLA WHERE STOCK < 100;
-- DELETE FROM CONSOLA WHERE ID_CONSOLA = 5;
-- 
-- DELETE FROM DISPOSITIVOS_MOVILES WHERE MARCA = 'SAMSUNG';
-- DELETE FROM DISPOSITIVOS_MOVILES WHERE RAM < '4 GB';
-- 
-- DELETE FROM EMPLEADO WHERE ID_EMPLEADO NOT IN (SELECT ID_EMPLEADO FROM TRABAJA);
-- DELETE FROM EMPLEADO WHERE DNI = '12345678A';
-- 
-- DELETE FROM LIBRE WHERE ID_EMPLEADO = 2 AND FECHA_INICIO = '2024-01-01';
-- DELETE FROM LIBRE WHERE ID_EMPLEADO = 3;
-- 
-- DELETE FROM LOCAL WHERE ID_LOCAL = 10;
-- DELETE FROM LOCAL WHERE PROVINCIA = 'MADRID';
-- 
-- DELETE FROM PEDIDO WHERE IMPORTE_TOTAL < 500;
-- DELETE FROM PEDIDO WHERE ID_PEDIDO = 4;
-- 
-- DELETE FROM PEDIDO_PRODUCTO WHERE ID_PEDIDO = 3;
-- 
-- DELETE FROM PORTATILES WHERE RAM < '4 GB';
-- DELETE FROM PORTATILES WHERE ID_PORTATIL = 8;
-- 
-- DELETE FROM PRODUCTO WHERE STOCK = 0;
-- DELETE FROM PRODUCTO WHERE ID_PRODUCTO = 12;
-- 
-- DELETE FROM SOBREMESA WHERE MARCA = 'LENOVO';
-- DELETE FROM SOBREMESA WHERE ALMACENAMIENTO < '1 TB';
-- 
-- DELETE FROM SOCIO WHERE DNI = '23456789B';
-- DELETE FROM SOCIO WHERE ID_SOCIO NOT IN (SELECT ID_SOCIO FROM PEDIDO WHERE ID_SOCIO IS NOT NULL);
-- 
-- DELETE FROM TRABAJA WHERE ID_EMPLEADO = 7;
-- DELETE FROM TRABAJA WHERE ID_LOCAL = 10 AND FECHA_FINAL IS NOT NULL;
-- 
-- DELETE FROM ZONA WHERE ID_ZONA = 5;
-- DELETE FROM ZONA WHERE ID_ZONA NOT IN (SELECT ID_ZONA FROM LOCAL);
-- 
-- DELETE FROM zona_producto WHERE ciudad = 'Barcelona';
-- 
-- \o
