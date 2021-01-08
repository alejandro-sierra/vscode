
alter table INGREDIENTE modify metodo varchar(32) not null;


alter table COMPONER modify cantidad int not null;


alter table RECETA modify tipo enum('ENTRANTE','PLATO','POSTRE') not null, modify lactosa enum('SI','NO'), modify fructosa enum('SI','NO');


alter table CONCURSANTE modify tipo enum('PROFESIONAL','AMATEUR') default 'PROFESIONAL' not null;


alter table PAIS modify capital varchar(32) unique not null;


alter table RECETA add vino enum('BLANCO','ROSADO','TINTO'), add cubierto enum('CARNE','PESCADO');


alter table INGREDIENTE drop temp;


alter table PREMIO add constraint CHK_CUANTIA check (cuantia>1000);