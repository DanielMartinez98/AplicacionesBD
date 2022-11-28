DELIMITER //
CREATE PROCEDURE modificarCuenta(IN in_idEstudiante int(50), IN in_nombre varchar(500), IN in_apellidoPaterno varchar(100), IN in_apellidoMaterno varchar(100), IN in_mail varchar(500), IN in_telefono varchar(500), IN in_password varchar(500), IN in_whatsapp tinyint(1))
BEGIN

UPDATE Estudiantes SET nombre = in_nombre, appellido_paterno=in_apellidoPaterno, appellido_materno=in_apellidoMaterno, mail=in_mail,telefono=in_telefono, password=in_password, whatsapp=in_whatsapp WHERE id_estudiante=in_idEstudiante;

END //
DELIMITER ;