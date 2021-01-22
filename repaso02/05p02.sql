drop database if exists prueba02;
create database if not exists prueba02;
use prueba02;

create table FABRICANTE(
    codigo_fabricante int(16) auto_increment,
    nombre varchar(32) not null,
    pais varchar(32),
    constraint PK_FAB primary key (codigo_fabricante)
);

create table ARTICULO(
    codigo_articulo varchar(32),
    codigo_fabricante int(16),
    peso decimal(2,0) check (peso>0),
    categoria enum ('primera','segunda','tercera'),
    precio_compra decimal(2,0) check (precio_compra>0),
    precio_venta decimal(2,0) check (precio_venta>0),
    existencias int(16),
    constraint PK_ART primary key (codigo_articulo, codigo_fabricante, peso, categoria)
);

alter table ARTICULO add constraint FK_ART_FAB foreign key (codigo_fabricante) references FABRICANTE (codigo_fabricante);
alter table FABRICANTE modify pais varchar(32) default ('España');

alter table ARTICULO drop constraint FK_ART_FAB;
alter table FABRICANTE modify codigo_fabricante int(16) unique;
alter table FABRICANTE drop primary key;
alter table FABRICANTE add constraint PK_FAB primary key (nombre);
alter table ARTICULO add constraint FK_ART_FAB foreign key (codigo_fabricante) references FABRICANTE (codigo_fabricante);


load data local infile 'datos.txt' into table FABRICANTE fields terminated by ',' lines terminated by '\n';