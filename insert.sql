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

