-- Insertar un usuario
DELIMITER //
create procedure spInsertUsuario(IN u_email VARCHAR(80),IN u_password TEXT,IN u_salt TEXT, IN u_state VARCHAR(15),
IN u_create_date DATE, IN fkrol INT, IN fkempleado INT, IN fkcliente INT)
begin 
		insert into tbl_usuario(usu_correo,usu_contrasena,usu_salt,usu_estado,usu_fecha_creacion,tbl_rol_rol_id,
		tbl_empleado_emp_id,tbl_cliente_cli_id)
        values(u_email,u_password,u_salt,u_state,u_create_date,fkrol,fkempleado,fkcliente);
end //
DELIMITER ;

-- Actualizar usuario
DELIMITER //
create procedure spUpdateUsuario(IN u_id INT,IN u_email VARCHAR(80),IN u_password TEXT,IN u_salt TEXT, IN u_state VARCHAR(15),
IN u_create_date DATE, IN fkrol INT, IN fkempleado INT, IN fkcliente INT)
begin 
		update tbl_usuario 
        set usu_correo = u_email,usu_contrasena=u_password,usu_salt=u_salt,usu_estado=u_state,usu_fecha_creacion=u_create_date,
        tbl_rol_rol_id=fkrol,tbl_empleado_emp_id=fkempleado,tbl_cliente_cli_id=fkcliente where usu_id = u_id;
end //
DELIMITER ;

-- Mostrar todos los uauarios
DELIMITER // 
create procedure spSelectUsuarios()
begin
		select usu_id,usu_correo,usu_contrasena,usu_salt,usu_estado,usu_fecha_creacion,tbl_rol_rol_id,tbl_rol.rol_nombre,
        tbl_empleado_emp_id,tbl_empleado.emp_nombres,tbl_cliente_cli_id,tbl_cliente.cli_nombres from tbl_usuario
		INNER JOIN tbl_rol
				ON tbl_usuario.tbl_rol_rol_id = tbl_rol.rol_id
                INNER JOIN tbl_empleado
                ON tbl_usuario.tbl_empleado_emp_id = tbl_empleado.emp_id
                INNER JOIN tbl_cliente
                ON tbl_usuario.tbl_cliente_cli_id = tbl_cliente.cli_id;
end //
DELIMITER ;

-- Eliminar un usuario
DELIMITER //
create procedure spDeleteUsuario(IN u_id INT)
begin 
		delete from tbl_usuario where usu_id = u_id;
end //
DELIMITER ;
                
                
		