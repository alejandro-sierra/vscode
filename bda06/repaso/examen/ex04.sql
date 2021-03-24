insert into ALUMNO values (null,'12345678A','Johnny','Mentero','H','Debajo del puente -1',null,'1980/12/25'),
                        (null,'23456789B','Maria','Garcia','M',null,'63611233',null),
                        (null,'34567890C','Armando','Casas','I','Villarriba 33','636223344','1990/12/31'),
                        (null,'45678901D','Mario','Neta','H','Circo del sol, 22','636334455',null),
                        (null,'56789012E','Susana','Oria','M','C/ La granja',null,'2000/01/03');


insert into ASIGNATURA values (null,'SQL',3,9), (666,'Humor',null,12), (null, 'Cocina',6,null);

load data local infile 'ex04datos.txt' into table NOTA fields terminated by '\t' lines terminated by '\n';