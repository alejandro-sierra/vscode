-- 1.Modifica la población de tu ciudad a 1.000.000
db.cities.update({name:"Elx"},{population:1000000});

-- 2.Incrementa la población de Elx en 666 personas.
db.cities.update({name:"Elx"}, {$inc:{population: 666}});

-- 3.Reduce la cantidad de todas las ciudades de Andorra en 5 personas.
db.cities.update({country:"AD"}, {$inc:{population:5}});

-- 4.Modifica la ciudad de Gibraltar para que sea española (tanto el país como la zona horaria).
db.cities.update({name:"Gibraltar"}, {country:"ES",timezone:"Atlantic/Canary"});

-- 5.Modifica todas las ciudades y añade un atributo tags que contenga un array vacío.
db.cities.update({},{$set:{"tag":[]}},{upsert:false,multi:true});

-- 6.Modifica todas las ciudades españolas y añade al atributo tags el valor sun.
db.cities.update({country:"ES"}, {$push:{tags:"sun"}};

-- 7.Modifica el valor de sun de la ciudad A Coruña y sustitúyelo por rain.
db.cities.update({name:"A Coruña",tags:"sun"}, {$set:{"tags.$":"rain"}});

-- 8.Renombra en las ciudades de Andorra, el atributo population por poblacion.
db.cities.update({country:"AD"}, {$rename:{"population":"poblacion"}});

-- 9.Elimina las coordenadas de Gibraltar.
 db.cities.update({name:"Gibraltar"}, {$pull:{tags:["latitude","longitude"]}});

-- 10.Elimina tu entrada
