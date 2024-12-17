
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
-- Invalid Tuples
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

