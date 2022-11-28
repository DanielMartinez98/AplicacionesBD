DELIMITER //
CREATE PROCEDURE crearClaseEstudiante(IN in_idEstudiante int(50), IN in_idClase int(50))
BEGIN

DECLARE claseExists INT(50);
SELECT COUNT(*) INTO claseExists FROM Clases WHERE id_clase = in_idClase;
IF claseExists > 0 THEN
    INSERT INTO Clases_Estudiantes(id_clase, id_estudiante, administrador) VALUES (in_idClase,in_idEstudiante,1);
    SELECT "Joined Class" AS response;
ELSE
    SELECT "No existe clase" AS response;
END IF;

END //
DELIMITER ;
