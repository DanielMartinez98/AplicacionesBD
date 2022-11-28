DELIMITER //
CREATE PROCEDURE cambiarPassword(IN in_idEstudiante int(50), IN in_passwordVieja varchar(500), IN in_passwordNueva varchar(500))
BEGIN

DECLARE passwordValid INT(50);
SELECT COUNT(*) INTO passwordValid FROM Estudiantes WHERE id_estudiante = in_idEstudiante AND password=in_passwordVieja;
IF passwordValid > 0 THEN
    UPDATE Estudiantes SET password=in_passwordNueva WHERE id_estudiante = in_idEstudiante;
    SELECT "Password Changed" AS response;
ELSE
    SELECT "Wrong Password" AS response;
END IF;

END //
DELIMITER ;