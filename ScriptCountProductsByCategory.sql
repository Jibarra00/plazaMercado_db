DELIMITER //
CREATE PROCEDURE spCantidadProductosVendidosPorCategoria()
BEGIN
    SELECT 
        p.ped_fecha AS Fecha,
        c.cat_descripcion AS Categoria,
        COUNT(pr.pro_id) AS CantidadVendida
    FROM 
        tbl_pedidos p
    JOIN 
        tbl_producto pr 
    ON 
        p.tbl_producto_pro_id = pr.pro_id
    JOIN 
        tbl_categoria c
    ON 
        pr.tbl_categoria_cat_id = c.cat_id
    GROUP BY 
        p.ped_fecha, c.cat_descripcion
    ORDER BY 
        p.ped_fecha ASC, c.cat_descripcion;
END //
DELIMITER ;