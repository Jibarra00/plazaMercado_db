-- Insertar Pedidos
DELIMITER //
create procedure spInsertPedidos(IN p_date DATE, IN p_state VARCHAR(20),IN p_specification VARCHAR(1000),
IN fkcliente INT, IN fkproducto INT)
begin 
	insert into tbl_pedidos(ped_fecha,ped_estado,ped_especificacion,tbl_cliente_cli_id,tbl_producto_pro_id)
		values(p_date,p_state,p_specification,fkcliente,fkproducto);
end //
DELIMITER ;

-- Actualizar pedidos
DELIMITER //
create procedure spUpdatePedidos(IN p_id INT,IN p_date DATE, IN p_state VARCHAR(20),IN p_specification VARCHAR(1000),
IN fkcliente INT, IN fkproducto INT)
begin 
		update tbl_pedidos 
        set ped_fecha = p_date,ped_estado = p_state,ped_especificacion = p_specification,tbl_cliente_cli_id = fkcliente,
        tbl_producto_pro_id = fkproducto  where ped_id = p_id;
end //
DELIMITER ;

-- Mostrar pedidos
DELIMITER //
create procedure spSelectPedidos()
begin 
	 select ped_id,ped_fecha,ped_estado,ped_especificacion,tbl_cliente_cli_id,tbl_cliente.cli_nombres,tbl_producto_pro_id,
     tbl_producto.pro_descripcion from tbl_pedidos
     INNER JOIN tbl_cliente
		ON tbl_pedidos.tbl_cliente_cli_id = tbl_cliente.cli_id
        INNER JOIN tbl_producto
        ON tbl_pedidos.tbl_producto_pro_id = tbl_producto.pro_id;
end//
DELIMITER ;

-- Eliminar Pedidos
DELIMITER //
create procedure spDeletePedidos(IN p_id int)
begin 
		delete from tbl_pedidos where ped_id = p_id;
end//
DELIMITER ;





