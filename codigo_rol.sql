--insertar rol
DELIMITER //
create procedure spInsertRol(IN r_nombre VARCHAR(45),IN r_description VARCHAR(80))

begin
	insert into tbl_rol(rol_nombre,rol_descripcion)
    values(r_nombre,r_description);
end//
DELIMITER ;

--actualizar rol
DELIMITER //
create procedure spUpdateRol(IN r_id INT,IN r_nombre VARCHAR(45),IN r_description VARCHAR(80))
begin
	update tbl_rol
    set rol_nombre = r_nombre,rol_descripcion = r_description
    where rol_id = r_id;
end//
DELIMITER ;

--mostrar todos los roles
DELIMITER //
create procedure spSelectrol()
begin
	select rol_id,rol_nombre,rol_descripcion
    from tbl_rol;
    
end//
DELIMITER ;

--eliminar rol
DELIMITER //
create procedure spDeleterol(IN _id INT)
begin
	delete from tbl_rol where rol_id = r_id;
end//
DELIMITER ;
