drop database if exists prueba01;
create database if not exists prueba01;
use prueba01;

create table DEPARTAMENTO(
    cod_departamento varchar(16),
    nombre varchar(64) not null,
    direccion varchar(128),
    constraint PK_DEP primary key (cod_departamento)
);

create table EMPLEADO(
    dni varchar(16),
    nombre varchar(64) unique not null,
    salario int(16) not null default 900 check (salario>=900),
    direccion varchar(128),
    departamento varchar(16) not null,
    constraint PK_EMP primary key (dni),
    constraint FK_EMP_DEP foreign key (departamento) references DEPARTAMENTO (cod_departamento) 
);
alter table EMPLEADO drop constraint FK_EMP_DEP;
alter table EMPLEADO add constraint FK_EMP_DEP foreign key (departamento) references DEPARTAMENTO (cod_departamento);


-- drop table EMPLEADO, DEPARTAMENTO;

insert into DEPARTAMENTO values ('DIR','Direccion','Planta 6');
insert into DEPARTAMENTO values ('I+D','Desarrollo','Planta 5');
insert into DEPARTAMENTO values ('ADM','Administracion','Planta 4');
insert into DEPARTAMENTO values ('LOG','Logistica',null);
insert into DEPARTAMENTO values ('RRHH','Recursos Humanos','Planta 1');

insert into EMPLEADO set dni='1234567A',nombre='Juan',salario=1200,departamento='RRHH';
insert into EMPLEADO set dni='1234567B',nombre='Alejandro',salario=4300,direccion='Calle Alcala 13',departamento='DIR';
insert into EMPLEADO set dni='1234567C',nombre='Pepe',salario=900,departamento='LOG';
insert into EMPLEADO set dni='1234567D',nombre='Antonio',salario=1300,departamento='ADM';
insert into EMPLEADO set dni='1234567E',nombre='Elena',salario=1800,departamento='I+D';

insert into EMPLEADO values ('1234567F','Elias',900,'Calle Manga Varde 2','RRHH'),
                            ('1234567G','Lucia',1200,'Calle Manga Roja 3','LOG'),
                            ('1234567H','Jesus',900,null,'ADM'),
                            ('1234567I','Marcos',3200,null,'DIR'),
                            ('1234567J','Andrea',1100,null,'LOG');

