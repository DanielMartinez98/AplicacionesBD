DELIMITER //
CREATE PROCEDURE selectClases(IN in_idEstudiante int(50))
BEGIN

SELECT id_estudiante, Clases_Estudiantes.id_clase, nombre, administrador
FROM Clases_Estudiantes 
INNER JOIN Clases ON Clases_Estudiantes.id_clase = Clases.id_clase
WHERE id_estudiante = in_idEstudiante;

END //
DELIMITER ;