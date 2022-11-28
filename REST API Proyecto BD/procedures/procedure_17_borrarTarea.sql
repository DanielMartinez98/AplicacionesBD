DELIMITER //
CREATE PROCEDURE borrarTarea(in_idTarea int(50))
BEGIN

DELETE FROM Estudiantes_Tareas WHERE id_tarea = in_idTarea;
DELETE FROM Tareas WHERE id_tarea = in_idTarea;

END //
DELIMITER ;