-- Insertar un empleado
DELIMITER //
create procedure spInsertEmployee(IN e_identification VARCHAR(10),IN e_names VARCHAR(80),
IN e_lastnames VARCHAR(80),IN e_phone VARCHAR(45),IN e_addres VARCHAR(100))
begin
	insert into tbl_empleado(emp_identificacion,emp_nombres,emp_apellidos,emp_telefono,
    emp_direccion) 
    values(e_identification,e_names,e_lastnames,e_phone,e_addres);
end//
DELIMITER ;


-- Actualizar un Empleado
DELIMITER //
create procedure spUpdateEmployee(IN e_id INT,IN e_identification VARCHAR(10),IN e_names VARCHAR(80),
IN e_lastnames VARCHAR(80),IN e_phone VARCHAR(45),IN e_addres VARCHAR(100))
begin
	update tbl_empleado
    set emp_identificacion = e_identification, emp_nombres = e_names,emp_apellidos = e_lastnames,emp_telefono = e_phone,
    emp_direccion = e_addres
    where emp_id = e_id;
end//
DELIMITER ;

-- Mostrar todos los empleados
DELIMITER //
create procedure spSelectEmployees()
begin
	select emp_id,emp_identificacion,emp_nombres,emp_apellidos,emp_telefono,
    emp_direccion
    from tbl_empleado;
    
end//
DELIMITER ;

-- Eliminar un empleado
DELIMITER //
create procedure spDeleteEmployee(IN e_id INT)
begin
	delete from tbl_empleado where emp_id = e_id;
end//
DELIMITER ;


-- Selecciona unicamente el id y el nombre de los provedores
DELIMITER //
CREATE PROCEDURE spSelectEmployeesDDL()
BEGIN
	select emp_id, emp_nombre
    from tbl_empleado;
END//
DELIMITER ;


