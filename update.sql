\i empty.sql
\i insert.sql 

-- Local
SELECT 'TABLA LOCAL';
UPDATE LOCAL SET provincia = 'Valencia', calle = 'Calle Nueva' WHERE id_local = 2;
UPDATE LOCAL SET nombre = 'Store Updated' WHERE id_local = 3;
UPDATE LOCAL SET ciudad = 'Sevilla' WHERE id_local = 4;
UPDATE LOCAL SET calle = 'Avenida Principal' WHERE id_local = 5;

-- Zona
SELECT 'TABLA ZONA';
UPDATE ZONA SET tipo = 'tienda' WHERE id_zona = 1;
UPDATE ZONA SET provincia = 'Bilbao' WHERE id_zona = 6;
UPDATE ZONA SET ciudad = 'Vigo' WHERE id_zona = 13;
UPDATE ZONA SET tipo = 'almacen' WHERE id_zona = 16;

-- Producto
SELECT 'TABLA PRODUCTO';
UPDATE PRODUCTO SET stock = 120 WHERE id_producto = 1;
UPDATE PRODUCTO SET precio_unidad = 750.00 WHERE id_producto = 3;
UPDATE PRODUCTO SET almacenamiento = '2 TB' WHERE id_producto = 5;
UPDATE PRODUCTO SET ram = '16 GB' WHERE id_producto = 4;
UPDATE PRODUCTO SET marca = 'Lenovo' WHERE id_producto = 11;

-- Zona_producto
SELECT 'TABLA ZONA_PRODUCTO';
UPDATE ZONA_PRODUCTO SET provincia = 'Madrid', ciudad = 'Madrid', calle = 'Gran Vía' WHERE id_local = 1 AND id_zona = 1 AND id_producto = 1;
UPDATE ZONA_PRODUCTO SET provincia = 'Valencia', ciudad = 'Valencia', calle = 'Avenida del Oeste' WHERE id_local = 3 AND id_zona = 3 AND id_producto = 3;
UPDATE ZONA_PRODUCTO SET ciudad = 'Sevilla', calle = 'Calle Tetuán' WHERE id_local = 4 AND id_zona = 4 AND id_producto = 4;
UPDATE ZONA_PRODUCTO SET provincia = 'Bilbao', ciudad = 'Bilbao', calle = 'Gran Vía Don Diego López de Haro' WHERE id_local = 6 AND id_zona = 6 AND id_producto = 6;

-- Empleado 
SELECT 'TABLA EMPLEADO ';
UPDATE EMPLEADO SET nombre = 'Johnathan' WHERE id_empleado = 1;
UPDATE EMPLEADO SET apellidos = 'Johnson' WHERE id_empleado = 2;
UPDATE EMPLEADO SET dni = '34567890Z' WHERE id_empleado = 3;
UPDATE EMPLEADO SET datos_bancarios = 'IBAN654987654' WHERE id_empleado = 4;
UPDATE EMPLEADO SET nombre = 'Luis Miguel' WHERE id_empleado = 5;

-- Socio
SELECT 'TABLA SOCIO';
UPDATE SOCIO SET nombre = 'Carlos Updated' WHERE id_socio = 1;
UPDATE SOCIO SET apellidos = 'Fernandez Updated' WHERE id_socio = 2;
UPDATE SOCIO SET datos_bancarios = 'ES7600000000000000000002' WHERE id_socio = 3;
UPDATE SOCIO SET dni = '12345678Z' WHERE id_socio = 4;
UPDATE SOCIO SET nombre = 'Ana Updated' WHERE id_socio = 5;

-- Pedido
SELECT 'TABLA PEDIDO';
UPDATE PEDIDO SET importe_total = 550.00, fecha = '2024-12-03' WHERE id_pedido = 1;
UPDATE PEDIDO SET id_socio = 6, importe_total = 1300.00 WHERE id_pedido = 2;
UPDATE PEDIDO SET importe_total = 950.00 WHERE id_pedido = 6;
UPDATE PEDIDO SET id_socio = 10, fecha = '2024-12-18' WHERE id_pedido = 9;
UPDATE PEDIDO SET fecha = '2024-11-21', importe_total = 380.00 WHERE id_pedido = 10;

-- Trabaja
SELECT 'TABLA TRABAJA';
UPDATE TRABAJA 
SET fecha_final = '2024-12-31', horario = ARRAY['09:00'::TIME, '17:00'::TIME] WHERE id_empleado = 2 AND fecha_inicio = '2023-02-01';
UPDATE TRABAJA 
SET fecha_final = '2023-10-31', horario = ARRAY['07:00'::TIME, '15:00'::TIME] WHERE id_empleado = 4 AND provincia = 'Sevilla';
UPDATE TRABAJA 
SET fecha_inicio = '2024-05-01', horario = ARRAY['10:00'::TIME, '18:00'::TIME] WHERE id_empleado = 13 AND ciudad = 'Vigo';

-- PEDIDO_PRODUCTO
SELECT 'TABLA PEDIDO_PRODUCTO';
UPDATE PEDIDO_PRODUCTO SET unidades = 3 WHERE id_producto = 1 AND id_pedido = 1;
UPDATE PEDIDO_PRODUCTO SET unidades = 2 WHERE id_producto = 4 AND id_pedido = 2;
UPDATE PEDIDO_PRODUCTO SET unidades = 6 WHERE id_producto = 7 AND id_pedido = 4;
UPDATE PEDIDO_PRODUCTO SET unidades = 5 WHERE id_producto = 10 AND id_pedido = 5;
UPDATE PEDIDO_PRODUCTO SET unidades = 4 WHERE id_producto = 13 AND id_pedido = 7;

-- Libre
SELECT 'TABLA LIBRE';
UPDATE LIBRE SET fecha_final = '2024-01-18', motivo = 'Vacaciones anuales extendidas' WHERE id_empleado = 1 AND fecha_inicio = '2024-01-10';
UPDATE LIBRE SET fecha_inicio = '2024-03-02', fecha_final = '2024-03-04', motivo = 'Asuntos personales extendidos' WHERE id_empleado = 3 AND fecha_inicio = '2024-03-01';
UPDATE LIBRE SET motivo = 'Baja por accidente prolongada' WHERE id_empleado = 4 AND fecha_inicio = '2024-03-15';
UPDATE LIBRE SET fecha_final = '2024-10-12', motivo = 'Baja por enfermedad prolongada' WHERE id_empleado = 12 AND fecha_inicio = '2024-10-05';
UPDATE LIBRE SET baja = FALSE, motivo = 'Recuperación de cirugía exitosa' WHERE id_empleado = 15 AND fecha_inicio = '2024-12-01';

-- Sobremesa
SELECT 'TABLA SOBREMESA';
UPDATE SOBREMESA SET caja = 'Torre avanzada', refrigeracion = 'Activa', placa_base = 'Intel Z590', fuente = '1000W' WHERE id_producto = 1;
UPDATE SOBREMESA SET caja = 'Torre compacta', refrigeracion = 'Pasiva', placa_base = 'AMD B550', fuente = '650W' WHERE id_producto = 7;
UPDATE SOBREMESA SET caja = 'Torre profesional', refrigeracion = 'Activa', placa_base = 'Intel Z690', fuente = '850W' WHERE id_producto = 13;
UPDATE SOBREMESA SET refrigeracion = 'Pasiva', fuente = '750W' WHERE id_producto = 19;
UPDATE SOBREMESA SET caja = 'Torre personalizada', placa_base = 'Intel B460' WHERE id_producto = 1;

-- Portatiles
SELECT 'TABLA PORTATILES';
UPDATE PORTATILES SET bateria = 'Li-Ion 72Wh', pulgadas = '16"' WHERE id_producto = 2;
UPDATE PORTATILES SET bateria = 'Li-Po 5000mAh', pulgadas = '11.6"' WHERE id_producto = 8;
UPDATE PORTATILES SET bateria = 'Li-Ion 52Wh', pulgadas = '14"' WHERE id_producto = 9;
UPDATE PORTATILES SET bateria = 'Li-Ion 100Wh', pulgadas = '15.6"' WHERE id_producto = 14;
UPDATE PORTATILES SET pulgadas = '18.4"' WHERE id_producto = 20;

-- Dispositivos moviles
SELECT 'TABLA DISPOSITIVOS_MOVILES';
UPDATE DISPOSITIVOS_MOVILES SET bateria = 'Li-Ion 5000mAh', pulgadas = '6.7"', camara = 'Cuádruple 64MP' WHERE id_producto = 3;
UPDATE DISPOSITIVOS_MOVILES SET bateria = 'Li-Ion 4200mAh', camara = 'Dual 16MP' WHERE id_producto = 4;
UPDATE DISPOSITIVOS_MOVILES SET bateria = 'Li-Ion 5000mAh', camara = 'Triple 48MP' WHERE id_producto = 12;
UPDATE DISPOSITIVOS_MOVILES SET bateria = 'Li-Ion 4300mAh', camara = 'Cuádruple 108MP' WHERE id_producto = 15;
UPDATE DISPOSITIVOS_MOVILES SET camara = 'Mono 12MP', bateria = 'Li-Ion 200mAh' WHERE id_producto = 18;

-- Consola
SELECT 'TABLA CONSOLA';
UPDATE CONSOLA SET portable = TRUE WHERE id_producto = 5;
UPDATE CONSOLA SET portable = FALSE WHERE id_producto = 6;
UPDATE CONSOLA SET portable = TRUE WHERE id_producto = 17;
UPDATE CONSOLA SET portable = FALSE WHERE id_producto = 5;
UPDATE CONSOLA SET portable = TRUE WHERE id_producto = 6;


