-- Crear gestion
DELIMITER $$
CREATE PROCEDURE spInsertManagement(
    IN g_fecha DATE,
    IN g_descripcion VARCHAR(1000),
    IN tbl_empleado_emp_id INT,
    IN tbl_producto_pro_id INT
)
BEGIN
    INSERT INTO tbl_gestion (ges_fecha, ges_descripcion, tbl_empleado_emp_id, tbl_producto_pro_id)
    VALUES (g_fecha, g_descripcion, tbl_empleado_emp_id, tbl_producto_pro_id);
END$$
DELIMITER ;

-- Leer gestion
DELIMITER $$
CREATE PROCEDURE spSelectManagement()
BEGIN
    SELECT ges_id, ges_fecha, ges_descripcion, tbl_empleado_emp_id,tbl_empleado.emp_nombres, tbl_producto_pro_id,tbl_producto.pro_descripcion 
    FROM tbl_gestion
    INNER JOIN tbl_empleado
    ON tbl_gestion.tbl_empleado_emp_id = tbl_empleado.emp_id
    INNER JOIN tbl_producto
    ON tbl_gestion.tbl_producto_pro_id = tbl_producto.pro_id;
END$$
DELIMITER ;

-- Actualizar gestion
DELIMITER $$
CREATE PROCEDURE spUpdateManagement(
    IN g_id INT,
    IN g_fecha DATE,
    IN g_descripcion VARCHAR(1000),
    IN tbl_empleado_emp_id INT,
    IN tbl_producto_pro_id INT
)
BEGIN
    UPDATE tbl_gestion
    SET ges_fecha = g_fecha,
        ges_descripcion = g_descripcion,
        tbl_empleado_emp_id = tbl_empleado_emp_id,
        tbl_producto_pro_id = tbl_producto_pro_id
    WHERE ges_id = g_id;
END$$
DELIMITER ;

-- Eliminar gestion
DELIMITER $$
CREATE PROCEDURE spDeleteManagement(IN g_id INT)
BEGIN
    DELETE FROM tbl_gestion WHERE ges_id = g_id;
END$$
DELIMITER ;

-- Seleccionar gestion por DDL
DELIMITER $$
CREATE PROCEDURE spSelectManagementDDL()
BEGIN
  SELECT ges_id, ges_descripcion FROM tbl_gestion;
END$$
DELIMITER ;