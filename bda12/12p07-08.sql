/*
7.- Cursores - edad
-Crea la base de datos cursores con una tabla
llamada alumnos y 4 sentencias de inserción para
inicializar la tabla que contiene las siguientes
columnas:
--id (entero sin signo y clave primaria)
--nombre (cadena de caracteres)
--apellido1 (cadena de caracteres)
--apellido2 (cadena de caracteres)
--fechaNacimiento (fecha)

-Tras crear la tabla se decide añadir una nueva
columna llamada edad. Escribe la sentencia SQL
necesaria para modificar la tabla y añadir la nueva
columna.

-Escribe una función llamada calcularEdad que
reciba una fecha y devuelva el número de años que
han pasado desde la fecha actual hasta la fecha
pasada como parámetro.

-Escribe un procedimiento
(actualizarColumnaEdad) que actualice la edad
de todos los alumnos que ya existen en la tabla.
--Utiliza un cursor para recorrer la tabla y modificar cada
alumno.
--Este procedimiento deberá utilizar la función
calcularEdad.
*/
DROP DATABASE cursores;
CREATE DATABASE IF NOT EXISTS cursores;
USE cursores;

CREATE TABLE alumnos(
    id INT unsigned PRIMARY KEY,
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    fechaNacimiento DATE
);


alter table alumnos add edad int;


delimiter //
create or replace function calcularEdad(nacido date)    
    returns int
begin
    declare resultado int;
    set resultado = (datediff(now(),nacido)); 
    set resultado = truncate(resultado / 365,0); 
    return resultado;
end;
//
delimiter ;
select calcularEdad('1999-09-23');

/* DATOS DE PRUEBAS
insert into alumnos values (null(id),nombre,apellido1,apellido2,fechaNaciiento,null(edad));

insert into alumnos values (1,'Elena','Aleksandrova','Gesheva','1998-02-21',null);
insert into alumnos values (2,'Alejandro','Ballesta','Sierra','1999-09-23',null);
insert into alumnos values (3,'Pedro','Garcia','Rivera','1981-01-01',null);
*/

delimiter // --revisar
create or replace procedure actualizarColumnaEdad()
begin
    declare salir int default false;
    declare fechaCursor int;
    declare cur cursor for select fechaNacimiento from cursores.alumnos;
    declare continue handler for not found set salir = true;

    open cur;

    while salir = false do
        fetch cur into fechaCursor;
        insert into alumnos set edad="select calcularEdad('fechaCursor')";
    end while;

    close cur; 
end;
//
delimiter ;
CALL actualizarColumnaEdad();

/*
8.- Cursores - email
-Crea una función (crearEmail) que a partir del
nombre, apellido1, apellido2 y dominio,
genere una dirección de email y la devuelva como
salida. El formato del email de salida es el siguiente:
--El primer carácter del parámetro nombre.
--Los tres primeros caracteres del parámetro apellido1.
--Los tres primeros caracteres del parámetro apellido2.
--El carácter @ .
--El dominio pasado como parámetro.

-Ejemplo: crearEmail('Aitor', 'Medrano', 'Escrig',
'gva.es') devolvería amedesc@gva.es

-Crea un procedimiento
(actualizarColumnaEmail) que permita crear un
email para todos los alumnmos que ya existen en la
tabla.
--Debes utilizar la función crearEmail

-Crea un procedimiento
(crearListaEmailsAlumnos) que devuelva la lista
de emails de la tabla alumnos separados por un
punto y coma.
--Ejemplo:ana@iesseveroochoa.net;bruno@iesseveroochoa.net;carlos@iesseveroochoa.net
*/
delimiter //
create or replace function crearEmail(nombreF varchar(50),apellido1F varchar(50),apellido2F varchar(50),dominioF varchar(50))  
    returns varchar(50)
begin
    declare nombre varchar(50);
    declare apellido1 varchar(50);
    declare apellido2 varchar(50);
    declare correo varchar(50);

    set nombre = (select substring(nombreF,0,1));
    set apellido1 = (select substring(apellido1F,0,3));
    set apellido2 = (select substring(apellido2F,0,3));
    set correo = lower((concat ('nombre','apellido1','apellido2','@','dominioF','.com')));
    return correo;
end;
//
delimiter ;
select crearEmail('Alejandro','Ballesta','Sierra','gmail');


alter table alumnos add email varchar(50);


delimiter // --revisar
create or replace procedure actualizarColumnaEmail()
begin
    declare salir int default false;
    declare fechaCursor int;
    declare cur cursor for select fechaNacimiento from cursores.alumnos;
    declare continue handler for not found set salir = true;

    open cur;

    while salir = false do
        fetch cur into fechaCursor;
        insert into alumnos set edad="select calcularEdad('fechaCursor')";
    end while;

    close cur; 
end;
//
delimiter ;
CALL actualizarColumnaEmail();