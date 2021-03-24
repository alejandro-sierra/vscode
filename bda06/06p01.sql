use EJERCICIO04;

truncate table DEPARTAMENTO;
truncate table EMPLEADO;


insert into DEPARTAMENTO values ("CONTA","Contabilidad","El Himalaya");
insert into DEPARTAMENTO values ("ALM","Almacen","El polo norte");
insert into DEPARTAMENTO (codD, nombre) values ("DIR","Direccion");
insert into DEPARTAMENTO (codD, nombre) values ("LOG","Logistica");
insert into DEPARTAMENTO values ("I+D","Investigacion y Desarrollo","Planta 3");


insert into EMPLEADO set dni="12345678A", nombrec="Pepe",salario=900,departamento="LOG";
insert into EMPLEADO set dni="87654321B", nombrec="Pedro",salario=1200,departamento="ALM";
insert into EMPLEADO set dni="12385467C", nombrec="Juan",salario=1000,departamento="ALM";
insert into EMPLEADO set dni="92304567D", nombrec="Elena",salario=1800,departamento="I+D";
insert into EMPLEADO set dni="12384575E", nombrec="Alejandro",salario=3200,departamento="DIR";


insert into EMPLEADO values ("12385468F","Manolo",900,"C/Madrid 3","ALM"), 
                            ("48345987G","Perico",1200,null,"LOG"),
                            ("39456782H","Jose",2400,null,"DIR"),
                            ("29475467I","Aitor",2900,"C/Las maldivas","DIR"),
                            ("29457562J","Ales",1800,"C/Melchor Botella 23","CONTA");


-- select * from DEPARTAMENTO; //esto es para ver la informacion de la tabla

-- truncate table DEPARTAMENTO; //para borrar la informacion de la tabla