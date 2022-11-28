DELIMITER //
CREATE PROCEDURE agregarTarea(IN in_nombreTarea varchar(500), in_fecha date,in_descripcion varchar(500),in_idClase int(50))
BEGIN

DECLARE tempIDTarea INT(50);
INSERT INTO Tareas(id_clase, nombre, fecha_entrega, descripcion) VALUES(in_idClase, in_nombreTarea, in_fecha, in_descripcion);
SELECT MAX(id_tarea) INTO tempIDTarea FROM Tareas;
SELECT id_estudiante, tempIDTarea AS idTarea FROM Clases_Estudiantes WHERE id_clase =  in_idClase;

END //
DELIMITER ;