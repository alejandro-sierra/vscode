source ../bda05/ejercicio06_07.sql;
use ejercicio06_07;

-- truncate table FABRICANTE;
-- truncate table ARTICULO;


insert into FABRICANTE values (null,"Pepe e Hijos","Espanya");
insert into FABRICANTE values (null,"Samsung","Corea");
insert into FABRICANTE values (null,"Placas Flacas",null);
insert into FABRICANTE values (null,"Nvidia","EEUU");
insert into FABRICANTE values (null,"Juan y Hermanos","Espanya");

insert into ARTICULO set codigo="art01",codFabricante=5,peso=12,categoria="Segunda";
insert into ARTICULO set codigo="art02",codFabricante=3,peso=1,categoria="Primera",precioVenta=45,precioCompra=15,existencias=6;
insert into ARTICULO set codigo="art03",codFabricante=2,peso=25,categoria="Primera",existencias=8;
insert into ARTICULO set codigo="art04",codFabricante=4,peso=2,categoria="Tercera",precioVenta=78,precioCompra=40,existencias=1;
insert into ARTICULO set codigo="art05",codFabricante=1,peso=5,categoria="Segunda",existencias=2;

insert into FABRICANTE values (null, "Xiaomi","China");
insert into ARTICULO values ("art06",LAST_INSERT_ID(),13,"Tercera",34,11,3);

load data local infile '06p03datos.txt' into table FABRICANTE fields terminated by '\t' lines terminated by '\n';