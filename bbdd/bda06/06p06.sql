alter table LIBRO disable keys;
alter table LIBRO  drop primary key;
alter table LIBRO add constraint PK_LIB primary key (titulo);

-- alter table LIBRO

alter table LIBRO add constraint CHK_EJEMP check (stock >=2);