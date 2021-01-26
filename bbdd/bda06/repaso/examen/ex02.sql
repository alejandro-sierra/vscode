drop database examenddldml;
create database if not exists examenddldml;
use examenddldml;

create table ALUMNOS(
    id int unsigned auto_increment,
    dni varchar(9) unique,
    nombre varchar(64) not null,
    apellido varchar(64) not null,
    sexo enum ('H','M'),
    direccion varchar(128),
    telefono varchar(12),
    fnac date,
    constraint PK_ALU primary key (id)
);

create table ASIGNATURAS(
    id int unsigned auto_increment,
    nombre varchar(64) not null,
    aula int default (1),
    duracion int default (3),
    constraint PK_ASI primary key (id),
    constraint CH_AULA check (aula>=1 and aula<=10),
    constraint CH_DURA check (aula>=1 and aula<=12)
);

create table NOTAS(
    idAlumno int unsigned,
    idAsignatura int unsigned,
    fecha date not null,
    calificacion float,
    constraint PK_NOT primary key (idAlumno, idAsignatura),
    constraint FK_NOT_ALU foreign key (idAlumno) references ALUMNOS(id),
    constraint FK_NOT_ASI foreign key (idAsignatura) references ASIGNATURAS(id),
    constraint CK_CALI check (calificacion>=0.0 && calificacion<=10.0)
);