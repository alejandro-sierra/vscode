source ex02.sql;
alter table ALUMNOS rename to ALUMNO;
alter table ASIGNATURAS rename to ASIGNATURA;
alter table NOTAS rename to NOTA;

alter table NOTA add recuperacion int;
alter table NOTA add constraint CK_REC check (recuperacion=>0 and recuperacion<=10);

alter table ALUMNO modify sexo enum ('H','M','I');

alter table NOTA disable keys;
alter table NOTA drop constraint PK_NOT;
alter table add constraint PK_NOT primary key (idAlumno, idAsignatura, fecha);
alter table NOTA enable keys;


-- alter table 