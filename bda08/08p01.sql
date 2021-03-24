    -- 1. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los
-- productos de la base de datos.
select p.nombre as nombreProducto ,precio,f.nombre as nombreFabricante from producto p join fabricante f on p.codigo_fabricante=f.c odigo;

-- 2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los
-- productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden
-- alfabético.
select p.nombre as nombreProducto ,precio,f.nombre as nombreFabricante from producto p join fabricante f on p.codigo_fabricante=f.codigo order by f.nombre;

-- 3. Devuelve una lista con el código del producto, nombre del producto, código del fabricante y
-- nombre del fabricante, de todos los productos de la base de datos.
select p.codigo as codigoProducto,p.nombre as nombreProducto,f.codigo as codigoFabricante,f.nombre as nombreFabricante from producto p join fabricante f on p.codigo_fabricante=f.codigo;

-- 4. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más
-- barato.
select p.nombre as nombreProducto,precio,f.nombre as nombreFabricante from producto p join fabricante f on p.codigo_fabricante=f.codigo order by precio limit 1;

-- 5. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más
-- caro.
select p.nombre as nombreProducto,precio,f.nombre as nombreFabricante from producto p join fabricante f on p.codigo_fabricante=f.codigo order by precio desc limit 1;

-- 6. Devuelve una lista de todos los productos del fabricante Lenovo.
select * from producto p join fabricante f on p.codigo_fabricante=f.codigo where f.nombre="Lenovo";

-- 7. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor
-- que 200€.
select * from producto p join fabricante f on p.codigo_fabricante=f.codigo where f.nombre="Crucial" and precio>200;

-- 8. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y
-- Seagate. Sin utilizar el operador IN.
select * from producto p join fabricante f on p.codigo_fabricante=f.codigo where f.nombre="Asus" or f.nombre="Hewlett-Packard" or f.nombre="Seagate";

-- 9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy
-- Seagate. Utilizando el operador IN.
select * from producto p join fabricante f on p.codigo_fabricante=f.codigo where f.nombre in ("Asus","Hewlett-Packard","Seagate");

-- 10. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo
-- nombre termine por la vocal e.
select p.nombre,precio,f.nombre from producto p join fabricante f on p.codigo_fabricante=f.codigo where f.nombre like '%e';

-- 11. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de
-- fabricante contenga el carácter w en su nombre.
select p.nombre,precio,f.nombre from producto p join fabricante f on p.codigo_fabricante=f.codigo where f.nombre like '%w%';

-- 12. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los
-- productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por
-- el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
select p.nombre,precio,f.nombre from producto p join fabricante f on p.codigo_fabricante=f.codigo where precio>=180 order by precio desc,f.nombre asc;

-- 13.Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantesque tienen productos asociados en la base de datos.
select distinct f.codigo,f.nombre from fabricante f join producto p on f.codigo=p.codigo_fabricante;

-- 17. Calcula el número total de productos que hay en la tabla productos.
select count(*) from producto; 

-- 18. Calcula el número total de fabricantes que hay en la tabla fabricante.
select count(*) from fabricante; 

-- 19. Calcula el número de valores distintos de código de fabricante aparecen en la tabla productos.
select count(distinct codigo_fabricante) from producto;

-- 20. Calcula la media del precio de todos los productos.
select avg(precio) from producto;

-- 21. Calcula el precio más barato de todos los productos.
select min(precio) from producto;

-- 22. Calcula el precio más caro de todos los productos.
select max(precio) from producto;

-- 23. Lista el nombre y el precio del producto más barato.
select nombre,precio from producto order by precio limit 1;

-- 24. Lista el nombre y el precio del producto más caro.
select nombre,precio from producto order by precio desc limit 1;

-- 25. Calcula la suma de los precios de todos los productos.
select sum(precio) from producto;

-- 26. Calcula el número de productos que tiene el fabricante Asus.
select count(f.nombre) from producto p join fabricante f on p.codigo_fabricante=f.codigo where f.nombre="Asus";

-- 27. Calcula la media del precio de todos los productos del fabricante Asus.
select avg(precio) from producto p join fabricante f on p.codigo_fabricante=f.codigo where f.nombre="Asus";

-- 28. Calcula el precio más barato de todos los productos del fabricante Asus.
select min(precio) from producto p join fabricante f on p.codigo_fabricante=f.codigo where f.nombre="Asus";

-- 29. Calcula el precio más caro de todos los productos del fabricante Asus.
select max(precio) from producto p join fabricante f on p.codigo_fabricante=f.codigo where f.nombre="Asus";

-- 30. Calcula la suma de todos los productos del fabricante Asus.
select sum(precio) from producto p join fabricante f on p.codigo_fabricante=f.codigo where f.nombre="Asus";

-- 31.Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que
-- tiene el fabricante Crucial.
select max(precio),min(precio),avg(precio),sum(precio) from producto p join fabricante f on p.codigo_fabricante=f.codigo where f.nombre="Asus";


-- LEFT JOIN y RIGHT JOIN
-- 14. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los
-- productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes
-- que no tienen productos asociados.
select * from fabricante f left join producto p on f.codigo=p.codigo_fabricante; 

-- 15. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto
-- asociado.
select * from fabricante f left join producto p on f.codigo=p.codigo_fabricante where p.codigo is null;

-- 16. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su
-- respuesta.
--No ya que en la propia base de datos hay una restriccion de que un producto tiene que tener asociando un fabricante.