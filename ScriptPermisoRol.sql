-- Selecciona todos los Permisos Roles
DELIMITER //
CREATE PROCEDURE spSelectPermisoRol()
BEGIN
	select rol_permiso,tbl_rol_rol_id,tbl_rol.rol_nombre,tbl_permiso_per_id,
    tbl_permiso.per_nombre,per_rol_fecha_asignacion
    from tbl_permiso_rol
    inner join tbl_rol
    on tbl_rol.rol_id = tbl_permiso_rol.tbl_rol_rol_id
    inner join tbl_permiso
    on tbl_permiso.per_id = tbl_permiso_rol.tbl_permiso_per_id;
END//
DELIMITER ;

-- Insertar un Permiso Rol
DELIMITER //
CREATE PROCEDURE spInsertPermisoRol(IN p_rol_id INT, p_permiso_id INT,IN p_date DATE)
BEGIN
    insert into tbl_permiso_rol(tbl_rol_rol_id,tbl_permiso_per_id,per_rol_fecha_asignacion) values(p_rol_id,p_permiso_id,p_date);
END//
DELIMITER ;

-- Actualizar un Permiso Rol
DELIMITER //
create procedure spUpdatePermisoRol(IN p_rol_permiso INT, IN p_fkrol INT,IN p_fkpermiso INT,IN p_date DATE)
begin
	update tbl_permiso_rol
    set tbl_rol_rol_id = p_fkrol, tbl_permiso_per_id = p_fkpermiso, per_rol_fecha_asignacion = p_date
    where rol_permiso = p_rol_permiso;
end//
DELIMITER ;

-- Eliminar un permiso rol
DELIMITER //
create procedure spDeletePermisoRol(IN p_id INT)
begin
	delete from tbl_permiso_rol where rol_permiso = p_id;
end//
DELIMITER ;