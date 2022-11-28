DELIMITER //
CREATE PROCEDURE userLogin(IN in_emailEstudiante varchar(500), IN in_passwordEstudiante varchar(500))
BEGIN

DECLARE isUser INT(50);
SELECT COUNT(*) INTO isUser FROM Estudiantes WHERE mail = in_emailEstudiante AND password = in_passwordEstudiante;
IF isUser > 0 THEN 
    SELECT id_estudiante FROM Estudiantes WHERE mail=in_emailEstudiante AND password = in_passwordEstudiante;
ELSE
    SELECT -1 AS id_estudiante;
END IF;

END //
DELIMITER ;