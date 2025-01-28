-- Crear comentario
DELIMITER $$
CREATE PROCEDURE spInsertComment(
    IN c_text VARCHAR(1000),
    IN c_fecha DATE,
    IN c_clasificacion INT,
    IN tbl_cliente_cli_id INT,
    IN tbl_producto_pro_id INT
)
BEGIN
    INSERT INTO tbl_comentario (com_text, com_fecha, com_clasificacion, tbl_cliente_cli_id, tbl_producto_pro_id)
    VALUES (c_text, c_fecha, c_clasificacion, tbl_cliente_cli_id, tbl_producto_pro_id);
END$$
DELIMITER ;

-- Leer comentario
DELIMITER $$
CREATE PROCEDURE spSelectComment()
BEGIN
    SELECT com_id, com_text, com_fecha, com_clasificacion, tbl_cliente_cli_id,tbl_cliente.cli_nombres,tbl_producto_pro_id, tbl_producto.pro_descripcion
    FROM tbl_comentario
    INNER JOIN tbl_cliente
    ON tbl_comentario.tbl_cliente_cli_id = tbl_cliente.cli_id
    INNER JOIN tbl_producto
    ON tbl_comentario.tbl_producto_pro_id = tbl_producto.pro_id;
END$$
DELIMITER ;

-- Actualizar comentario
DELIMITER $$
CREATE PROCEDURE spUpdateComment(
    IN c_id INT,
    IN c_text VARCHAR(1000),
    IN c_fecha DATE,
    IN c_clasificacion INT,
    IN tbl_producto_pro_id INT,
    IN tbl_cliente_cli_id INT
)
BEGIN
    UPDATE tbl_comentario
    SET com_text = c_text,
        com_fecha = c_fecha,
        com_clasificacion = c_clasificacion,
        tbl_producto_pro_id = tbl_producto_pro_id,
        tbl_cliente_cli_id = tbl_cliente_cli_id
    WHERE com_id = c_id;
END$$
DELIMITER ;

-- Eliminar comentario
DELIMITER $$
CREATE PROCEDURE spDeleteComment(IN c_id INT)
BEGIN
    DELETE FROM tbl_comentario WHERE com_id = c_id;
END$$
DELIMITER ;