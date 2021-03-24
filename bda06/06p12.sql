alter table IDIOMA add valoracion tinyint default 5;

update IDIOMA set valoracion=+2 where nombre='Alemania, Luxemburgo, Países Bajos';