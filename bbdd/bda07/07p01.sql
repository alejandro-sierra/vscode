-- 1. Listar el nombre de los empleados junto con su salario.
select NomEmp, SalEmp from empleado;

-- 2. Listar los mismos datos del empleado de código 1.
select NomEmp, SalEmp from empleado where CodEmp=1;

-- 3. Listar el nombre y el complemento familiar (= salario * no hijos * 4 /100) de los empleados con hijos.
select NomEmp, truncate(SalEmp*NumHi*4/100,2) as 'complemento familiar' from empleado where NumHi>0;

-- 4. Listar todos los datos de habilidades.
select * from habilidad;    

-- 5. Listar sin repeticiones el código de todos los departamentos que tengan trabajadores incorporados antes 
--del 1/1/92 (utilizar ' para encerrar la constante de fecha). 
select distinct codDep, FecInEmp from empleado where FecInEmp<'1992/01/01';  

-- 6.Listar el nombre de los trabajadores que no tienen extensión telefónica.

-- 7. Listar el nombre y presupuesto de los departamentos no ubicados en los centros con código DIGE o FAZS.

-- 8. Listar el nombre y salario de los trabajadores que ganen menos de 2 o más de 5 millones de euros.

-- 9. Listar el código y nombre de los empleados cuyo código sea distinto de 1,4,6,8,10.

-- 10. Listar el nombre y fecha de nacimiento de los hijos de empleado que tengan como parte de su nombre o apellidos la secuencia de letras “León”.

-- 11. Listar el nombre y salario anual de los empleados que ganan menos de 4 millones pero que ingresaron en la empresa antes de 1985. Para la primera condición utilizar lógica negativa.

-- 12. Listar el nombre y NIF de los empleados que teniendo un NIF con la letra D o V: a) Trabajan en los departamentos IN&DI o DIRGE y ganan más de 5 millones; o b) Fueron contratados en
-- 1994.

-- 13. Listado del código, nombre y presupuesto de los departamentos ordenado por criterio descendente del presupuesto anual.

-- 14. Listado del tipo de director, código, nombre y presupuesto de los departamentos ordenado por tipo de director (orden alfabético) y dentro de este criterio por presupuesto anual 
--en orden ascendente.
