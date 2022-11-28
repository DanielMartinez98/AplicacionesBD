DELIMITER //
CREATE PROCEDURE crearEstudiante(IN in_nombre varchar(500), IN in_apellidoPaterno varchar(100), IN in_apellidoMaterno varchar(100), IN in_mail varchar(500), IN in_telefono varchar(500), IN in_password varchar(500), IN in_whatsapp tinyint(1))
BEGIN

DECLARE emailValid INT(50);

SELECT COUNT(*) INTO emailValid FROM Estudiantes WHERE mail = in_mail;
IF emailValid > 0 THEN
    SELECT "Email already registered" AS response;
ELSE
INSERT INTO Estudiantes(nombre, appellido_paterno, appellido_materno, mail, telefono, password, whatsapp) VALUES (in_nombre, in_apellidoPaterno, in_apellidoMaterno, in_mail, in_telefono, in_password, in_whatsapp);
    SELECT "User Created" AS response;
END IF;

END //
DELIMITER ;

