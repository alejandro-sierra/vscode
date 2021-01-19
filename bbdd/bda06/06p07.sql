source 06p05.sql;
delete from LIBRO where titulo='Historia de España';
alter table PRESTAMO drop constraint FK_PRES_LIB;

alter table PRESTAMO add constraint FK_PRES_LIB foreign key (codLibro) references LIBRO (codigo) on delete cascade;
delete from LIBRO where titulo='Historia de España';