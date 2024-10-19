-- Selecciona unicamente el id y el nombre de los provedores
DELIMITER //
CREATE PROCEDURE spSelectProveedorDDL()
BEGIN
	select prov_id,prov_nombre
    from tbl_proveedor;
END//
DELIMITER ;
-- crear proveedor
DELIMITER //
create procedure spInsertProveedor(IN p_nit VARCHAR(45),IN p_nombre VARCHAR(45))
begin
	insert into tbl_proveedor(prov_nit,prov_nombre) 
    values(p_nit,p_nombre);
end//
DELIMITER ;

--actualizar proveedor
DELIMITER //
create procedure spUpdateProveedor(IN p_id INT,p_nit VARCHAR(45),IN p_nombre VARCHAR(45))

begin
	update tbl_proveedor
    set prov_nit = p_nit,prov_nombre = p_nombre
    where prov_id = p_id;

end//
DELIMITER ;

--mostrar proveedores
DELIMITER //
create procedure spSelectproveedor()
begin
	select prov_id,prov_nit,prov_nombre
    from tbl_proveedor;
    end//
DELIMITER ;

--eliminar proveedor

DELIMITER //
create procedure spDeleteproveedor(IN p_id INT)
begin
	delete from tbl_proveedor where prov_id = p_id;
end//
DELIMITER ;