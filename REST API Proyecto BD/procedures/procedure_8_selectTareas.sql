DELIMITER //
CREATE PROCEDURE selectTareas(IN in_idEstudiante int(50))
BEGIN

SELECT id_estudiante, Estudiantes_Tareas.id_tarea, Tareas.nombre, Tareas.id_clase, Clases.nombre, date_format(fecha_entrega,'%d/%m/%Y') AS fecha_entrega, descripcion, estatus
FROM Estudiantes_Tareas
INNER JOIN Tareas ON Estudiantes_Tareas.id_tarea = Tareas.id_tarea 
INNER JOIN Clases ON Tareas.id_clase = Clases.id_clase
WHERE id_estudiante = in_idEstudiante;

END //
DELIMITER ;