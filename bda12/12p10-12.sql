/*
10.- Trigger Before
-Crea un trigger (triggerCrearEmailBeforeInsert) sobre la
tabla alumnos, para que si el email a insertar es
nulo le asigne uno automáticamente
-Debes utilizar la función crearEmail con el
dominio 'noemail.com'.
*/
delimiter //
create or replace trigger triggerCrearEmailBeforeInsert
  before insert on alumnos for each row
begin
	if new.email is null then
		set new.email=crearEmail(new.nombre,new.apellido1,new.apellido2,'noemail.com');
	end if;
end
//

/*
11.- Trigger After I
-Crea un trigger (triggerGuardarEmailAfterUpdate) sobre la
tabla alumnos, para que cada vez que se modifica el
email, inserte un nuevo registro en la tabla
logCambiosEmail, cuyos campos son:
--id: clave primaria (entero autonumérico)
--idAlumno: id del alumno (entero)
--fechaHora: marca de tiempo con el instante del
cambio (fecha y hora)
--oldEmail: valor anterior del email (cadena de
caracteres)
--newEmail: nuevo valor con el que se ha actualizado
*/
create table logCambiosEmail(
    id int primary key auto_increment,
    idAlumno int,
    fechaHora timestamp,
    oldEmail varchar(50),
    newEmail varchar(50)
);

delimiter //
create or replace trigger triggerGuardarEmailAfterUpdate
  after update on alumnos for each row
begin
	if old.email <> new.email then
  		insert into logCambiosEmail values (null,old.id,now(),old.email,new.email);
  	end if;
end
//

/*
-Crea un trigger (triggerGuardarAlumnosAfterDelete) sobre la
tabla alumnos, para que cada vez que se elimine un
alumno, inserte un nuevo registro en la tabla
logAlumnosEliminados, cuyos campos son:
--id: clave primaria (entero autonumérico)
--idAlumno: id del alumno (entero)
--fechaHora: marca de tiempo
--nombre: nombre del alumno (cadena de caracteres)
--apellido1: 1er apellido (cadena de caracteres)
--apellido2: 2º apellido (cadena de caracteres)
--email: email del alumno (cadena de caracteres)
*/
create table logAlumnosEliminados(
    id int primary key auto_increment,
    idAlumno int,
    fechaHora timestamp,
    nombre varchar(50),
    apellido1 varchar(50),
    apellido2 varchar(50),
    email varchar(50)
);

delimiter //
create or replace trigger triggerGuardarAlumnosAfterDelete
  after delete on alumnos for each row
begin
  insert into logAlumnosEliminados values (null,old.id,now(),old.nombre,old.apellido1,old.apellido2,old.email);
end
//