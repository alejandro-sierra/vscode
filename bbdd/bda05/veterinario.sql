drop database veterianrio;
create database if not exists veterianrio;
use veterianrio;

create table CLIENTE(
    dni varchar (9) primary key,
    cnombre varchar (50),
    direccion varchar (60)
);

create table MASCOTA (
    codigo integer primary key,
    nombre varchar (50),
    raza varchar (50)
);

alter table MASCOTA add especie varchar(10) raza;
alter table MASCOTA add cliente varchar (9) after nombre;
alter table MASCOTA add constraint FK_DUENYO foreign key (cliente)
    references CLIENTE (dni);
alter table MASCOTA modify codigo int(3) auto_increment;