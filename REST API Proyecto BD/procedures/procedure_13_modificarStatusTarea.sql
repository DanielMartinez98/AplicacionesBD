DELIMITER //
CREATE PROCEDURE modificarStatusTarea(IN in_idEstudiante int(50), IN in_idTarea int(50), IN in_isComplete tinyint(1) )
BEGIN

UPDATE Estudiantes_Tareas SET estatus = in_isComplete WHERE id_estudiante = in_idEstudiante AND id_tarea = in_idTarea;
SELECT 'Estatus actualizado' AS estatus;

END //
DELIMITER ;