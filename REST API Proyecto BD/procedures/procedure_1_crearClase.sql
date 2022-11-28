DELIMITER //
CREATE PROCEDURE crearClase(IN in_idEstudiante int(50), IN in_nombreClase varchar(500), OUT out_idClase int(50) )
BEGIN

DECLARE newIdClase INT(50);
INSERT INTO Clases(nombre) VALUES (in_nombreClase);
SELECT MAX(id_clase) INTO newIdClase FROM Clases;
INSERT INTO Clases_Estudiantes(id_clase, id_estudiante, administrador) VALUES (newIdClase,in_idEstudiante,3);
SET out_idClase = newIdClase;

END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE crearClase(IN in_idEstudiante int(50), IN in_nombreClase varchar(500))
BEGIN

DECLARE out_idClase INT(50);
INSERT INTO Clases(nombre) VALUES (in_nombreClase);
SELECT MAX(id_clase) INTO out_idClase FROM Clases;
INSERT INTO Clases_Estudiantes(id_clase, id_estudiante, administrador) VALUES (out_idClase,in_idEstudiante,3);
SELECT out_idClase AS 'newClassID';

END //
DELIMITER ;
