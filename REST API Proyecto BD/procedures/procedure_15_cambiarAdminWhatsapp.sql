DELIMITER //
CREATE PROCEDURE CambiarAdministradorEstudiante(IN in_idClase int(50), IN in_telefono varchar(500),IN in_administrador int(2))
BEGIN
DECLARE isVerifiedStudent INT(50) DEFAULT 0;
SELECT Estudiantes.id_estudiante INTO isVerifiedStudent FROM Estudiantes,Clases_Estudiantes WHERE telefono = in_telefono AND Clases_Estudiantes.id_estudiante = Estudiantes.id_estudiante AND Clases_Estudiantes.id_clase = in_idClase;
IF isVerifiedStudent>0 THEN
    UPDATE Clases_Estudiantes SET administrador = in_administrador WHERE isVerifiedStudent = Clases_Estudiantes.id_estudiante;
    SELECT "1" AS response;
ELSE 
SELECT "0" AS response;
END IF; 

END //
DELIMITER ;