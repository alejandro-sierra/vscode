drop database biblioteca;
create database if not exists biblioteca;
use biblioteca;

create table LIBRO(
    codigo int unsigned auto_increment primary key,
    titulo varchar(32) not null,
    autor varchar(32) not null,
    stock int unsigned default 0,
    genero enum ('INF','HIS','NOV') 
);

create table PRESTAMO(
    codLibro int unsigned,
    codSocio int unsigned,
    fentrega date,
    fdevolucion date,

    constraint PK_PRES primary key (codLibro,codSocio,fentrega),
    constraint FK_PRES_LIB foreign key (codLibro) references LIBRO(codigo)
);