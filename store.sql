CREATE TYPE TIPO_PRODUCTO AS ENUM('sobremesa', 'portatil','dispositivos moviles', 'consolas');

-- Tabla local
CREATE TABLE LOCAL (
  id_local INT,
  provincia VARCHAR(100) NOT NULL CHECK (provincia <> ''),
  ciudad VARCHAR(100) NOT NULL CHECK (ciudad <> ''),
  calle VARCHAR(100) NOT NULL CHECK (calle <> ''),
  nombre VARCHAR(100) NOT NULL CHECK (nombre <> ''),
  PRIMARY KEY(id_local, provincia, ciudad, calle)
);
-- INSERT INTO vivero (id,longitud, latitud, nombre) VALUES (1,  28.6167721, -17.8881046, 'TACO');
-- INSERT INTO vivero (id,longitud, latitud, nombre) VALUES (2,  29.6238863, -17.8971276, 'ICOD');
-- INSERT INTO vivero (id,longitud, latitud, nombre) VALUES (3,  28.6485041, -17.9003433, 'SC');
-- INSERT INTO vivero (id,longitud, latitud, nombre) VALUES (4,  26.9977721, -18.0236046, 'LL');
-- INSERT INTO vivero (id,longitud, latitud, nombre) VALUES (5,  22.5443547, -15.5543256, 'OROTAVA');

-- Tabla Zona
CREATE TABLE ZONA (
  id_zona INT NOT NULL,
  id_local INT NOT NULL,
  provincia VARCHAR(100) NOT NULL,
  ciudad VARCHAR(100) NOT NULL,
  calle VARCHAR(100) NOT NULL,
  tipo VARCHAR(50) NOT NULL,
  PRIMARY KEY(id_zona, id_local, provincia, ciudad, calle),
  FOREIGN KEY (id_local, provincia, ciudad, calle) REFERENCES LOCAL(id_local, provincia, ciudad, calle)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
-- INSERT INTO zona (id, id_vivero, tipo, longitud, latitud) VALUES (1, 3, 'ALMACEN', 28.6167721, -17.8881046);
-- INSERT INTO zona (id, id_vivero, tipo, longitud, latitud) VALUES (2, 3, 'ABIERTO', 28.6167689, -17.8881023);
-- INSERT INTO zona (id, id_vivero, tipo, longitud, latitud) VALUES (3, 3, 'ARBOLEDA', 28.6167697, -17.8881037);
-- INSERT INTO zona (id, id_vivero, tipo, longitud, latitud) VALUES (4, 1, 'MACETAS', 29.6238863, -17.8971276);
-- INSERT INTO zona (id, id_vivero, tipo, longitud, latitud) VALUES (1, 2, 'ALMACEN', 22.5443542, -15.5543255);

-- Tabla Producto
CREATE TABLE PRODUCTO (
  id_producto INT,
  nombre VARCHAR(100) NOT NULL CHECK (nombre <> ''),
  tipo TIPO_PRODUCTO NOT NULL,
  precio_unidad DECIMAL(10, 2) CHECK (precio_unidad > 0),
  ram VARCHAR(100) NOT NULL CHECK (ram <> ''),
  almacenamiento VARCHAR(100) NOT NULL CHECK (almacenamiento <> ''),
  marca VARCHAR(100) NOT NULL CHECK (marca <> ''),
  stock INT CHECK (stock >= 0),
  PRIMARY KEY (id_producto)
);
-- INSERT INTO PRODUCTO (id, nombre, tipo, precio_unidad, stock) VALUES (1, 'Maceta de barro', 'Macetas', 15.50, 200);
-- INSERT INTO PRODUCTO (id, nombre, tipo, precio_unidad, stock) VALUES (2, 'Abono orgánico', 'Fertilizantes', 25.00, 150);
-- INSERT INTO PRODUCTO (id, nombre, tipo, precio_unidad, stock) VALUES (3, 'Rastrillo pequeño', 'Herramientas', 8.75, 80);
-- INSERT INTO PRODUCTO (id, nombre, tipo, precio_unidad, stock) VALUES (4, 'Sustrato universal', 'Sustratos', 12.50, 300);
-- INSERT INTO PRODUCTO (id, nombre, tipo, precio_unidad, stock) VALUES (5, 'Semillas de tomate', 'Semillas', 3.20, 500);

-- Zona contiene producto 
CREATE TABLE ZONA_PRODUCTO (
  id_local INT NOT NULL,
  id_zona INT NOT NULL,
  id_producto INT UNIQUE NOT NULL,
  provincia VARCHAR(100) NOT NULL,
  ciudad VARCHAR(100) NOT NULL,
  calle VARCHAR(100) NOT NULL,
  PRIMARY KEY(id_local, id_zona, id_producto),

  FOREIGN KEY (id_zona, id_local, provincia, ciudad, calle) REFERENCES ZONA(id_zona, id_local, provincia, ciudad, calle) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto) ON DELETE CASCADE ON UPDATE CASCADE
);
-- INSERT INTO ZONA_PRODUCTO (id_zona, id_vivero, id_producto) VALUES (1, 3, 3);
-- INSERT INTO ZONA_PRODUCTO (id_zona, id_vivero, id_producto) VALUES (2, 3, 1);
-- INSERT INTO ZONA_PRODUCTO (id_zona, id_vivero, id_producto) VALUES (3, 3, 5);
-- INSERT INTO ZONA_PRODUCTO (id_zona, id_vivero, id_producto) VALUES (4, 1, 2);
-- INSERT INTO ZONA_PRODUCTO (id_zona, id_vivero, id_producto) VALUES (1, 2, 4);
-- -- Tabla Empleado
CREATE TABLE EMPLEADO (
  id_empleado SERIAL PRIMARY KEY,
  dni VARCHAR(9) UNIQUE NOT NULL,
  CONSTRAINT dni_valido CHECK (dni ~ '^[0-9]{8}[A-Z]$'),
  nombre VARCHAR(100) NOT NULL CHECK (nombre <> ''),
  apellidos VARCHAR(100) NOT NULL CHECK (apellidos <> ''),
  datos_bancarios VARCHAR(255) NOT NULL CHECK (datos_bancarios <> '')
);
-- INSERT INTO EMPLEADO (dni, nombre, apellidos, datos_bancarios) VALUES ('12345678A', 'Juan', 'Pérez Gómez', 'ES12345678901234567890');
-- INSERT INTO EMPLEADO (dni, nombre, apellidos, datos_bancarios) VALUES ('23456789B', 'María', 'López Rodríguez', 'ES09876543210987654321');
-- INSERT INTO EMPLEADO (dni, nombre, apellidos, datos_bancarios) VALUES ('34567890C', 'Pedro', 'Sánchez Ruiz', 'ES11223344556677889900');
-- INSERT INTO EMPLEADO (dni, nombre, apellidos, datos_bancarios) VALUES ('45678901D', 'Ana', 'Martín Fernández', 'ES22334455667788990011');
-- INSERT INTO EMPLEADO (dni, nombre, apellidos, datos_bancarios) VALUES ('56789012E', 'Luis', 'García Pérez', 'ES33445566778899001122');

-- Tabla Socio
CREATE TABLE SOCIO (
  id_socio INT PRIMARY KEY,
  dni VARCHAR(9) UNIQUE NOT NULL,
  nombre VARCHAR(100) NOT NULL CHECK (nombre <> ''),
  apellidos VARCHAR(100) NOT NULL CHECK (apellidos <> ''),
  datos_bancarios VARCHAR(34) NOT NULL CHECK (datos_bancarios <> ''), -- 34 para poner datos del estilo IBAN, de formato largo 
  CONSTRAINT dni_valido CHECK (dni ~ '^[0-9]{8}[A-Z]$')
);
-- INSERT INTO SOCIO (id, dni, nombre, apellidos, mes, volumen, descuento) VALUES (1, '12345678A', 'Juan', 'Pérez Gómez', 'enero', 1500.00, 10.00);
-- INSERT INTO SOCIO (id, dni, nombre, apellidos, mes, volumen, descuento) VALUES (2, '23456789B', 'María', 'López Rodríguez', 'febrero', 2000.50, 15.00);
-- INSERT INTO SOCIO (id, dni, nombre, apellidos, mes, volumen, descuento) VALUES (3, '34567890C', 'Pedro', 'Sánchez Ruiz', 'marzo', 500.25, 5.00);
-- INSERT INTO SOCIO (id, dni, nombre, apellidos, mes, volumen, descuento) VALUES (4, '45678901D', 'Ana', 'Martín Fernández', 'abril', 1000.00, 20.00);
-- INSERT INTO SOCIO (id, dni, nombre, apellidos, mes, volumen, descuento) VALUES (5, '56789012E', 'Luis', 'García Pérez', 'mayo', 750.75, 12.50);

-- -- Tabla Pedido
CREATE TABLE PEDIDO (
  id_pedido INT PRIMARY KEY,
  id_empleado INT,
  id_socio INT,
  fecha DATE NOT NULL CHECK (fecha <= CURRENT_DATE),
  importe_total DECIMAL(10, 2) NOT NULL CHECK (importe_total >= 0),

  FOREIGN KEY (id_empleado) REFERENCES EMPLEADO(id_empleado) ON DELETE RESTRICT ON UPDATE RESTRICT,
  FOREIGN KEY (id_socio) REFERENCES SOCIO(id_socio) ON DELETE
  SET NULL ON UPDATE CASCADE
);
-- INSERT INTO PEDIDO (id, id_empleado, id_socio, fecha, importe_total) VALUES (1, 1, 2, '2024-10-01', 150.75);
-- INSERT INTO PEDIDO (id, id_empleado, id_socio, fecha, importe_total) VALUES (2, 2, 1, '2024-10-15', 200.00);
-- INSERT INTO PEDIDO (id, id_empleado, id_socio, fecha, importe_total) VALUES (3, 1, 3, '2024-10-20', 75.50);
-- INSERT INTO PEDIDO (id, id_empleado, id_socio, fecha, importe_total) VALUES (4, 3, 2, '2024-10-10', 300.00);
-- INSERT INTO PEDIDO (id, id_empleado, id_socio, fecha, importe_total) VALUES (5, 2, 4, '2024-10-25', 120.20);

-- Tabla Trabaja
CREATE TABLE TRABAJA (
  id_empleado INT,
  id_local INT,
  id_zona INT,
  provincia VARCHAR(100) NOT NULL,
  ciudad VARCHAR(100) NOT NULL,
  calle VARCHAR(100) NOT NULL,
  fecha_inicio DATE,
  fecha_final DATE,
  horario TIME[],

  PRIMARY KEY(id_empleado,fecha_inicio, horario),
  FOREIGN KEY (id_empleado) REFERENCES EMPLEADO(id_empleado) ON DELETE CASCADE ON UPDATE CASCADE,
  -- PRIMARY KEY(id_zona, id_local, provincia, ciudad, calle),
  -- Si se borra un empleado, se elimina su historial
  FOREIGN KEY (id_zona, id_local, provincia, ciudad, calle) REFERENCES ZONA(id_zona, id_local, provincia, ciudad, calle) ON DELETE
  SET NULL ON UPDATE CASCADE -- Si se cambia el id de Zona, se actualiza en Trabaja
);
-- INSERT INTO TRABAJA (id_empleado, id_vivero, id_zona, epoca, año, tarea) VALUES (1, 3, 1, 'primavera', 2024, 'Mantenimiento de almacén');
-- INSERT INTO TRABAJA (id_empleado, id_vivero, id_zona, epoca, año, tarea) VALUES (2, 3, 2, 'verano', 2024, 'Riego en zona abierta');
-- INSERT INTO TRABAJA (id_empleado, id_vivero, id_zona, epoca, año, tarea) VALUES (1, 3, 3, 'otoño', 2023, 'Cuidado de arboleda');
-- INSERT INTO TRABAJA (id_empleado, id_vivero, id_zona, epoca, año, tarea) VALUES (3, 1, 4, 'invierno', 2023, 'Siembra de macetas');
-- INSERT INTO TRABAJA (id_empleado, id_vivero, id_zona, epoca, año, tarea) VALUES (2, 2, 1, 'primavera', 2024, 'Organización del almacén');

-- Tabla Contiene
CREATE TABLE PEDIDO_PRODUCTO (
  id_producto INT,
  id_pedido INT,
  unidades INT CHECK (unidades > 0),
  PRIMARY KEY(id_producto, id_pedido),
  -- Llave compuesta para evitar duplicidad
  FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto) ON DELETE CASCADE ON UPDATE CASCADE,
  -- Si se cambia el id del producto, se actualiza en Contiene
  FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido) ON DELETE CASCADE ON UPDATE CASCADE -- Si se cambia el id del pedido, se actualiza en Contiene
);
-- INSERT INTO PEDIDO_PRODUCTO (id_producto, id_pedido, unidades) VALUES (1, 1, 5);
-- INSERT INTO PEDIDO_PRODUCTO (id_producto, id_pedido, unidades) VALUES (2, 1, 10);
-- INSERT INTO PEDIDO_PRODUCTO (id_producto, id_pedido, unidades) VALUES (3, 2, 7);
-- INSERT INTO PEDIDO_PRODUCTO (id_producto, id_pedido, unidades) VALUES (1, 3, 2);
-- INSERT INTO PEDIDO_PRODUCTO (id_producto, id_pedido, unidades) VALUES (4, 4, 8);


---------------------------------------------------------------------------------------------------------------
----------------------------------------------------TABLAS NUEVAS ---------------------------------------------
---------------------------------------------------------------------------------------------------------------

-- Tabla libre
CREATE TABLE LIBRE (
  id_empleado INT NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_final DATE NOT NULL CHECK (fecha_final > fecha_inicio),
  motivo VARCHAR(100) NOT NULL CHECK (motivo <> ''),
  baja BOOLEAN NOT NULL,

  PRIMARY KEY(fecha_inicio),

  FOREIGN KEY(id_empleado) REFERENCES EMPLEADO(id_empleado)

);

-- Table sobremesa
CREATE TABLE SOBREMESA (
  id_producto INT NOT NULL,
  caja VARCHAR(100) NOT NULL CHECK (caja <> ''),
  refrigeracion VARCHAR(100) NOT NULL CHECK (refrigeracion <> ''),
  placa_base VARCHAR(100) NOT NULL CHECK (placa_base <> ''),
  fuente VARCHAR(100) NOT NULL CHECK (fuente <> ''),

  PRIMARY KEY(id_producto),

  FOREIGN KEY(id_producto) REFERENCES PRODUCTO(id_producto)

);


-- Table portatiles 
CREATE TABLE PORTATILES(
  id_producto INT NOT NULL,
  bateria VARCHAR(100) NOT NULL CHECK (bateria <> ''),
  pulgadas VARCHAR(100) NOT NULL CHECK (pulgadas <> ''),

  PRIMARY KEY(id_producto),

  FOREIGN KEY(id_producto) REFERENCES PRODUCTO(id_producto)

);


-- Table dispositivos_moviles
CREATE TABLE DISPOSITIVOS_MOVILES(
  id_producto INT NOT NULL,
  bateria VARCHAR(100) NOT NULL CHECK (bateria<> ''),
  pulgadas VARCHAR(100) NOT NULL CHECK (pulgadas <> ''),
  camara VARCHAR(100) NOT NULL CHECK (camara <> ''),

  PRIMARY KEY(id_producto),

  FOREIGN KEY(id_producto) REFERENCES PRODUCTO(id_producto)

);

-- Table consola
CREATE TABLE CONSOLA(
  id_producto INT NOT NULL,
  portable BOOLEAN NOT NULL,

  PRIMARY KEY(id_producto),
  FOREIGN KEY(id_producto) REFERENCES PRODUCTO(id_producto)

);

-- -- Trigger 1: Verificar que un empleado está en la tabla TRABAJA antes de insertarlo en LIBRE
-- CREATE OR REPLACE FUNCTION verificar_empleado_en_trabaja()
-- RETURNS TRIGGER AS $$
-- BEGIN
--     IF NOT EXISTS (
--         SELECT 1
--         FROM TRABAJA
--         WHERE id_empleado = NEW.id_empleado
--     ) THEN
--         RAISE EXCEPTION 'El empleado debe estar registrado en la tabla TRABAJA para poder estar en LIBRE';
--     END IF;
--     RETURN NEW;
-- END;
-- $$ LANGUAGE plpgsql;
-- 
-- CREATE TRIGGER trigger_verificar_empleado_en_trabaja
-- BEFORE INSERT ON LIBRE
-- FOR EACH ROW
-- EXECUTE FUNCTION verificar_empleado_en_trabaja();
-- 
-- -- Trigger 2: Verificar que las fechas en TRABAJA no se solapan con las fechas en LIBRE
-- CREATE OR REPLACE FUNCTION verificar_franjas_libre_trabaja()
-- RETURNS TRIGGER AS $$
-- BEGIN
--     IF EXISTS (
--         SELECT 1
--         FROM LIBRE
--         WHERE id_empleado = NEW.id_empleado
--           AND NEW.fecha_inicio <= fecha_final
--           AND NEW.fecha_final >= fecha_inicio
--     ) THEN
--         RAISE EXCEPTION 'El empleado tiene un período de vacaciones que se solapa con la franja de trabajo';
--     END IF;
--     RETURN NEW;
-- END;
-- $$ LANGUAGE plpgsql;
-- 
-- CREATE TRIGGER trigger_verificar_franjas_libre_trabaja
-- BEFORE INSERT ON TRABAJA
-- FOR EACH ROW
-- EXECUTE FUNCTION verificar_franjas_libre_trabaja();
-- 
-- -- Trigger 3: Verificar que un empleado no está de vacaciones o fuera de horario al asignarle un PEDIDO
-- CREATE OR REPLACE FUNCTION verificar_empleado_pedido()
-- RETURNS TRIGGER AS $$
-- BEGIN
--     -- Verificar si el empleado está en LIBRE durante la fecha del pedido
--     IF EXISTS (
--         SELECT 1
--         FROM LIBRE
--         WHERE id_empleado = NEW.id_empleado
--           AND NEW.fecha BETWEEN fecha_inicio AND fecha_final
--     ) THEN
--         RAISE EXCEPTION 'El empleado está de vacaciones y no puede asignarse al pedido';
--     END IF;
-- 
--     -- Verificar si el empleado está trabajando en TRABAJA durante la fecha del pedido
--     IF NOT EXISTS (
--         SELECT 1
--         FROM TRABAJA
--         WHERE id_empleado = NEW.id_empleado
--           AND NEW.fecha BETWEEN fecha_inicio AND COALESCE(fecha_final, NEW.fecha)
--     ) THEN
--         RAISE EXCEPTION 'El empleado no está trabajando durante la fecha del pedido';
--     END IF;
-- 
--     RETURN NEW;
-- END;
-- $$ LANGUAGE plpgsql;
-- 
-- CREATE TRIGGER trigger_verificar_empleado_pedido
-- BEFORE INSERT ON PEDIDO
-- FOR EACH ROW
-- EXECUTE FUNCTION verificar_empleado_pedido();
-- 
