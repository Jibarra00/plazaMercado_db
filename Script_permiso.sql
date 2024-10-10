-- Insertar un permiso
DELIMITER //
create procedure spInsertPermiso(IN p_name VARCHAR(45), IN p_description VARCHAR(80))
begin 
		insert into tbl_permiso(per_nombre,per_descripcion)
        values(p_name,p_description);
end//
DELIMITER ;

-- Actualizar permiso
DELIMITER //
create procedure spUpdatePermiso(IN p_id INT,IN p_name VARCHAR(45), IN p_description VARCHAR(80))
begin 
		update tbl_permiso
        set per_nombre = p_name,per_descripcion = p_description where per_id = p_id;
end//
DELIMITER ;

-- Mostrar permisos
DELIMITER //
create procedure spSelectPermiso()
begin 
		select per_id,per_nombre,per_descripcion from tbl_permiso;
end//
DELIMITER ;

-- Eliminar permisos
DELIMITER //
create procedure spDeletePermiso(IN p_id INT)
begin 
		delete from tbl_permiso where per_id = p_id;
end//
DELIMITER ; 


        