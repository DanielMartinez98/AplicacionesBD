DELIMITER //
CREATE PROCEDURE agregarEstudianteTarea(in_idEstudiante int(50),in_idTarea int(50))
BEGIN

INSERT INTO Estudiantes_Tareas(id_estudiante, id_tarea, estatus) VALUES (in_idEstudiante, in_idTarea, 0); 

END //
DELIMITER ;