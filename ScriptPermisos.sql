-- Insertar un permiso
DELIMITER //
create procedure spInsertPermission(IN p_nombre VARCHAR(45), IN p_descripcion VARCHAR(80))
begin 
		insert into tbl_permiso(per_nombre,per_descripcion)
        values(p_nombre, p_descripcion);
end//
DELIMITER ;

-- Actualizar permiso
DELIMITER //
create procedure spUpdatePermission(IN p_id INT,IN p_nombre VARCHAR(45), IN p_descripcion VARCHAR(80))
begin 
		update tbl_permiso
        set per_nombre = p_nombre, per_descripcion = p_descripcion where per_id = p_id;
end//
DELIMITER ;

-- Mostrar permisos
DELIMITER //
create procedure spSelectPermission()
begin 
		select per_id, per_nombre, per_descripcion from tbl_permiso;
end//
DELIMITER ;

-- Selecciona unicamente el id y el nombre del permiso
DELIMITER //
CREATE PROCEDURE spSelectPermissionDDL()
BEGIN
	select per_id,per_nombre
    from tbl_permiso;
END//
DELIMITER ;

-- Eliminar permisos
DELIMITER //
create procedure spDeletePermission(IN p_id INT)
begin 
		delete from tbl_permiso where per_id = p_id;
end//
DELIMITER ; 




        