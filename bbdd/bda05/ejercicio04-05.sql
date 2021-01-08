/*
DEPARTAMENTO(codD, nombre, direcc)
    pk:codD
    VNN:nombre
EMPLEADO(dni, nombrec, salario, direcc, departamento)
    pk: dni
    ak:nombrec
    VNN:nombrec, salario, departamento
    fk:departamento → DEPARTAMENTO
    ck:salario>=900
    Valor por defecto en salario de 900
*/

DROP DATABASE ejercicio04_05;
CREATE DATABASE IF NOT EXISTS ejercicio04_05;
USE ejercicio04_05;

CREATE TABLE DEPARTAMENTO(
    codD VARCHAR(32) PRIMARY KEY,
    nombre VARCHAR(32) NOT NULL,
    direcc VARCHAR(32)
);

CREATE TABLE EMPLEADO(
    dni CHAR(9) PRIMARY KEY,
    nombrec VARCHAR(32) UNIQUE NOT NULL,
    salario FLOAT NOT NULL DEFAULT 900 CHECK (salario >= 900),
    direcc VARCHAR(32),
    departamento VARCHAR(32) NOT NULL,
    CONSTRAINT FK_EMP_DEP FOREIGN KEY (departamento) REFERENCES DEPARTAMENTO(codD)
);

--INTRODUCCION DE DATOS

INSERT INTO DEPARTAMENTO VALUES ("ALMACEN","DEP ALMACEN 2.0","BAJO EL PUENTE");
INSERT INTO DEPARTAMENTO VALUES ("CONTABILIDAD","CONTAWIN","ENCIMA");

INSERT INTO EMPLEADO VALUES ("12345678A","Juan y Medio", 1000, "ELCHE","CONTABILIDAD");
INSERT INTO EMPLEADO VALUES ("12345678b","Juan y cUARTO", 2000, "ELCHE","ALMACEN");

--ALTER

alter table EMPLEADO drop constraint FK_EMP_DEP;

alter table EMPLEADO add constraint FK_EMP_DEP foreign key (departamento) references DEPARTAMENTO (codD);

drop table EMPLEADO, DEPARTAMENTO;