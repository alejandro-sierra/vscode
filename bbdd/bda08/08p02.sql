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
select p.nombre as nombreProducto,precio,f.nombre as nombreFabricante

-- 5. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más
-- caro.

-- 6. Devuelve una lista de todos los productos del fabricante Lenovo.

-- 7. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor
-- que 200€.

-- 8. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy
-- Seagate. Sin utilizar el operador IN.

-- 9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy
-- Seagate. Utilizando el operador IN.

-- 10. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo
-- nombre termine por la vocal e.

-- 11. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de
-- fabricante contenga el carácter w en su nombre.

-- 12. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los
-- productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por
-- el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)

-- 13.Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantesque tienen productos asociados en la base de datos.

-- 17. Calcula el número total de productos que hay en la tabla productos.

-- 18. Calcula el número total de fabricantes que hay en la tabla fabricante.

-- 19. Calcula el número de valores distintos de código de fabricante aparecen en la tabla productos.

-- 20. Calcula la media del precio de todos los productos.

-- 21. Calcula el precio más barato de todos los productos.

-- 22. Calcula el precio más caro de todos los productos.

-- 23. Lista el nombre y el precio del producto más barato.

-- 24. Lista el nombre y el precio del producto más caro.

-- 25. Calcula la suma de los precios de todos los productos.

-- 26. Calcula el número de productos que tiene el fabricante Asus.

-- 27. Calcula la media del precio de todos los productos del fabricante Asus.

-- 28. Calcula el precio más barato de todos los productos del fabricante Asus.

-- 29. Calcula el precio más caro de todos los productos del fabricante Asus.

-- 30. Calcula la suma de todos los productos del fabricante Asus.

-- 31.Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que
-- tiene el fabricante Crucial.