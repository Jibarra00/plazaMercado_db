-- Selecciona unicamente el id y el nombre deL producto
DELIMITER //
CREATE PROCEDURE spSelectProductDDL()
BEGIN
	select pro_id,concat(pro_codigo,'  ', pro_descripcion) as codigoDescripcion
    from tbl_producto;
END//
DELIMITER ;
-- crear producto
DELIMITER //
create procedure spInsertProduct(IN p_codigo VARCHAR(45),IN p_descripcion VARCHAR(100),
IN p_cantidad INT,IN p_precio DECIMAL,IN p_fkprovider INT,IN p_fkcategory INT)
begin
	insert into tbl_producto(pro_codigo,pro_descripcion,pro_cantidad,pro_precio,
    tbl_proveedor_prov_id,tbl_categoria_cat_id) 
    values(p_codigo,p_descripcion,p_cantidad,p_precio,p_fkprovider,p_fkcategory);
end//
DELIMITER ;

-- actualizar producto
DELIMITER //
create procedure spUpdateProduct(IN p_id INT,IN p_codigo VARCHAR(45),IN p_descripcion VARCHAR(100),
IN p_cantidad INT,IN p_precio DECIMAL,IN p_fkprovider INT,IN p_fkcategory INT)
begin
	update tbl_producto
    set pro_codigo = p_codigo,pro_descripcion = p_descripcion, pro_cantidad = p_cantidad,
    pro_precio = p_precio,tbl_proveedor_prov_id = p_fkprovider,
    tbl_categoria_cat_id = p_fkcategory
    where pro_id = p_id;
end//
DELIMITER ;
-- mostrar todos los productos
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
-- eliminar producto
DELIMITER //
create procedure spDeleteProduct(IN p_id INT)
begin
	delete from tbl_producto where pro_id = p_id;
end//
DELIMITER ;
-- Muestra cuantos productos existen
DELIMITER //
CREATE PROCEDURE spSelectCountProducts(OUT total_productos INT)
BEGIN
	SELECT COUNT(pro_id) INTO total_productos
    FROM tbl_producto;
END//
DELIMITER ;
-- Muestra cuantos productos existen por categoria
DELIMITER //
CREATE PROCEDURE spSelectCountProductsCategories()
BEGIN 
	select 
    c.cat_descripcion AS Categoria,
    COUNT(p.pro_id) AS TotalProductos
		FROM tbl_categoria c
			LEFT JOIN tbl_producto p ON c.cat_id = p.tbl_categoria_cat_id
			GROUP BY c.cat_descripcion
			ORDER BY TotalProductos DESC;
END//
DELIMITER ;