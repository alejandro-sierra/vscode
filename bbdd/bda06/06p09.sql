drop database idiomas if exists;
create database if not exists idiomas;
use idiomas;

create table CAPITAL(
    idCapital int (11),
    nombre varchar (255),
    constraint PK_CAP primary key (idCapital)
);

create table PAIS(
    idPais int (11),
    nombre varchar (64),
    capital int (11),
    constraint PK_PAI primary key (idPais),
    constraint FK_CAP_PAIS foreign key (capital) references CAPITAL (idCapital)
);

create table IDIOMA(
    idIdioma int (11),
    nombre varchar (255),
    constraint PK_IDI primary key (idIdioma)
);

create table IDIOMAPAIS(
    pais int (11),
    idioma int (11),
    constraint PK_IDIPAI primary key (pais, idioma),
    constraint FK_IDIPAI_PAI foreign key (pais) references PAIS (idPais),
    constraint FK_IDIPAI_IDI foreign key (idioma) references IDIOMA (idIdioma)
);

create table POBLACION(
    pais int (11),
    anyo year(4),
    poblacion int (11),
    constraint PK_POB primary key (pais, anyo),
    constraint FK_POB_PAI foreign key (pais) references PAIS (idPais)
);