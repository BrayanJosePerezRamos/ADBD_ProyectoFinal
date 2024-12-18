-- Local
UPDATE LOCAL SET id_local = NULL WHERE id_local = 6; 
UPDATE LOCAL SET provincia = '' WHERE id_local = 7; 
UPDATE LOCAL SET ciudad = NULL WHERE id_local = 8; 
UPDATE LOCAL SET calle = '' WHERE id_local = 9; 
UPDATE LOCAL SET nombre = '' WHERE id_local = 10;

-- Socio
UPDATE SOCIO SET dni = '1234' WHERE id_socio = 1;
UPDATE SOCIO SET nombre = '' WHERE id_socio = 2; 
UPDATE SOCIO SET datos_bancarios = '' WHERE id_socio = 3;
UPDATE SOCIO SET id_socio = NULL WHERE dni = '12345678Z';
UPDATE SOCIO SET dni = '12345678X' WHERE dni = '12345678Z';
