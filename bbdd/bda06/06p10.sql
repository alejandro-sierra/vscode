use idioma;
load data local infile 'recursos/capitales.txt' into table CAPITAL fields terminated by ',' lines terminated by '\n';

load data local infile 'recursos/idiomas.txt' into table IDIOMA fields terminated by ',' lines terminated by '\n';

load data local infile 'recursos/paises.txt' into table PAIS fields terminated by ',' lines terminated by '\n';

load data local infile 'recursos/poblaciones.txt' into table POBLACION fields terminated by ',' lines terminated by '\n';