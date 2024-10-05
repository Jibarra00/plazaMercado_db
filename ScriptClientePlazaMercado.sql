-- Insertar un cliente
DELIMITER //
create procedure spInsertClient(IN c_names VARCHAR(80),IN c_lastnames VARCHAR(80),
IN c_mail VARCHAR(80),IN c_phone VARCHAR(80),IN c_addres VARCHAR(45))
begin
	insert into tbl_cliente(cli_nombres,cli_apellidos,cli_correo,cli_telefono,
    cli_direccion) 
    values(c_names,c_lastnames,c_mail,c_phone,c_addres);
end//
DELIMITER ;

-- Actualizar un Empleado
DELIMITER //
create procedure spUpdateClient(IN c_id INT,IN c_names VARCHAR(80),IN c_lastnames VARCHAR(80),
IN c_mail VARCHAR(80),IN c_phone VARCHAR(80),IN e_addres VARCHAR(45))
begin
	update tbl_cliente
    set cli_nombres = c_names, cli_apellidos = c_lastnames,cli_correo = c_mail,cli_telefono = c_phone,
    cli_direccion = e_addres
    where cli_id = c_id;
end//
DELIMITER ;


-- Mostrar todos los clientes
DELIMITER //
create procedure spSelectClients()
begin
	select cli_id,cli_nombres,cli_apellidos,cli_correo,cli_telefono,cli_direccion
    from tbl_cliente;
    
end//
DELIMITER ;


-- Eliminar un cliente
DELIMITER //
create procedure spDeleteClient(IN c_id INT)
begin
	delete from tbl_cliente where cli_id = c_id;
end//
DELIMITER ;