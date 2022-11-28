DELIMITER //
CREATE PROCEDURE agregarWhatsapp(IN in_idClase int(50), IN in_telefono varchar(500))
BEGIN

DECLARE isVerifiedStudent INT(50);
DECLARE verifiedStudentID INT(50);
DECLARE isVerifiedGuest INT(50);
DECLARE verifiedGuestID INT(50);
DECLARE idNewGuest INT(50);
SELECT COUNT(*) INTO isVerifiedStudent FROM Estudiantes WHERE telefono = in_telefono;
IF isVerifiedStudent>0 THEN
    SELECT id_estudiante INTO verifiedStudentID FROM Estudiantes WHERE telefono = in_telefono;
    INSERT INTO Clases_Estudiantes(id_clase, id_estudiante, administrador) VALUES (in_idClase,verifiedStudentID,1);
ELSE
    SELECT COUNT(*) INTO isVerifiedGuest FROM Invitados WHERE telefono = in_telefono;
    IF isVerifiedGuest>0 THEN
        SELECT id_invitado INTO verifiedGuestID FROM Invitados WHERE telefono = in_telefono;
        INSERT INTO Invitados_Clases(id_invitado, id_clase) VALUES (verifiedGuestID, in_idClase);
    ELSE
        INSERT INTO Invitados(telefono) VALUES (in_telefono);
        SELECT id_invitado INTO idNewGuest FROM Invitados WHERE telefono = in_telefono;
        INSERT INTO Invitados_Clases(id_invitado, id_clase) VALUES (idNewGuest, in_idClase);
    END IF;
END IF; 

END //
DELIMITER ;