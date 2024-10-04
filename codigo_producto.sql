-- crear producto
DELIMITER //
create procedure spInsertProduct(IN p_code VARCHAR(45),IN p_description VARCHAR(100),
IN p_amount INT,IN p_price DECIMAL,IN p_fkprovider INT,IN p_fkcategory INT)
begin
	insert into tbl_producto(pro_codigo,pro_descripcion,pro_cantidad,pro_precio,
    tbl_proveedor_prov_id,tbl_categoria_cat_id) 
    values(p_code,p_description,p_amount,p_price,p_fkprovider,p_fkcategory);
end//
DELIMITER ;

--actualizar producto
DELIMITER //
create procedure spUpdateProduct(IN p_id INT,IN p_code VARCHAR(45),IN p_description VARCHAR(100),
IN p_amount INT,IN p_price DECIMAL,IN p_fkprovider INT,IN p_fkcategory INT)
begin
	update tbl_producto
    set pro_codigo = p_code,pro_descripcion = p_description,pro_cantidad = p_amount,
    pro_precio = p_price,tbl_proveedor_prov_id = p_fkprovider,
    tbl_categoria_cat_id = p_fkcategory
    where pro_id = p_id;
end//
DELIMITER ;
--mostrar todos los productos
DELIMITER //
create procedure spSelectProducts()
begin
	select pro_id,pro_codigo,pro_descripcion,pro_cantidad,pro_precio,
    tbl_categoria_cat_id, tbl_categoria.cat_descripcion,
    tbl_proveedor_prov_id,tbl_proveedor.prov_nombre
    from tbl_producto
    INNER JOIN tbl_categoria
	ON tbl_producto.tbl_categoria_cat_id = tbl_categoria.cat_id
	INNER JOIN tbl_proveedor
	ON tbl_producto.tbl_proveedor_prov_id = tbl_proveedor.prov_id;
end//
DELIMITER ;
--eliminar producto
DELIMITER //
create procedure spDeleteProduct(IN p_id INT)
begin
	delete from tbl_producto where pro_id = p_id;
end//
DELIMITER ;












