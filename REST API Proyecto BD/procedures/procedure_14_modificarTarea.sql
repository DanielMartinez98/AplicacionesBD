DELIMITER //
CREATE PROCEDURE modificarTarea(IN in_idTarea int(50), IN in_nombre varchar(500), IN in_fecha date, IN in_descripcion varchar(500))
BEGIN

UPDATE Tareas SET nombre=in_nombre, fecha_entrega = in_fecha, descripcion = in_descripcion WHERE id_tarea=in_idTarea;
SELECT 'Tarea actualizada' AS estatus;

END //
DELIMITER ;