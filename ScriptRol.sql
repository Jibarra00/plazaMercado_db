-- Selecciona unicamente el id y el nombre deL rol
DELIMITER //
CREATE PROCEDURE spSelectRolDDL()
BEGIN
	select rol_id,rol_nombre
    from tbl_rol;
END//
DELIMITER ;

-- insertar rol
DELIMITER //
create procedure spInsertRol(IN r_nombre VARCHAR(45),IN r_descripcion VARCHAR(80))

begin
	insert into tbl_rol(rol_nombre,rol_descripcion)
    values(r_nombre,r_descripcion);
end//
DELIMITER ;

-- actualizar rol
DELIMITER //
create procedure spUpdateRol(IN r_id INT,IN r_nombre VARCHAR(45),IN r_descripcion VARCHAR(80))
begin
	update tbl_rol
    set rol_nombre = r_nombre,rol_descripcion = r_descripcion
    where rol_id = r_id;
end//
DELIMITER ;

-- mostrar todos los roles
DELIMITER //
create procedure spSelectRol()
begin
	select rol_id,rol_nombre,rol_descripcion
    from tbl_rol;
    
end//
DELIMITER ;

-- eliminar rol
DELIMITER //
create procedure spDeleteRol(IN r_id INT)
begin
	delete from tbl_rol where rol_id = r_id;
end//
DELIMITER ;