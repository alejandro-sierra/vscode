use biblioteca;

truncate LIBRO;
truncate PRESTAMO;

insert into LIBRO values (null,"Historia de España","J. Pérez",5,"HIS");
insert into LIBRO values (null,"Reina Roja","J. Gómez-Jurado",33,"NOV");

insert into PRESTAMO set codLibro=1, codSocio=1,fentrega="15/10/20";
insert into PRESTAMO set codLibro=2, codSocio=1,fentrega="25/12/20";