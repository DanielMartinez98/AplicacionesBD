DELIMITER //
CREATE PROCEDURE borrarWhatsapp(IN in_idClase int(50), IN in_telefono varchar(500))
BEGIN

DECLARE isVerifiedStudent INT(50);
DECLARE verifiedStudentID INT(50);
DECLARE isVerifiedGuest INT(50);
DECLARE verifiedGuestID INT(50);
DECLARE idNewGuest INT(50);
SELECT COUNT(*) INTO isVerifiedStudent FROM Estudiantes WHERE telefono = in_telefono;
IF isVerifiedStudent>0 THEN
    SELECT id_estudiante INTO verifiedStudentID FROM Estudiantes WHERE telefono = in_telefono;
    DELETE FROM Clases_Estudiantes WHERE id_clase=in_idClase AND id_estudiante=verifiedStudentID;
ELSE
    SELECT COUNT(*) INTO isVerifiedGuest FROM Invitados WHERE telefono = in_telefono;
    IF isVerifiedGuest>0 THEN
        SELECT id_invitado INTO verifiedGuestID FROM Invitados WHERE telefono = in_telefono;
        DELETE FROM Invitados_Clases WHERE id_clase=in_idClase AND id_invitado=verifiedGuestID;
    END IF;
END IF; 

END //
DELIMITER ;