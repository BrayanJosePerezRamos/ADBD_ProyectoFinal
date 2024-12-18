CREATE TYPE TIPO_PRODUCTO AS ENUM('sobremesa', 'portatil','dispositivos moviles', 'consolas');
CREATE TYPE TIPO_ZONA AS ENUM('almacen', 'tienda','reparacion');

-- Tabla local
CREATE TABLE LOCAL (
  id_local INT,
  provincia VARCHAR(100) NOT NULL CHECK (provincia <> ''),
  ciudad VARCHAR(100) NOT NULL CHECK (ciudad <> ''),
  calle VARCHAR(100) NOT NULL CHECK (calle <> ''),
  nombre VARCHAR(100) NOT NULL CHECK (nombre <> ''),
  PRIMARY KEY(id_local, provincia, ciudad, calle)
);

-- Tabla Zona
CREATE TABLE ZONA (
  id_zona INT NOT NULL,
  id_local INT NOT NULL,
  provincia VARCHAR(100) NOT NULL,
  ciudad VARCHAR(100) NOT NULL,
  calle VARCHAR(100) NOT NULL,
  tipo TIPO_ZONA NOT NULL,
  PRIMARY KEY(id_zona, id_local, provincia, ciudad, calle),
  FOREIGN KEY (id_local, provincia, ciudad, calle) REFERENCES LOCAL(id_local, provincia, ciudad, calle)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

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

-- Zona contiene producto 
CREATE TABLE ZONA_PRODUCTO (
  id_local INT NOT NULL,
  id_zona INT NOT NULL,
  id_producto INT UNIQUE NOT NULL,
  provincia VARCHAR(100) NOT NULL,
  ciudad VARCHAR(100) NOT NULL,
  calle VARCHAR(100) NOT NULL,
  PRIMARY KEY(id_local, id_zona, id_producto ,provincia, ciudad, calle),

  FOREIGN KEY (id_zona, id_local, provincia, ciudad, calle) REFERENCES ZONA(id_zona, id_local, provincia, ciudad, calle) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabla Empleado
CREATE TABLE EMPLEADO (
  id_empleado INT PRIMARY KEY CHECK (id_empleado > 0),
  dni VARCHAR(9) UNIQUE NOT NULL,
  CONSTRAINT dni_valido CHECK (dni ~ '^[0-9]{8}[A-Z]$'),
  nombre VARCHAR(100) NOT NULL CHECK (nombre <> ''),
  apellidos VARCHAR(100) NOT NULL CHECK (apellidos <> ''),
  datos_bancarios VARCHAR(255) NOT NULL CHECK (datos_bancarios <> '')
);

-- Tabla Socio
CREATE TABLE SOCIO (
  id_socio INT PRIMARY KEY,
  dni VARCHAR(9) UNIQUE NOT NULL,
  nombre VARCHAR(100) NOT NULL CHECK (nombre <> ''),
  apellidos VARCHAR(100) NOT NULL CHECK (apellidos <> ''),
  datos_bancarios VARCHAR(60) NOT NULL CHECK (datos_bancarios <> ''), -- 34 para poner datos del estilo IBAN, de formato largo 
  CONSTRAINT dni_valido CHECK (dni ~ '^[0-9]{8}[A-Z]$')
);

-- Tabla Pedido
CREATE TABLE PEDIDO (
  id_pedido INT PRIMARY KEY,
  id_empleado INT,
  id_socio INT,
  fecha DATE NOT NULL CHECK (fecha <= CURRENT_DATE),
  importe_total DECIMAL(10, 2) NOT NULL CHECK (importe_total >= 0) DEFAULT 0,

  FOREIGN KEY (id_empleado) REFERENCES EMPLEADO(id_empleado) ON DELETE RESTRICT ON UPDATE RESTRICT,
  FOREIGN KEY (id_socio) REFERENCES SOCIO(id_socio) ON DELETE
  SET NULL ON UPDATE CASCADE
);

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
  CASCADE ON UPDATE CASCADE -- Si se cambia el id de Zona, se actualiza en Trabaja
);

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

---------------------------------------------------------------------------------------------------------------
----------------------------------------------------TABLAS HERENCIA--------------------------------------------
---------------------------------------------------------------------------------------------------------------

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

-- Trigger 1: Verificar que un empleado está en la tabla TRABAJA antes de insertarlo en LIBRE
CREATE OR REPLACE FUNCTION verificar_empleado_en_trabaja()
RETURNS TRIGGER AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM TRABAJA
        WHERE id_empleado = NEW.id_empleado
    ) THEN
        RAISE EXCEPTION 'El empleado debe estar registrado en la tabla TRABAJA para poder estar en LIBRE';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_verificar_empleado_en_trabaja
BEFORE INSERT ON LIBRE
FOR EACH ROW
EXECUTE FUNCTION verificar_empleado_en_trabaja();

-- Trigger 2: Verificar que las fechas en TRABAJA no se solapan con las fechas en LIBRE
CREATE OR REPLACE FUNCTION verificar_franjas_libre_trabaja()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM LIBRE
        WHERE id_empleado = NEW.id_empleado
          AND NEW.fecha_inicio <= fecha_final
          AND NEW.fecha_final >= fecha_inicio
    ) THEN
        RAISE EXCEPTION 'El empleado tiene un período de vacaciones que se solapa con la franja de trabajo';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_verificar_franjas_libre_trabaja
BEFORE INSERT ON TRABAJA
FOR EACH ROW
EXECUTE FUNCTION verificar_franjas_libre_trabaja();

-- Trigger 3: Verificar que un empleado no está de vacaciones o fuera de horario al asignarle un PEDIDO
CREATE OR REPLACE FUNCTION verificar_empleado_pedido()
RETURNS TRIGGER AS $$
BEGIN
    -- Verificar si el empleado está en LIBRE durante la fecha del pedido
    IF EXISTS (
        SELECT 1
        FROM LIBRE
        WHERE id_empleado = NEW.id_empleado
          AND NEW.fecha BETWEEN fecha_inicio AND fecha_final
    ) THEN
        RAISE EXCEPTION 'El empleado está de vacaciones y no puede asignarse al pedido';
    END IF;

    -- Verificar si el empleado está trabajando en TRABAJA durante la fecha del pedido
    IF NOT EXISTS (
        SELECT 1
        FROM TRABAJA
        WHERE id_empleado = NEW.id_empleado
          AND NEW.fecha BETWEEN fecha_inicio AND COALESCE(fecha_final, NEW.fecha)
    ) THEN
        RAISE EXCEPTION 'El empleado no está trabajando durante la fecha del pedido';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_verificar_empleado_pedido
BEFORE INSERT ON PEDIDO
FOR EACH ROW
EXECUTE FUNCTION verificar_empleado_pedido();

-- Trigger 4: Calcular coste total del pedido
CREATE OR REPLACE FUNCTION calcular_importe_total()
RETURNS TRIGGER AS $$
BEGIN
    -- Actualizar el importe total del pedido
    UPDATE PEDIDO
    SET importe_total = (
        SELECT SUM(pp.unidades * p.precio_unidad)
        FROM PEDIDO_PRODUCTO pp
        INNER JOIN PRODUCTO p ON pp.id_producto = p.id_producto
        WHERE pp.id_pedido = NEW.id_pedido
    )
    WHERE id_pedido = NEW.id_pedido;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear el trigger
CREATE TRIGGER trig_actualizar_importe_total
AFTER INSERT OR UPDATE ON PEDIDO_PRODUCTO
FOR EACH ROW
EXECUTE FUNCTION calcular_importe_total();
