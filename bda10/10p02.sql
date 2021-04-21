-- 1. ¿Cuantos registros contiene la tabla employees? ¿Qué indices tiene la tabla?
select count(emp_no) from employees;
--la tabla employees tiene 300.024 registros

-- 2. ¿Cuantos registros contiene la tabla salaries? ¿Qué indices tiene la tabla?
select count(emp_no) from salaries;
--la table salaries tiene 2.844.047 registros

-- 3. Muestra cuantos empleados tiene cada title (categoría laboral). ¿Cuánto tarda la consulta?
select title, count(e.emp_no) from titles t join employees e on t.emp_no=e.emp_no group by t.title;
--la consulta tarda 2,978 segundos

-- -- 1. Crea una vista (titles_emp_view) que realice la misma consulta. ¿ Cuánto tiempo ha
-- -- tardado en crearse la vista? ¿Cuanto tarda la consulta sobre la vista?
create view titles_emp_view as select title, count(e.emp_no) from titles t join employees e on t.emp_no=e.emp_no group by t.title;
 --la vista se ha creado en 0,007 segundos
 select * from titles_emp_view;
 --la consulta sobre la vista a tardado 3,017 segundos

-- -- 2. Crea una tabla (titles_emp_table) a partir de la consulta. ¿ Cuánto tiempo ha tardado en
-- -- crearse la tabla? ¿Cuanto tarda la consulta sobre la nueva tabla?
create table titles_emp_table as select title, count(e.emp_no) from titles t join employees e on t.emp_no=e.emp_no group by t.title;
--la table tarda en crearse 3,501 segundos
 select * from titles_emp_table;
--la nueva table tarda en consultarse 0,001 segundos

-- -- 3. ¿Consideras que los datos de esta consulta son “críticos” y que siempre necesitan tener la
-- -- información actualizada al instante?
--no yo creo que nos datos que canbian cada relativante bastante tiempo (suponiendo que son altas de empleados pueden cambiar muy pocas vaces al dia),
-- asi que con que la información se actualice cada 20 o 30 minutos es mas que suficiente.

-- 4. El gerente de la empresa dice que necesita los datos de los categorías de los empleados
-- desglosados por sexo y que quiere tres informes separados: Uno con los datos agregados (categoría
-- y sexo), otro solo las categorías de los hombres, y el tercero con las de las mujeres, mostrando
-- siempre la cantidad de empleados de cada una de las categorías.
-- -- 1. Anota la sentencia y cuanto tarda cada consulta.
select t.title,count(e.emp_no),e.gender from titles t join employees e on t.emp_no=e.emp_no group by t.title;
--tiempo para realizar la consulta: 2,724 segundos

select t.title,count(e.emp_no),e.gender from titles t join employees e on t.emp_no=e.emp_no where e.gender="F" group by t.title;
--tiempo para realizar la consulta: 1,325 segundos

select t.title,count(e.emp_no),e.gender from titles t join employees e on t.emp_no=e.emp_no where e.gender="M" group by t.title;
--tiempo para realizar la consulta: 1,916 segundos

-- -- 2. Crea un índice en la columna gender.
create index ind_gender on employees(gender);

-- -- 3. Vuelve a ejecutar las consultas y compara tanto los planes de ejecución como los tiempos
-- -- empleados en cada consulta.
select t.title,count(e.emp_no),e.gender from titles t join employees e on t.emp_no=e.emp_no group by t.title;
--tiempo para realizar la consulta: 1,673 segundos

select t.title,count(e.emp_no),e.gender from titles t join employees e on t.emp_no=e.emp_no where e.gender="F" group by t.title;
--tiempo para realizar la consulta: 1,124 segundos

select t.title,count(e.emp_no),e.gender from titles t join employees e on t.emp_no=e.emp_no where e.gender="M" group by t.title;
--tiempo para realizar la consulta: 1,647 segundos

-- 5. El gerente nos comunica que ha comprado la empresa de jardinería, y que quiere que añadamos
-- todos los empleados de la base de datos de jardinería a esta base de datos.
-- 1. Tras comparar ambas tablas, vemos que no disponemos ni la fecha de nacimiento ni la de
-- contrato de los empleados, así que le asignaremos la fecha de la migración (la fecha del sistema
-- mediante now()). Respecto al sexo, vamos a ponerles a todos el mismo sexo (por ejemplo,
-- “M”) y finalmente, para asignarles un código de empleado le sumaremos 900.000 al código que
-- tienen en la empresa de jardineria.
alter table employees modify last_name varchar(50) not null;
alter table employees modify first_name varchar(50) not null;

insert employees.employees (emp_no, birth_date, first_name, last_name, gender, hire_date) 
select jar.codigo_empleado +900000, now(), jar.nombre, jar.apellido1, 'M', now() from jardineria.empleado jar;


-- 6. El gerente le ha cogido el gustillo a comprar empresas, y ahora ha comprado la primera empresa
-- que utilizamos (cuya base de datos es empleados).
-- -- 1. En este caso, los códigos de empleado empezaran a partir del 800.000.
-- -- 2. Además, ahora sí disponemos de las fechas de nacimiento e incorporación, pero seguimos sin
-- -- sexo.
-- -- 3. Además, tenemos el nombre completo todo junto, el cual deberemos separar (en la columna
-- -- NomEmp están separados por una coma) en nombre y apellidos. Deberás emplear las funciones
-- -- substring y locate.
SET FOREIGN_KEY_CHECKS=0;
alter table empleados.empleado modify CodEmp int(11);

insert employees.employees (emp_no, birth_date, first_name, last_name, gender, hire_date) 
select emp.CodEmp +800000, emp.FecNaEmp, substring(emp.NomEmp,locate(',', emp.NomEmp)+1), substring(emp.NomEmp,1,locate(',', emp.NomEmp)-1),
'M', emp.FecInEmp from empleados.empleado emp;

-- 7. Para controlar el acceso a la aplicación, nos piden que controlemos quien accede a la base de datos;
-- -- 1. Crea un nuevo usuario (bigdata) que solo pueda hacer consultas, sobre todos los objetos de
-- -- la base de datos.
create user 'bigdata'@'localhost' identified by 'bigdata';
grant select on employees to 'bigdata'@'localhost';

-- -- 2. Crea un nuevo usuario (empselect) que solo pueda trabajar con la tabla employee,
-- -- pudiendo realizar consultas, inserciones y modificaciones, pero no borrados.
create user 'empselect'@'localhost' identified by 'empselect';
grant select,update,insert on employees.employees to 'empselect'@'localhost';

-- -- 3. Modifica el usuario empselect para que solo pueda hacer consultas, ni inserciones ni
-- -- modificaciones sobre la tabla employees.
grant select on employees.employees to 'empselect'@'localhost';