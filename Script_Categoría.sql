-- Crear categoria
DELIMITER $$
CREATE PROCEDURE crearCategoria(
    IN p_cat_descripcion VARCHAR(1000)
)
BEGIN
    INSERT INTO tbl_categoria (cat_descripcion)
    VALUES (p_cat_descripcion);
END$$
DELIMITER ;

-- Leer categoria
DELIMITER $$
CREATE PROCEDURE leerCategoria(IN p_cat_id INT)
BEGIN
    SELECT * FROM tbl_categoria WHERE cat_id = p_cat_id;
END$$
DELIMITER ;

-- Actualizar categoria
DELIMITER $$
CREATE PROCEDURE actualizarCategoria(
    IN p_cat_id INT,
    IN p_cat_descripcion VARCHAR(1000)
)
BEGIN
    UPDATE tbl_categoria
    SET cat_descripcion = p_cat_descripcion
    WHERE cat_id = p_cat_id;
END$$
DELIMITER ;

-- Eliminar categoria
DELIMITER $$
CREATE PROCEDURE eliminarCategoria(IN p_cat_id INT)
BEGIN
    DELETE FROM tbl_categoria WHERE cat_id = p_cat_id;
END$$
DELIMITER ;
