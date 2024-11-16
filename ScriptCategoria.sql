-- Crear categoria
DELIMITER $$
CREATE PROCEDURE spInsertCategory(
    IN c_descripcion VARCHAR(1000)
)
BEGIN
    INSERT INTO tbl_categoria (cat_descripcion)
    VALUES (c_descripcion);
END$$
DELIMITER ;

-- Leer categoría
DELIMITER $$
CREATE PROCEDURE spSelectCategory()
BEGIN
    SELECT cat_id, cat_descripcion FROM tbl_categoria;
END$$
DELIMITER ;

-- Actualizar categoria
DELIMITER $$
CREATE PROCEDURE spUpdateCategory(
    IN c_id INT,
    IN c_descripcion VARCHAR(1000)
)
BEGIN
    UPDATE tbl_categoria
    SET cat_descripcion = c_descripcion
    WHERE cat_id = c_id;
END$$
DELIMITER ;

-- Eliminar categoria
DELIMITER $$
CREATE PROCEDURE spDeleteCategory(IN c_id INT)
BEGIN
    DELETE FROM tbl_categoria WHERE cat_id = c_id;
END$$
DELIMITER ;

-- Selecciona unicamente el id y el nombre de la categoría
DELIMITER //
CREATE PROCEDURE spSelectCategoryDDL()
BEGIN
     select cat_id, cat_descripcion from tbl_categoria;
END//
DELIMITER ;