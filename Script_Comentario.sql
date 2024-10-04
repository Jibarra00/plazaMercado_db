-- Crear comentario
DELIMITER $$
CREATE PROCEDURE crearComentario(
    IN p_com_text VARCHAR(1000),
    IN p_com_fecha DATE,
    IN p_com_clasificacion INT,
    IN p_tbl_cliente_cli_id INT,
    IN p_tbl_producto_pro_id INT
)
BEGIN
    INSERT INTO tbl_comentario (com_text, com_fecha, com_clasificacion, tbl_cliente_cli_id, tbl_producto_pro_id)
    VALUES (p_com_text, p_com_fecha, p_com_clasificacion, p_tbl_cliente_cli_id, p_tbl_producto_pro_id);
END$$
DELIMITER ;

-- Leer comentario
DELIMITER $$
CREATE PROCEDURE leerComentario(IN p_com_id INT)
BEGIN
    SELECT * FROM tbl_comentario WHERE com_id = p_com_id;
END$$
DELIMITER ;

-- Actualizar comentario
DELIMITER $$
CREATE PROCEDURE actualizarComentario(
    IN p_com_id INT,
    IN p_com_text VARCHAR(1000),
    IN p_com_fecha DATE,
    IN p_com_clasificacion INT
)
BEGIN
    UPDATE tbl_comentario
    SET com_text = p_com_text,
        com_fecha = p_com_fecha,
        com_clasificacion = p_com_clasificacion
    WHERE com_id = p_com_id;
END$$
DELIMITER ;

-- Eliminar comentario
DELIMITER $$
CREATE PROCEDURE eliminarComentario(IN p_com_id INT)
BEGIN
    DELETE FROM tbl_comentario WHERE com_id = p_com_id;
END$$
DELIMITER ;
