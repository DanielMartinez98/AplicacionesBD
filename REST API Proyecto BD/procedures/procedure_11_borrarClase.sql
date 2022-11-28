DELIMITER //
CREATE PROCEDURE borrarClase(IN in_idClase int(50))
BEGIN

DECLARE classExists INT(50);
SELECT COUNT(*) INTO classExists FROM Clases WHERE id_clase = in_idClase;
IF classExists > 0 THEN
    DELETE FROM Clases_Estudiantes WHERE id_clase = in_idClase;
    DELETE FROM Invitados_Clases WHERE id_clase = in_idClase;
    DELETE FROM Tareas WHERE id_clase = in_idClase;
    DELETE FROM Clases WHERE id_clase = in_idClase;
    SELECT "Clase borrada" AS response;
ELSE
    SELECT "No existe esa clase" AS response;
END IF;


END //
DELIMITER ;