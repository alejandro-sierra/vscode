use biblioteca;
alter table LIBRO drop constraint FK_PRES_LIB;
alter table LIBRO modify codigo int unsigned unique;
alter table LIBRO drop primary key;
alter table LIBRO add constraint primary key PK_LIB (titulo);
alter table LIBRO add constraint FK_PRES_LIB foreign key (codLibro) references LIBRO (codigo);



-- alter table LIBRO disable keys;
-- alter table LIBRO  drop primary key;
-- alter table LIBRO add constraint PK_LIB primary key (titulo);


alter table LIBRO add constraint CHK_EJEMP check (stock >=2);