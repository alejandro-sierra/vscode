-- source 06p04.sql;
use biblioteca;

truncate table PRESTAMO;
truncate table LIBRO;

insert into LIBRO values (null,"Historia de España","J. Pérez",5,"HIS");
insert into LIBRO values (null,"Reina Roja","J. Gómez-Jurado",33,"NOV");

insert into PRESTAMO set codLibro=1, codSocio=1,fentrega="20/10/15";
insert into PRESTAMO set codLibro=2, codSocio=1,fentrega="20/12/25";