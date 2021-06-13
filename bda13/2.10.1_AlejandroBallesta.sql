-- 1.Número de ciudades.
db.cities.count();

-- 2.Datos de la ciudad de Elx.
db.cities.find({name:"Elx"}).pretty();

-- 3.Población de la ciudad de Vergel.
db.cities.find({name:"Vergel"},{population:1,_id:0});

-- 4.Cantidad de ciudades en España ({"country":"ES"}).
db.cities.count({country:"ES"});

-- 5.Datos de las ciudades españolas con más de 1.000.000 de habitantes.
db.cities.count({country:"ES",population:{$gt:1000000}});

-- 6.Cantidad de ciudades de Andorra ({"country":"AD"}) y España.
db.cities.find({$or:[ {country:"ES"},{country:"AD"} ]});

-- 7.Listado con el nombre y la población de las 10 ciudades más pobladas.
db.cities.find({population:{$gt:1,}},{name:true},{population:true},{_id:0}).sort({population:-1}).limit(10);

-- 8.Nombre de las distintas zonas horarias en España.
db.cities.distinct("timezone",{country:"ES"});

-- 9.Ciudades españolas que su zona horaria no sea Europe/Madrid.
db.cities.find({country:"ES",timezone:{$ne:"Europe/Madrid"}});

-- 10.Ciudades españolas que comiencen por Ben
db.cities.find({country:"ES",name:{$regex:"^Ben"}});

-- 11.Ciudades que su zona horaria sea Atlantic/Canary o Africa/Ceuta.
db.cities.find({$or:[ {timezone:" Atlantic/Canary"},{timezone:"Africa/Ceuta} ] });

-- 12.Nombre y población de las tres ciudades europeas más pobladas.
db.cities.find({timezone:{$regex:"^Europe"}},{name:true},{population:true}).sort({population:-1}).limit(3);

-- 13.Cantidad de ciudades españolas cuya coordenadas de longitud estén comprendidas entre -0.1 y 0.1.
