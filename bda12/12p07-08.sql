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

/*
-Tras crear la tabla se decide añadir una nueva
columna llamada edad. Escribe la sentencia SQL
necesaria para modificar la tabla y añadir la nueva
columna.
*/
alter table alumnos add edad int;


/*
-Escribe una función llamada calcularEdad que
reciba una fecha y devuelva el número de años que
han pasado desde la fecha actual hasta la fecha
pasada como parámetro.
*/

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

/*
-Escribe un procedimiento
(actualizarColumnaEdad) que actualice la edad
de todos los alumnos que ya existen en la tabla.
--Utiliza un cursor para recorrer la tabla y modificar cada
alumno.
--Este procedimiento deberá utilizar la función
calcularEdad.
*/
delimiter //
create or replace procedure actualizarColumnaEdad()
begin
    declare salir int default 0;
    declare fechaNacimientoP int;
    declare edadP int;
    declare idAlumnoP int;
    declare cur cursor for select id,fechaNacimiento from cursores.alumnos;

    declare exit handler for not found close cur;

    open cur;

    while salir = 0 do
        fetch cur into idAlumnoP,fechaNacimientoP;
        update alumnos set edad=calcularEdad(fechaNacimientoP) where id=idAlumnoP;
    end while;
end;
//
delimiter ;
CALL actualizarColumnaEdad();

/* DATOS DE PRUEBAS
insert into alumnos values (null(id),nombre,apellido1,apellido2,fechaNaciiento,null(edad));

insert into alumnos values (1,'Elena','Aleksandrova','Gesheva','1998-02-21',null);
insert into alumnos values (2,'Alejandro','Ballesta','Sierra','1999-09-23',null);
insert into alumnos values (3,'Pedro','Garcia','Rivera','1981-01-01',null);
*/



/********************************************************************************************
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
*/
delimiter //
create or replace function crearEmail(nombreF varchar(50),apellido1F varchar(50),apellido2F varchar(50),dominioF varchar(50))  
    returns varchar(50)
begin
    declare nombre varchar(50);
    declare apellido1 varchar(50);
    declare apellido2 varchar(50);
    declare correo varchar(50);

    set nombre = left(nombreF,1);
    set apellido1 = substring(apellido1F,1,3);
    set apellido2 = substring(apellido2F,1,3);
    set correo = lower(concat(nombre,apellido1,apellido2,'@',dominioF));
    return correo;
end;
//
delimiter ;
select crearEmail('Alejandro','Ballesta','Sierra','gmail.com');


alter table alumnos add email varchar(50);

/*
-Crea un procedimiento
(actualizarColumnaEmail) que permita crear un
email para todos los alumnmos que ya existen en la
tabla.
--Debes utilizar la función crearEmail
*/
delimiter //
create or replace procedure actualizarColumnaEmail(dominio varchar(50))
begin
    declare salir int default 0;
    declare idP int;
    declare nombreP varchar(50);
    declare apellido1P varchar(50);
    declare apellido2P varchar(50);
    declare cur cursor for select id,nombre,apellido1,apellido2 from cursores.alumnos;
    
    declare exit handler for not found close cur;

    open cur;

    while salir = 0 do
        fetch cur into idP,nombreP,apellido1P,apellido2P;
        update alumnos set email=crearEmail(nombreP,apellido1P,apellido2P,dominio) where id=idP;
    end while;
end;
//
delimiter ;

CALL actualizarColumnaEmail("gmail.com");

/*
-Crea un procedimiento
(crearListaEmailsAlumnos) que devuelva la lista
de emails de la tabla alumnos separados por un
punto y coma.
--Ejemplo:ana@iesseveroochoa.net;bruno@iesseveroochoa.net;carlos@iesseveroochoa.net
*/
delimiter //
create or replace procedure crearListaEmailsAlumnos()
begin
    declare salir int default 0;
    declare emailP varchar(50);
    declare resultado varchar(256) default " ";
    declare cur cursor for select email from cursores.alumnos;
    
    declare exit handler for not found
   	begin
	    close cur;
	    select resultado;
	end;

    open cur;

    while salir = 0 do
        fetch cur into emailP;
        set resultado = concat(resultado,emailP,';');
    end while;
end;
//
delimiter ;

call crearListaEmailsAlumnos();



/*CURSORES*/
declare cur01 cursor for select...;

open cur01;

fetch cur01 into variable;

close cur01;

/*HANDLER*/
declare [continue||exit] for [error | not found ]...;
begin
end;

/*WHILE and UNTIL*/
while condicion do
end while;

repeat

until condicion;
end repeat;

/*TRANSACCION*/
start transaction;

commit;

rollback;

/*TRIGGER*/
create or replace trigger nombreTrigger
    [after | before] [insert | delete | update ] on tabla for each row


create or replace trigger triggerGuardarAlumnosAfterDelete
  after delete on alumnos for each row