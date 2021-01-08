drop database cocina;
CREATE DATABASE IF NOT EXISTS cocina;
USE cocina;

create table PAIS (
    nombrePa varchar (32) primary key,
    capital varchar (32)
);

create table INGREDIENTE (
    nombreIng varchar (64) primary key,
    metodo varchar (32),
    temp float,
    nombrePa varchar (32),
    constraint FK_ING_PAI foreign key (nombrePa) references PAIS (nombrePa)
);

create table RECETA (
    nombreRe varchar (64) primary key,
    precio float,
    tipo varchar (64),
    fructosa boolean,
    lactosa boolean,
    inspirarR varchar(64),
    nombrePa varchar(32),
    constraint FK_RE_PA foreign key (nombrePa) references PAIS (nombrePa),
    constraint FK_RE_RE foreign key (inspirarR) references RECETA (nombreRe)
);

create table COMPONER (
    nombreIng varchar (64),
    nombreRe varchar (64),
    cantidad int,
    preparacion varchar(64),
    constraint PK_COM  primary key (nombreIng,nombreRe),
    constraint FK_COM_ING foreign key (nombreIng) references INGREDIENTE (nombreIng),
    constraint FK_CON_RE foreign key (nombreRe) references RECETA (nombreRe)
);

create table CONCURSANTE (
    numeroCon int unsigned auto_increment primary key,
    nombreCon varchar (32),
    tipo varchar (64),
    nombrePa varchar(32) not null,
    constraint FK_CON_PA  foreign key (nombrePa) references PAIS (nombrePa)
);

create table TELEFONO (
    telefono varchar (12) primary key,
    numeroCon int unsigned,
    constraint FK_TEL_CON foreign key (numeroCon) references CONCURSANTE (numeroCon)
);

create table AMATEUR  (
    numeroAmat int unsigned primary key,
    constraint FK_AMA_CON foreign key (numeroAmat) references CONCURSANTE (numeroCon)
);

create table PROFESIONAL  (
    numeroProf int unsigned primary key,
    numeroAmat int unsigned not null,
    constraint FK_PROF_CON foreign key (numeroProf) references CONCURSANTE (numeroCon),
    constraint FK_PROF_AMA foreign key (numeroAmat) references AMATEUR (numeroAmat)
); 

create table RESTAURANTE (
    codigoRest int unsigned auto_increment primary key,
    nombrePa varchar (32) not null,
    numeroProf int unsigned not null,
    constraint FK_REST_PA foreign key (nombrePa) references PAIS (nombrePa),
    constraint FK_REST_PROF foreign key (numeroProf) references PROFESIONAL (numeroProf)
);

create table TRABAJAR (
    codigoRest int unsigned,
    numeroProf int unsigned, 
    ffin date,
    finicio date,
    constraint PK_TRA primary key (codigoRest,numeroProf,ffin),
    constraint FK_TRA_REST foreign key (codigoRest) references RESTAURANTE (codigoRest),
    constraint FK_TRA_PROF foreign key (numeroProf) references PROFESIONAL (numeroProf)
); 

create table PREMIO (
    nombrePre varchar (32) primary key,
    cuantia float
);

create table EDICION (
    numeroEdi int unsigned auto_increment,
    nombrePre varchar (32),
    lugar varchar (64),
    constraint PK_EDI primary key (numeroEdi,nombrePre),
    constraint FK_EDI_PRE foreign key (nombrePre) references PREMIO (nombrePre) 
);

create table GANAR (
    codigoRest int unsigned,
    numeroEdi int unsigned,
    nombrePre varchar (32),
    fecha date,
    constraint PK_GAN primary key (codigoRest,numeroEdi,nombrePre,fecha),
    constraint FK_GAN_REST foreign key (codigoRest) references RESTAURANTE (codigoRest),
    constraint FK_GAN_EDI foreign key (numeroEdi,nombrePre) references EDICION (numeroEdi,nombrePre)
);

/*
PAIS (nombrePa, capital)
    pk: nombre

INGREDIENTE (nombreIng, metodo, temp, nombrePa*)
    pk: nombreIng
    fk: nombrePa -> PAIS

RECETA (nombreRec ,precio, tipo, lactosa, fructosa, inspirarR*, nombrePa*)
    pk: nombreRec
    fk: nombrePa -> PAIS
    fk: inpirarR -> RECETA

COMPONER (nombrePa*, nombreIng*, cantidad, preparacion)
    pk: nombrePa, nombreIng
    fk: nombrePa -> PAIS
        nombreIng -> INGREDIENTE

CONCURSANTE (numeroCon, nombreCon, tipo, nombrePa*)
    pk: numeroCon
    fk: nombrePa -> PAIS
    VNN: nombrePa

TELEFONO (telefono, numeroCon*)
    pk: telefono
    fk: numeroCon -> CONCURSANTE

AMATEUR (numeroCon*)
    pk: numeroCon
    fk: numeroCon -> CONCURSANTE

PROFESIONAL (numeroCon*, numeroAmat*)
    pk: numeroCon
    fk: numeroCon -> CONCURSANTE
        numeroAmat -> AMATEUR
    VNN: numeroAmat


RESTAURANTE (codigoRest, nombreRest, cuidad, nombrePa*, numeroProf*)
    pk: codigoRest
    fk: nombrePa -> PAIS
        numeroProf -> PROFESIONAL
    VNN: nombrePa
    VNN: numeroProf

TRABAJAR (codigoRest*, numeroProf*, ffin, finicio)
    pk: codigoRest, numeroProf, ffin
    fk: codigoRest -> RESTAURANTE
        numeroProf -> PROFESIONAL

EDICION (numeroEdi, nombrePre*, lugar)
    pk: numeroEdi, nombrePre
    fk: nombrePre -> PREMIO

GANAR (codigoRest*, numeroEdi*,fecha)
    pk: codigoRest, numeroEdi,fecha
    fk: codigoRest -> RESTAURANTE
        numeroEdi -> EDICION

PREMIO(nombrePre, cuantia)
    pk: nombrePre
*/