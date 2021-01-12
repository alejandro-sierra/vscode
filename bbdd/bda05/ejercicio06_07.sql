drop database ejercicio06_07;
create database if not exists ejercicio06_07;
use ejercicio06_07;

create table FABRICANTE(
    codFabricante int auto_increment primary key,
    nombre varchar (32) not null,
    pais varchar (32)
);

create table ARTICULO(
    codigo varchar(32),
    codFabricante int,
    peso decimal(2),
    categoria enum('Primera','Segunda','Tercera'),
    precioVenta decimal(2),
    precioCompra decimal(2),
    existencias int,
    constraint PK_ART primary key (codigo,codFabricante,peso,categoria),
    constraint CHK_PE check (peso>0),
    constraint CHK_PV check (precioVenta>0),
    constraint CHK_PC check (precioCompra>0)
);


--ALTER

alter table ARTICULO add constraint FK_ART_FAB foreign key (codFabricante) references FABRICANTE (codFabricante);

-- alter table FABRICANTE modify pais varchar(32) default ('España');

-- alter table FABRICANTE drop primary key, modify nombre varchar(32) primary key;

-- alter table FABRICANTE disable keys;