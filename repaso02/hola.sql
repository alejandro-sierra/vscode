drop database hola;
create database if not exists hola;
use hola;

create table(
    constraint 
    foreign key
    load data local infile 'datos.txt' into table PROFESOR fields terminated by ',' lines terminated by '\n';

    insert into PROFESOR values ('');

    insert into PROFESOR set nombre='1', apellido='2';

    insert into nombre_tabla values (dato1, dato2, dato3, null, dato5);

insert into nombre_tabla set nombre='Juan', apellido1='Lopez', apellido2='Sierra';

    update PROFESOR set nombre='pepe' where dni='121312321A';
    delete from PROFESOR where nombre='pepe';

    drop 

);