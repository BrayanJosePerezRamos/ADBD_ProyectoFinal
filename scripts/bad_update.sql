-- Local
UPDATE LOCAL SET id_local = NULL WHERE id_local = 6; 
UPDATE LOCAL SET provincia = '' WHERE id_local = 7; 
UPDATE LOCAL SET ciudad = NULL WHERE id_local = 8; 
UPDATE LOCAL SET calle = '' WHERE id_local = 9; 
UPDATE LOCAL SET nombre = '' WHERE id_local = 10;

UPDATE ZONA SET provincia = '' WHERE id_zona = 1; -- Fails due to empty string in 'provincia'
UPDATE ZONA SET id_local = -1 WHERE id_zona = 2; -- Fails due to invalid foreign key reference to 'LOCAL'
UPDATE ZONA SET id_zona = NULL WHERE id_zona = 3; -- Fails due to primary key constraint
UPDATE ZONA SET id_local = 3, provincia = 'Valencia', ciudad = NULL WHERE id_zona = 4; -- Fails due to NULL value in 'ciudad'
UPDATE ZONA SET id_local = 5 WHERE id_zona = 10; -- Fails due to no matching 'id_local' in the referenced table

UPDATE PRODUCTO SET descripcion = NULL WHERE id_producto = 1; -- Fails due to NULL in non-nullable field 'descripcion'
UPDATE PRODUCTO SET precio = -100 WHERE id_producto = 5; -- Fails due to negative value in 'precio'
UPDATE PRODUCTO SET id_categoria = NULL WHERE id_producto = 2; -- Fails due to NULL value in foreign key 'id_categoria'
UPDATE PRODUCTO SET nombre = '' WHERE id_producto = 3; -- Fails due to empty string in 'nombre'
UPDATE PRODUCTO SET id_producto = NULL WHERE id_producto = 4; -- Fails due to primary key being NULL

UPDATE ZONA_PRODUCTO SET id_producto = NULL WHERE id_zona = 1; -- Fails due to NULL value in foreign key 'id_producto'
UPDATE ZONA_PRODUCTO SET id_zona = 99 WHERE id_zona = 2; -- Fails due to no matching 'id_zona' in the referenced table
UPDATE ZONA_PRODUCTO SET unidades = -5 WHERE id_zona = 3 AND id_producto = 4; -- Fails due to negative value in 'unidades'
UPDATE ZONA_PRODUCTO SET id_producto = 1000 WHERE id_zona = 1; -- Fails due to no matching 'id_producto' in the referenced table
UPDATE ZONA_PRODUCTO SET id_zona = 5 WHERE id_zona = 2; -- Fails due to no matching 'id_zona' in the referenced table

UPDATE EMPLEADO SET salario = -500 WHERE id_empleado = 1; -- Fails due to negative value in 'salario'
UPDATE EMPLEADO SET fecha_nacimiento = NULL WHERE id_empleado = 2; -- Fails due to NULL in 'fecha_nacimiento'
UPDATE EMPLEADO SET id_departamento = 999 WHERE id_empleado = 3; -- Fails due to no matching 'id_departamento' in the referenced table
UPDATE EMPLEADO SET nombre = '' WHERE id_empleado = 4; -- Fails due to empty string in 'nombre'
UPDATE EMPLEADO SET id_empleado = NULL WHERE id_empleado = 5; -- Fails due to primary key being NULL

UPDATE PEDIDO SET importe_total = -1000 WHERE id_pedido = 1; -- Fails due to negative value in 'importe_total'
UPDATE PEDIDO SET fecha = '2025-01-01' WHERE id_pedido = 2; -- Fails due to date being in the future
UPDATE PEDIDO SET id_empleado = 999 WHERE id_pedido = 4; -- Fails due to no matching 'id_empleado' in the referenced table
UPDATE PEDIDO SET importe_total = 'Invalid' WHERE id_pedido = 5; -- Fails due to incorrect data type in 'importe_total'

UPDATE PEDIDO_PRODUCTO SET unidades = -1 WHERE id_pedido = 1 AND id_producto = 2; -- Fails due to negative value in 'unidades'
UPDATE PEDIDO_PRODUCTO SET id_producto = NULL WHERE id_pedido = 2; -- Fails due to NULL in 'id_producto'
UPDATE PEDIDO_PRODUCTO SET id_pedido = 999 WHERE id_pedido = 3; -- Fails due to no matching 'id_pedido' in the referenced table
UPDATE PEDIDO_PRODUCTO SET unidades = 'Invalid' WHERE id_pedido = 4 AND id_producto = 5; -- Fails due to incorrect data type in 'unidades'
UPDATE PEDIDO_PRODUCTO SET id_pedido = 5, id_producto = 999 WHERE id_pedido = 6; -- Fails due to no matching 'id_producto' in the referenced table

UPDATE LIBRE SET fecha_inicio = '2025-01-01' WHERE id_empleado = 1; -- Fails due to date being in the future
UPDATE LIBRE SET fecha_final = '2023-01-01' WHERE id_empleado = 2; -- Fails due to 'fecha_final' being before 'fecha_inicio'
UPDATE LIBRE SET baja = NULL WHERE id_empleado = 3; -- Fails due to NULL in non-nullable field 'baja'
UPDATE LIBRE SET motivo = '' WHERE id_empleado = 4; -- Fails due to empty string in 'motivo'
UPDATE LIBRE SET id_empleado = NULL WHERE id_empleado = 5; -- Fails due to primary key being NULL

UPDATE TRABAJA SET id_local = 999 WHERE id_empleado = 4; -- Fails due to no matching 'id_local' in the referenced table
UPDATE TRABAJA SET horario = NULL WHERE id_empleado = 5; -- Fails due to NULL value in 'horario' array

UPDATE SOBREMESA SET caja = NULL WHERE id_producto = 1; -- Fails due to NULL in non-nullable field 'caja'
UPDATE SOBREMESA SET id_producto = 999 WHERE id_producto = 13; -- Fails due to no matching 'id_producto' in the referenced table
UPDATE SOBREMESA SET fuente = '' WHERE id_producto = 19; -- Fails due to empty string in 'fuente'

UPDATE PORTATILES SET bateria = NULL WHERE id_producto = 2; -- Fails due to NULL in non-nullable field 'bateria'
UPDATE PORTATILES SET pulgadas = '' WHERE id_producto = 8; -- Fails due to empty string in 'pulgadas'
UPDATE PORTATILES SET id_producto = 999 WHERE id_producto = 9; -- Fails due to no matching 'id_producto' in the referenced table
UPDATE PORTATILES SET id_producto = NULL WHERE id_producto = 14; -- Fails due to primary key being NULL

UPDATE DISPOSITIVOS_MOVILES SET bateria = NULL WHERE id_producto = 3; -- Fails due to NULL in non-nullable field 'bateria'
UPDATE DISPOSITIVOS_MOVILES SET camara = '' WHERE id_producto = 4; -- Fails due to empty string in 'camara'
UPDATE DISPOSITIVOS_MOVILES SET id_producto = 999 WHERE id_producto = 10; -- Fails due to no matching 'id_producto' in the referenced table
UPDATE DISPOSITIVOS_MOVILES SET id_producto = NULL WHERE id_producto = 15; -- Fails due to primary key being NULL

UPDATE CONSOLA SET portable = NULL WHERE id_producto = 5; -- Fails due to NULL in non-nullable field 'portable'
UPDATE CONSOLA SET id_producto = 999 WHERE id_producto = 6; -- Fails due to no matching 'id_producto' in the referenced table
UPDATE CONSOLA SET portable = 'Invalid' WHERE id_producto = 17; -- Fails due to invalid value in 'portable'
UPDATE CONSOLA SET id_producto = NULL WHERE id_producto = 5; -- Fails due to primary key being NULL
UPDATE CONSOLA SET portable = NULL WHERE id_producto = 6; -- Fails due to NULL in non-nullable field 'portable'

-- Socio
UPDATE SOCIO SET dni = '1234' WHERE id_socio = 1;
UPDATE SOCIO SET nombre = '' WHERE id_socio = 2; 
UPDATE SOCIO SET datos_bancarios = '' WHERE id_socio = 3;
