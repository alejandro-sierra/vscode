F-- 1. Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también
-- debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos
-- columnas, una con el nombre del fabricante y otra con el número de productos que tiene.
-- Ordene el resultado descendentemente por el número de productos.
select f.nombre, count(p.codigo) from fabricante f left join producto p on p.codigo_fabricante = f.codigo group by f.nombre order by count(p.codigo) desc;

-- 2. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los
-- fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
select f.nombre, max(p.codigo),min(p.codigo),avg(p.codigo) from fabricante f left join producto p on p.codigo_fabricante = f.codigo group by f.nombre;

-- 3. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los
-- fabricantes que tienen un precio medio superior a 190€. No es necesario mostrar el nombre del
-- fabricante, con el código del fabricante es suficiente.
select f.codigo, max(p.precio),min(p.precio),avg(p.precio),count(p.precio) from producto group by codigo_fabricante having avg(p.precio)>190;

-- 4. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio
-- medio y el número total de productos de los fabricantes que tienen un precio medio superior a
-- 190€. Es necesario mostrar el nombre del fabricante.
select f.codigo,f.nombre, max(p.precio),min(p.precio),avg(p.precio),count(p.precio) from fabricante f left join producto p on p.codigo_fabricante = f.codigo
                     group by f.codigo having avg(p.precio)>190;

-- 5. Calcula el número de productos que tienen un precio mayor o igual a 190€.
select codigo,nombre from producto where precio>=190 group by codigo,nombre

-- 6. Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 190€.
select f.nombre,count(p.codigo) as "nº productos" from fabricante f join producto p on f.codigo = p.codigo_fabricante where p.precio>=190 group by f.nombre;

-- 7. Lista el precio medio los productos de cada fabricante, mostrando solamente el código del
-- fabricante.
select p.codigo_fabricante, avg(p.precio) from producto group by p.codigo_fabricante;

-- 8. Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del
-- fabricante.
select f.nombre, avg(p.precio) from fabricante f join producto p on f.codigo = p.codigo_fabricante group by f.nombre;

-- 9. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
select f. nombre from fabricante f join producto p on f.codigo = p.codigo_fabricante group by f.nombre having avg(p.precio)>=150;

-- 10. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
select f.nombre from fabricante f join producto p on f.codigo = p.codigo_fabricante group by f.nombre having count(p.codigo)>=2;

-- 11. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene
-- cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los
-- fabricantes que no tienen productos que cumplan la condición.
select f.nombre,count(p.codigo) from fabricante f join producto p on f.codigo = p.codigo_fabricante where p.precio>=220 group by f.nombre;

-- 12. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene
-- cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los
-- fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o
-- igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.
select f.nombre,count(p.codigo) from fabricante f left join producto p on f.codigo = p.codigo_fabricante and p.precio>=220 group by f.nombre;
--esto realiza la comparacion de los precios antes de hacer el join, si lo pones con el where lo hace despues y no responde nada

-- 13. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus
-- productos es superior a 900 €.
select f.nombre,sum(p.precio) from fabricante f join producto p on f.codigo = p.codigo_fabricante group by f.nombre having sum(p.precio)>=900;

-- 14. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El
-- resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El
-- resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del
-- fabricante.
select f.nombre,max(p.precio),p.nombre from fabricante f join producto p on f.codigo = p.codigo_fabricante group by f.nombre;

--Subconsultas
-- 15. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
select * from producto where codigo_fabricante = (select codigo from fabricante where nombre="Lenovo");

-- 16. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más
-- caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
select p.* from producto p where p.precio = (select max(precio) from producto p join fabricante f on p.codigo_fabricante=f.codigo where f.nombre="Lenovo");

select * from producto where precio >all (select precio from producto where codigo_fabricante = (select codigo from fabricante where nombre='Lenovo')); --mal

-- 17. Lista el nombre del producto más caro del fabricante Lenovo.
select nombre,max(precio) from producto where codigo_fabricante = (select codigo from fabricante where nombre="Lenovo");

-- 18. Lista el nombre del producto más barato del fabricante Crucial.
select nombre,min(precio) from producto where codigo_fabricante = (select codigo from fabricante where nombre="Crucial");

-- 19. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al
-- producto más caro del fabricante Lenovo.
select p.* from producto p where p.precio >= (select max(precio) from producto p join fabricante f on p.codigo_fabricante=f.codigo where f.nombre="Lenovo");

select * from producto where precio >=all (select precio from producto where codigo_fabricante = (select codigo from fabricante where nombre='Lenovo'));--mal

-- 20. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de
-- todos sus productos.
-- Subconsultas con ALL y ANY
select * from producto where codigo_fabricante =all (select codigo from fabricante where nombre="Asus" or precio <all (select avg(precio) from producto));
--no hay ningun producot de Asus que supere la media de todos los productos (la media es de 271,7236)

-- 21. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER
-- BY ni LIMIT.
select * from producto where precio >=all (select precio from producto p);

-- 22. Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN,
-- ORDER BY ni LIMIT.
select * from producto where precio <=all (select p.precio from producto p);

-- 23. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o
-- ANY).
select f.nombre from fabricante f where f.codigo = any (select p.codigo_fabricante from producto p);

-- 24. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o
-- ANY).
select nombre from fabricante where codigo =any (select codigo_fabricante from producto);

-- Subconsultas con IN y NOT IN
-- 25. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT
-- IN).
select nombre from fabricante where codigo in (select codigo_fabricante from producto);

-- 26. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o
-- NOT IN).
select nombre from fabricante where codigo not in (select codigo_fabricante from producto);

-- 27.Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
select nombre from fabricante f where exists (select codigo_fabricante from producto WHERE f.codigo=codigo_fabricante);

-- 28.Devuelve   los   nombres   de   los   fabricantes   que   no   tienen   productos   asociados.   (UtilizandoEXISTS o NOT EXISTS)
select nombre from fabricante f where not exists (select codigo_fabricante from producto WHERE f.codigo=codigo_fabricante);
