-- Insertar un usuario
DELIMITER //
create procedure spInsertUsuario(IN u_email VARCHAR(80),IN u_password TEXT,IN u_salt TEXT, IN u_state VARCHAR(15),
IN u_create_date DATE, IN fkrol INT, IN fkempleado INT)
begin 
		insert into tbl_usuario(usu_correo,usu_contrasena,usu_salt,usu_estado,usu_fecha_creacion,tbl_rol_rol_id,
		tbl_empleado_emp_id)
        values(u_email,u_password,u_salt,u_state,u_create_date,fkrol,fkempleado);
end //
DELIMITER ;

-- Actualizar usuario
DELIMITER //
create procedure spUpdateUsuario(IN u_id INT,IN u_email VARCHAR(80),IN u_password TEXT,IN u_salt TEXT, IN u_state VARCHAR(15),
IN u_create_date DATE, IN fkrol INT, IN fkempleado INT)
begin 
		update tbl_usuario 
        set usu_correo = u_email,usu_contrasena=u_password,usu_salt=u_salt,usu_estado=u_state,usu_fecha_creacion=u_create_date,
        tbl_rol_rol_id=fkrol,tbl_empleado_emp_id=fkempleado where usu_id = u_id;
end //
DELIMITER ;

-- Mostrar todos los uauarios
DELIMITER // 
create procedure spSelectUsuarios()
begin
		select usu_id,usu_correo,usu_contrasena,usu_salt,usu_estado,usu_fecha_creacion,tbl_rol_rol_id,tbl_rol.rol_nombre,
        tbl_empleado_emp_id,tbl_empleado.emp_nombres from tbl_usuario
		INNER JOIN tbl_rol
				ON tbl_usuario.tbl_rol_rol_id = tbl_rol.rol_id
                INNER JOIN tbl_empleado
                ON tbl_usuario.tbl_empleado_emp_id = tbl_empleado.emp_id;
                
end //
DELIMITER ;

-- Eliminar un usuario
DELIMITER //
create procedure spDeleteUsuario(IN u_id INT)
begin 
		delete from tbl_usuario where usu_id = u_id;
end //
DELIMITER ;

-- Selecciona un usuario por su correo
DELIMITER //
CREATE PROCEDURE spSelectUserMail(IN p_mail VARCHAR(80))
BEGIN
	select usu_correo, usu_contrasena,usu_salt,usu_estado,tbl_rol.rol_id,tbl_rol.rol_nombre,
    tbl_rol.rol_descripcion,tbl_permiso.per_id,tbl_permiso.per_nombre,tbl_permiso.per_descripcion
	from tbl_usuario
    inner join tbl_rol
    on tbl_rol.rol_id = tbl_usuario.tbl_rol_rol_id 
    inner join tbl_permiso_rol
    on tbl_rol.rol_id = tbl_permiso_rol.tbl_rol_rol_id
    inner join tbl_permiso
    on tbl_permiso_rol.tbl_permiso_per_id = tbl_permiso.per_id
	where usu_correo = p_mail;
END//
DELIMITER ;

-- Muestra cuantos usuarios existen 
DELIMITER //
CREATE PROCEDURE spSelectCountUsers(OUT total_usuarios INT)
BEGIN
	SELECT COUNT(usu_id) INTO total_usuarios
    FROM tbl_usuario;
END//
DELIMITER ;