drop database academia;
create database if not exists academia;
use academia;


--Ejercicio01
create table PROFESOR(
    nombre varchar(32) unique,
    apellido1 varchar(32),
    apellido2 varchar(32),
    dni varchar(16),
    direccion varchar(64),
    titulo varchar(32),
    gana int(16) not null,
    constraint PK_PROF primary key (dni)
);

create table CURSO(
    nombre_curso varchar(64) unique,
    cod_curso int(16),
    dni_profesor varchar(16),
    maximo_alumnos int(16),
    fecha_inicio date,
    fecha_fin date,
    num_horas int(16) not null,
    constraint PK_CUR primary key (cod_curso),
    constraint CK_FECH check (fecha_inicio<fecha_fin),
    constraint FK_CUR_PROF foreign key (dni_profesor) references PROFESOR (dni)
);

create table ALUMNO(
    nombre varchar(32),
    apellido1 varchar(32),
    apellido2 varchar(32),
    dni varchar(16),
    direccion varchar(64),
    sexo enum ('H', 'M'),
    fecha_nacimiento date,
    curso int(16),
    constraint PK_ALU primary key (dni),
    constraint FK_ALU_CUR foreign key (curso) references CURSO (cod_curso)
);


--Ejercicio02
insert into PROFESOR values ('Juan','Arch','López','32432455','Pueta Negra, 4','Ing. Informática',7500);
insert into PROFESOR values ('María','Oliva','Rubio','43215643','Juan Alfonso 32','Lda. Fil. Inglesa',5400);

insert into CURSO values ('Inglés Básico',1,'43215643',15,'2000/11/01','2000/12/22',120);
insert into CURSO values ('Administracion Linux',2,'32432455',null,'2000/09/01',null,80);

insert into ALUMNO values ('Lucas','Manilva','López','123523','Alhamar 3','H','1979/11/01','1');
insert into ALUMNO values ('Antonia','López','Alcantara','2567567','Maniqui 21','M',null,'2');
insert into ALUMNO values ('Manuel','Alcantara','Pedrós','3123689','Julian 2',null,null,'2');
insert into ALUMNO values ('José','Pérez','Caballar','4896765','Julian 5','H','1977/02/03','2');

--Ejercicio03
-- insert into ALUMNO set nombre='Sergio',apellido1='Navas',apellido2='Retal',dni='123523',sexo='P';

--Ejercicio04
alter table PROFESOR add edad int(8);

--Ejercicio05
alter table PROFESOR add constraint CK_EDA check (edad>=18 && edad<=65);
alter table CURSO add constraint CK_MAXALU check (maximo_alumnos>=10);
-- alter table CURSO add constraint CK_NUMHOR check (num_horas>100);

--Ejercicio06
alter table ALUMNO modify sexo varchar(16);

--Ejercicio07
-- alter table ALUMNO modify curso int(16) unique;

--Ejercicio08
alter table PROFESOR modify gana int(16);

--Ejercicio09
alter table CURSO modify fecha_inicio date not null;

--Ejercicio10
alter table PROFESOR drop constraint PK_PROF;
alter table PROFESOR modify dni varchar(16) unique, add constraint PK_PROF primary key (nombre, apellido1,apellido2);

-- alter table CURSO drop constraint FK_CUR_PROF;
-- alter table PROFESOR drop primary key;
-- alter table PROFESOR add constraint primary key PK_PROF (nombre, apellido1, apellido2);
-- alter table CURSO add constraint FK_CUR_PROF foreign key (dni_profesor) references PROFESOR (dni);

--Ejercicio11
-- insert into ALUMNO values ('Juan','Arch','López','32432455','Pueta Negra, 4','Ing. Informática',null);
-- insert into ALUMNO ('María','Jaén','Sevilla','789678','Martos 5','M','1977/03/10','3');

--Ejercicio12
update ALUMNO set fecha_nacimiento='1976/12/23' where nombre='Antonia' and apellido1='López'; 

--Ejercicio13
-- update ALUMNO set curso=5 where nombre='Antonia' and apellido1='López';

--Ejercicio14
delete from PROFESOR where nombre='Laura' apellido1='Jimenez';