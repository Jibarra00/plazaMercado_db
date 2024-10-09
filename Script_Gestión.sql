-- Crear gestion
DELIMITER $$
CREATE PROCEDURE crearGestion(
    IN p_ges_fecha DATE,
    IN p_ges_descripcion VARCHAR(1000),
    IN p_tbl_empleado_emp_id INT,
    IN p_tbl_producto_pro_id INT
)
BEGIN
    INSERT INTO tbl_gestion (ges_fecha, ges_descripcion, tbl_empleado_emp_id, tbl_producto_pro_id)
    VALUES (p_ges_fecha, p_ges_descripcion, p_tbl_empleado_emp_id, p_tbl_producto_pro_id);
END$$
DELIMITER ;

-- Leer gestion
DELIMITER $$
CREATE PROCEDURE leerGestion(IN p_ges_id INT)
BEGIN
    SELECT * FROM tbl_gestion WHERE ges_id = p_ges_id;
END$$
DELIMITER ;

-- Actualizar gestion
DELIMITER $$
CREATE PROCEDURE actualizarGestion(
    IN p_ges_id INT,
    IN p_ges_fecha DATE,
    IN p_ges_descripcion VARCHAR(1000)
)
BEGIN
    UPDATE tbl_gestion
    SET ges_fecha = p_ges_fecha,
        ges_descripcion = p_ges_descripcion
    WHERE ges_id = p_ges_id;
END$$
DELIMITER ;

-- Eliminar gestion
DELIMITER $$
CREATE PROCEDURE eliminarGestion(IN p_ges_id INT)
BEGIN
    DELETE FROM tbl_gestion WHERE ges_id = p_ges_id;
END$$
DELIMITER ;
