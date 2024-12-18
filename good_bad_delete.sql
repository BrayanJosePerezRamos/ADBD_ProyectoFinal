\i insert.sql

DELETE FROM consola WHERE stock < 100;
DELETE FROM consola WHERE id_consola = 5;

DELETE FROM dispositivos_moviles WHERE marca = 'Samsung';
DELETE FROM dispositivos_moviles WHERE ram < '4 GB';

DELETE FROM empleado WHERE id_empleado NOT IN (SELECT id_empleado FROM trabaja);
DELETE FROM empleado WHERE dni = '12345678A';

DELETE FROM libre WHERE id_empleado = 2 AND fecha_inicio = '2024-01-01';
DELETE FROM libre WHERE id_empleado = 3;

DELETE FROM local WHERE id_local = 10;
DELETE FROM local WHERE provincia = 'Madrid';

DELETE FROM pedido WHERE importe_total < 500;
DELETE FROM pedido WHERE id_pedido = 4;

DELETE FROM pedido_producto WHERE id_pedido = 3;

DELETE FROM portatiles WHERE ram < '4 GB';
DELETE FROM portatiles WHERE id_portatil = 8;

DELETE FROM producto WHERE stock = 0;
DELETE FROM producto WHERE id_producto = 12;

DELETE FROM sobremesa WHERE marca = 'Lenovo';
DELETE FROM sobremesa WHERE almacenamiento < '1 TB';

DELETE FROM socio WHERE dni = '23456789B';
DELETE FROM socio WHERE id_socio NOT IN (SELECT id_socio FROM pedido WHERE id_socio IS NOT NULL);

DELETE FROM trabaja WHERE id_empleado = 7;
DELETE FROM trabaja WHERE id_local = 10 AND fecha_final IS NOT NULL;

DELETE FROM zona WHERE id_zona = 5;
DELETE FROM zona WHERE id_zona NOT IN (SELECT id_zona FROM local);

DELETE FROM zona_producto WHERE ciudad = 'Barcelona';
