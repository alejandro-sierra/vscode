source 06p07.sql;
insert into LIBRO values (null,"Loba Negra","J. Gómez-Jurado", 5, "NOV");
insert into LIBRO values (null,"MariaDB Essentials","Emislien Kenier", 5, "INF");

-- UPDATE CLIENTE SET nombre='Juan' WHERE ciudad='Elche'
update LIBRO set stock=stock-3, autor='Juan Gómez Jurado' where titulo='Reina Roja'; --stock=stock-3

update PRESTAMO set fdevolucion='20/12/31' where fdevolucion in null;