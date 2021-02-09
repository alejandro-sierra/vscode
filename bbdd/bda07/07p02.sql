-- 1.- Obtener una lista de todas las empleadas asignadas a departamentos cuyo código empiece por D o por E. La lista anterior debe contener 
--información sobre el número de empleado, nombre, apellido y número de teléfono. 
select numemple,nombre,apellido,tlfn from emple where dept like 'D%' or dept like 'E%';

-- 2. - Obtener un listado de todos los empleados (nombre y apellido) que ganan más de 2000€ al mes y que entraron en la compañía después del 1 de Enero de 1975.
select nombre,apellido from emple where salario>2000 and feching>'1975/01/01';

-- 3.- Obtener una lista  con el apellido, número de departamento  y salario mensual  de los empleados de los departamentos ‘A00’, ‘B01’, ‘C01’ y ‘D01’.
-- La salida se quiere en orden descendente de salario dentro de cada departamento.
select apellido,dept,salario from emple where dept in ('A00','B01','C01','D01') order by salario desc, dept asc; 

-- 4.- Seleccionar todos los empleados de los departamentos ‘D11’ y ‘E11’ cuyo primer apellido empiece por S.
select * from emple where apellido like 'S%' and dept in ('D11','E11');

-- 6. - Código y nombre de los departamentos sin director.
select coddep,nomdep from depar where numdirec is null;    

-- 7. Cuántos departamentos tienen director. 

-- 8. Nombre y apellidos de los empleados nacidos en la década de los 40 que o bien tengan un nivel educativo inferior a 14 o bien sean mujeres que ganen más de 3000€. 

-- 9. Apellido, nombre, salario e incremento de un 5% de su salario, ordenado por apellido. 

-- 10. Apellido y nombre de los empleados, ordenados descendente por antigüedad. 
