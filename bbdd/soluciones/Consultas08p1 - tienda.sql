
/*--------------------Consultas multitabla--------------------*/
/*(Composición interna)
1. Devuelve una lista con el nombre del producto, 
precio y nombre de fabricante de todos los
productos de la base de datos.*/

SELECT p.nombre as proNom, 
       precio as proPre, 
       f.nombre as fanNom
FROM producto p
     JOIN fabricante f ON p.codigo = f.codigo;

/*2. Devuelve una lista con el nombre del producto, 
precio y nombre de fabricante de todos los
productos de la base de datos. Ordene el resultado por 
el nombre del fabricante, por orden
alfabético.*/

SELECT p.nombre as proNom, 
       precio as proPre, 
       f.nombre as faNom
FROM producto p
     JOIN fabricante f ON p.codigo = f.codigo
ORDER BY f.nombre ASC;

/*3. Devuelve una lista con el código del producto, 
nombre del producto, código del fabricante y
nombre del fabricante, de todos los productos de la base de datos.*/

SELECT p.codigo as proCod, 
       p.nombre as proPre, 
       f.codigo as faCod
FROM producto p
     JOIN fabricante f ON p.codigo = f.codigo;

/*4. Devuelve el nombre del producto, su precio y el nombre 
de su fabricante, del producto más barato.*/

SELECT p.nombre as proNom, 
       precio as proPre, 
       f.nombre as faNom
FROM producto p
     JOIN fabricante f ON p.codigo = f.codigo
ORDER BY p.precio;

/*5. Devuelve el nombre del producto, su precio y el 
nombre de su fabricante, del producto más caro.*/

SELECT p.nombre as proNom, 
       precio as proPre, 
       f.nombre as faNom
FROM producto p
     JOIN fabricante f ON p.codigo = f.codigo
ORDER BY p.precio DESC;

/*6. Devuelve una lista de todos los productos del
 fabricante Lenovo.*/

SELECT p.nombre
FROM producto p
     JOIN fabricante f ON p.codigo = f.codigo
WHERE f.nombre = 'lenovo';

/*7. Devuelve una lista de todos los productos del fabricante 
Crucial que tengan un precio mayor que 200€.*/

SELECT p.nombre
FROM producto p
     JOIN fabricante f ON p.codigo = f.codigo
WHERE f.nombre = 'crucial'
      AND precio > 200;

/*8. Devuelve un listado con todos los productos de los fabricantes Asus, 
Hewlett-Packardy Seagate. Sin utilizar el operador IN.*/
SELECT p.nombre as proNom,
     f.nombre as faNom
FROM producto p
     JOIN fabricante f ON p.codigo = f.codigo
WHERE f.nombre = 'Asus'
      OR f.nombre = 'Seagate'
      OR f.nombre = 'Hewlett-Packardy';

/*9. Devuelve un listado con todos los productos de los 
fabricantes Asus, Hewlett-Packardy
Seagate. Utilizando el operador IN.*/
SELECT p.nombre AS proNom, 
       f.nombre AS faNom
FROM producto p
     JOIN fabricante f ON p.codigo = f.codigo
WHERE f.nombre = 'Asus'
      OR f.nombre = 'Seagate'
      OR f.nombre = 'Hewlett-Packard';

/*10. Devuelve un listado con el nombre y el precio de todos 
los productos de los fabricantes cuyo
nombre termine por la vocal e.*/
SELECT p.nombre, 
       p.precio AS proNomPre, 
       f.nombre AS faNom
FROM producto p
     JOIN fabricante f ON p.codigo = f.codigo
WHERE f.nombre LIKE "%e";

/*11. Devuelve un listado con el nombre y el precio de todos 
los productos cuyo nombre de
fabricante contenga el carácter w en su nombre.*/
SELECT p.nombre, 
       p.precio AS proNomPre, 
       f.nombre AS faNom
FROM producto p
     JOIN fabricante f ON p.codigo = f.codigo
WHERE f.nombre LIKE "%w%";

/*12. Devuelve un listado con el nombre de producto, 
precio y nombre de fabricante, de todos los
productos que tengan un precio mayor o igual a 180€. 
Ordene el resultado en primer lugar por
el precio (en orden descendente) y en 
segundo lugar por el nombre (en orden ascendente)*/

SELECT p.nombre, 
       p.precio AS proNomPre, 
       f.nombre AS faNom
FROM producto p
     JOIN fabricante f ON p.codigo = f.codigo
WHERE p.precio >= 180
ORDER BY p.precio DESC, 
         p.nombre ASC;


/* Consultas multitabla (Composición externa)
Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.*/

/*14. Devuelve un listado de todos los fabricantes que existen en la base de datos,
 junto con los productos que tiene cada uno de ellos. El listado deberá mostrar 
 también aquellos fabricantes que no tienen productos asociados.
 LEFT JOIN */

SELECT f.codigo, f.nombre, p.codigo, p.nombre, p.precio
FROM fabricante f
     left JOIN producto p ON p.codigo_fabricante = f.codigo;

/*15. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen 
ningún producto asociado.*/
SELECT f.nombre as faNOm, p.nombre as proNom
FROM fabricante f  
     LEFT JOIN producto p ON p.codigo_fabricante = f.codigo
     WHERE p.odigo is null;

/*16. ¿Pueden existir productos que no estén relacionados con un fabricante? 
Justifique su respuesta.
--> No, puesto que la clave primaria de productos es también clave ajena de 
fabricante, al depender de la calve primaria de fabricante, está no puede ser nula. 
--> se comprueba con create table
*/


/*-----------Consultas con funciones agregadas-----------------*/
/*17. Calcula el número total de productos que hay en 
la tabla productos.*/
SELECT COUNT(*)
FROM producto;

/*18. Calcula el número total de fabricantes que hay en 
la tabla fabricante.*/
SELECT COUNT(*)
FROM fabricante;


/*19. Calcula el número de valores distintos de código 
de fabricante aparecen en la tabla productos.*/
SELECT COUNT(DISTINCT codigo_fabricante)
FROM producto;

/*20. Calcula la media del precio de todos los productos.*/
SELECT AVG(precio)
FROM producto;

/*21. Calcula el precio más barato de todos los productos.*/
SELECT MIN(precio)
FROM producto;

/*22. Calcula el precio más caro de todos los productos.*/
SELECT MAX(precio)
FROM producto;

/*23. Lista el nombre y el precio del producto más barato.*/
SELECT nombre, 
       MIN(precio)
FROM producto;

/*24. Lista el nombre y el precio del producto más caro.*/
SELECT nombre, 
       MAX(precio)
FROM producto;

/*25. Calcula la suma de los precios de todos los productos.*/
SELECT SUM(precio)
FROM producto;

/*26. Calcula el número de productos que tiene el fabricante Asus.*/
SELECT COUNT(*)
FROM fabricante
WHERE nombre = 'Asus';

/*27. Calcula la media del precio de todos los productos del 
fabricante Asus.*/
SELECT AVG(precio), 
       f.nombre AS faNom
FROM producto p
     JOIN fabricante f ON p.codigo = f.codigo
WHERE f.nombre = 'ASUS';

/*28. Calcula el precio más barato de todos los productos 
del fabricante Asus.*/
SELECT MIN(precio), 
       f.nombre AS faNom
FROM producto p
     JOIN fabricante f ON p.codigo = f.codigo
WHERE f.nombre = 'ASUS';

/*29. Calcula el precio más caro de todos los 
productos del fabricante Asus.*/
SELECT MAX(precio), 
       f.nombre AS faNom
FROM producto p
     JOIN fabricante f ON p.codigo = f.codigo
WHERE f.nombre = 'ASUS';

/*30. Calcula la suma de todos los productos del fabricante Asus.*/
SELECT SUM(precio), 
       f.nombre AS faNom
FROM producto p
     JOIN fabricante f ON p.codigo = f.codigo
WHERE f.nombre = 'ASUS';

/*31.Muestra el precio máximo, precio mínimo, 
precio medio y el número total de productos que
tiene el fabricante Crucial.*/
SELECT MIN(precio), 
       MAX(precio), 
       AVG(precio), 
       COUNT(p.nombre)
FROM producto p
     JOIN fabricante f ON p.codigo = f.codigo
WHERE f.nombre = 'Crucial';

/*************************************************/
/***********Consultas agrupadas********************/
/*************************************************/

/*1. Muestra el número total de productos que tiene cada 
uno de los fabricantes. El listado también
debe incluir los fabricantes que no tienen ningún producto. 
El resultado mostrará dos columnas, una con el nombre del 
fabricante y otra con el número de productos que tiene.
Ordene el resultado descendentemente por el número de productos.*/
SELECT f.nombre, 
       COUNT(p.codigo)
FROM fabricante f
     LEFT JOIN producto p ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre
order by count(p.nombre)desc;

/*2. Muestra el precio máximo, precio mínimo y precio medio 
de los productos de cada uno de los fabricantes.
El resultado mostrará el nombre del fabricante junto con 
los datos que se solicitan.
*/
SELECT f.nombre, 
       MAX(p.precio) AS preMax, 
       MIN(p.precio) AS preMin, 
       AVG(p.precio) AS media
FROM fabricante f
     LEFT JOIN producto p ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre;



/*3. Muestra el precio máximo, precio mínimo, precio medio 
y el número total de productos de los fabricantes que tienen 
un precio medio superior a 190€. No es necesario mostrar el nombre del
fabricante, con el código del fabricante es suficiente.*/
SELECT p.codigo_fabricante 
       MAX(p.precio), 
       MIN(p.precio) AS preMin, 
       AVG(p.precio) AS media
FROM fabricante f
GROUP BY f.nombre
HAVING media > 190;

/*4. Muestra el nombre de cada fabricante, junto con el precio máximo, 
precio mínimo, precio medio y el número total de productos de los 
fabricantes que tienen un precio medio superior a
190€. Es necesario mostrar el nombre del fabricante.*/
SELECT f.nombre, 
       MAX(p.precio), 
       MIN(p.precio) AS preMin, 
       AVG(p.precio) AS media, 
       COUNT(p.codigo) AS totalProd
FROM fabricante f
     LEFT JOIN producto p ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre
HAVING media > 190;

/*5. Calcula el número de productos que tienen un precio mayor
 o igual a 190€.*/
SELECT DISTINCT 
       count(*)
FROM producto p
WHERE precio >= 190;

/*6. Calcula el número de productos que tiene cada fabricante con 
un precio mayor o igual a 190€. */
SELECT f.nombre, 
       COUNT(p.codigo), 
       p.precio
FROM fabricante f
     LEFT JOIN producto p ON p.codigo_fabricante = f.codigo
where p.precio >=190
GROUP BY f.nombre;

/*7. Lista el precio medio los productos de cada fabricante, 
mostrando solamente el código del fabricante.*/
SELECT p.codigo_fabricante,
     avg(p.precio) as media
     FROM fabricante f
GROUP BY p.codigo_fabricante;
      
/*8. Lista el precio medio, los productos de cada fabricante, mostrando 
solamente el nombre del fabricante.*/
SELECT f.nombre AS nomFabricante
FROM fabricante f
     LEFT JOIN producto p ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre
HAVING AVG(p.precio);

/*9. Lista los nombres de los fabricantes cuyos productos tienen un precio
 medio mayor o igual a 150€.*/
SELECT f.nombre AS nomFabricante
FROM fabricante f
     LEFT JOIN producto p ON p.codigo_fabricante = f.codigo
WHERE p.precio >= 190
GROUP BY f.nombre;

/*10. Devuelve un listado con los nombres de los fabricantes que tienen
 2 o más productos.*/
 SELECT f.nombre AS nomFabricante
FROM fabricante f
     LEFT JOIN producto p ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre
having p.codigo >= 2;

/*11. Devuelve un listado con los nombres de los fabricantes y el número 
de productos que tiene cada uno con un precio superior o igual a 220 €. 
No es necesario mostrar el nombre de los fabricantes que no tienen 
productos que cumplan la condición.*/
SELECT f.nombre AS nomFabricante, 
       COUNT(p.codigo) AS numProd
FROM fabricante f
WHERE p.precio > 220
GROUP BY f.nombre;

/*12. Devuelve un listado con los nombres de los fabricantes y el número 
de productos que tiene cada uno con un precio superior o igual a 220 €. 
El listado debe mostrar el nombre de todos los fabricantes, es decir, 
si hay algún fabricante que no tiene productos con un precio superior o
igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el 
número de productos.*/ 
/*--????????????!!!!!!!!!!!!!! --
--????????????!!!!!!!!!!!!!! --*/
SELECT f.nombre, 
       COUNT(p.codigo), 
FROM fabricante f
     LEFT JOIN producto p ON p.codigo_fabricante = f.codigo
     and p.precio >= 200
GROUP BY f.nombre;
/*--????????????!!!!!!!!!!!!!! --
--????????????!!!!!!!!!!!!!! --*/

/*13. Devuelve un listado con los nombres de los fabricantes donde 
la suma  del precio de todos sus productos es superior a 900 €.*/
/*--????????????!!!!!!!!!!!!!! --
--????????????!!!!!!!!!!!!!! --*/
SELECT f.nombre
FROM fabricante f
     LEFT JOIN producto p ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre
having SUM(p.precio) >= 900 ;
/*--????????????!!!!!!!!!!!!!! --
--????????????!!!!!!!!!!!!!! --*/

/*14. Devuelve un listado con el nombre del producto más caro que tiene 
cada fabricante. El resultado debe tener tres columnas: 
nombre del producto, precio y nombre del fabricante. El resultado 
tiene que estar ordenado alfabéticamente de menor a mayor por el 
nombre del fabricante.*/
SELECT f.nombre AS FABRICANTE, 
       p.nombre AS producto, 
       MAX(p.precio) AS PRECIO
FROM fabricante f
     LEFT JOIN producto p ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre
ORDER BY f.nombre;

/**********************************************************************************************/
/********Subconsultas - En la cláusula WHERE, con operadores básicos de comparación**************/
/**********************************************************************************************/

/*15. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).*/
SELECT p.nombre
from producto p
where p.codigo_fabricante in (select 
     f.codigo
     from fabricante f
     where f.nombre='Lenovo');

/*16. Devuelve todos los datos de los productos que tienen 
el mismo precio que el producto más
caro del fabricante Lenovo. (Sin utilizar INNER JOIN).*/
/**????????????????????????????????????**/
SELECT p.*
from producto p 
where p.precio = 
     (SELECT
          max(p.precio)
          from producto p join fabricante f
               on p.codigo_fabricante = f.codigo
          WHERE f.nombre='Lenovo');


SELECT *
FROM producto
WHERE precio >= all (
     SELECT p.precio
     FROM producto p
     WHERE p.codigo_fabricante = (SELECT f.codigo
     FROM fabricante f WHERE f.nombre='Lenovo'));
 

/**????????????????????????????????????**/
 /*17. Lista el nombre del producto más caro del fabricante
  Lenovo.*/
SELECT p.*
from producto p 
where p.precio = 
     (SELECT
          max(p.precio)
          from producto pr join fabricante f
               on pr.codigo_fabricante = f.codigo
          WHERE f.nombre='Lenovo'
               and pr.codigo_fabricante = p.codigo_fabricante);

/*18. Lista el nombre del producto más barato del 
fabricante Crucial.*/
SELECT p.*
from producto p 
where p.precio = 
     (SELECT
          min(p.precio)
          from producto pr join fabricante f
               on pr.codigo_fabricante = f.codigo
          WHERE f.nombre='Crucial'
               and pr.codigo_fabricante = p.codigo_fabricante);

/*19. Devuelve todos los productos de la base de 
datos que tienen un precio mayor o igual al
producto más caro del fabricante Lenovo.*/
SELECT p.*
from producto p 
where p.precio >= 
     (SELECT
          max(p.precio)
          from producto pr join fabricante f
               on pr.codigo_fabricante = f.codigo
          WHERE f.nombre='Lenovo');

/*20a. Lista todos los productos del fabricante Asus 
que tienen un precio superior al precio medio de
todos sus productos.*/
SELECT * FROM producto p
WHERE p.precio >=
     (SELECT avg(precio)
     from producto pr join fabricante f
               on pr.codigo_fabricante = f.codigo
          WHERE f.nombre='Asus'
          and pr.codigo_fabricante = p.codigo_fabricante);

/*20b. Lista todos los productos del fabricante Asus 
que tienen un precio superior al precio medio de
todos LOS productos.*/
SELECT * 
     from producto pr join fabricante f
          on pr.codigo_fabricante = f.codigo
     WHERE f.nombre='Asus' AND precio >=
     (SELECT avg(precio) from producto);


/*****************************/
/*Subconsultas con ALL y ANY*/
/*****************************/
/*21. Devuelve el producto más caro que existe en la 
tabla producto sin hacer uso de MAX, ORDER
BY ni LIMIT.*/
SELECT *
FROM producto
WHERE precio >= ALL(
     SELECT p.precio from producto p);

/*22. Devuelve el producto más barato que existe 
en la tabla producto sin hacer uso de MIN,
ORDER BY ni LIMIT.*/
SELECT *
FROM producto
WHERE precio <= ALL(
     SELECT p.precio from producto p);

/*23. Devuelve los nombres de los fabricantes que 
tienen productos asociados. (Utilizando ALL o
ANY).*/
SELECT f.nombre
FROM fabricante f
WHERE f.codigo = any (
     SELECT p.codigo_fabricante
     FROM producto p);

/*24. Devuelve los nombres de los fabricantes que no
 tienen productos asociados. (Utilizando ALL o ANY).*/
SELECT f.nombre
FROM fabricante f
WHERE f.codigo <> all (
     SELECT p.codigo_fabricante
     FROM producto p);

/*****************************/
/*Subconsultas con IN y NOT IN*/
/*****************************/
/*25. Devuelve los nombres de los fabricantes que tienen 
productos asociados. (Utilizando IN o NOT IN).*/
SELECT f.nombre
FROM fabricante f
WHERE f.codigo in (
     SELECT p.codigo_fabricante
     FROM producto p;

/*26. Devuelve los nombres de los fabricantes que no
tienen productos asociados. (Utilizando IN o NOT IN).*/
SELECT f.nombre
FROM fabricante f
WHERE f.codigo not in (
     SELECT p.codigo_fabricante
     FROM producto p);

/*27. Devuelve los nombres de los fabricantes que tienen 
productos asociados. (Utilizando EXISTS o NOT EXISTS).*/
SELECT f.nombre
FROM fabricante f
WHERE exists (
     SELECT p.codigo_fabricante
     FROM producto p
     WHERE f.codigo=p.codigo_fabricante);

/*28. Devuelve los nombres de los fabricantes que no
tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).*/
SELECT f.nombre
FROM fabricante f
WHERE not exists (
     SELECT p.codigo_fabricante
     FROM producto p
     WHERE f.codigo=p.codigo_fabricante);

/*****************************/
/*Subconsultas correlacionadas*/
/*****************************/
/*29. Lista el nombre de cada fabricante con el nombre 
y el precio de su producto más caro.*/
SELECT f.* ,
(SELECT MAX(p.precio)
FROM producto p
WHERE f.codigo = p.codigo_fabricante) AS preMax,
(SELECT COUNT(p.codigo)
FROM producto p
) AS nompro
FROM fabricante f;

SELECT DISTINCT p.nombre, f.nombre,

(
SELECT MAX(pro.precio)
FROM producto pro
WHERE f.codigo = pro.codigo_fabricante) AS preMax

FROM fabricante f
JOIN producto p ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre;


/*30. Devuelve un listado de todos los productos que 
tienen un precio mayor o igual a la media de
todos los productos de su mismo fabricante.*/
SELECT p.nombre, AVG(p.precio) FROM producto p;
 
SELECT DISTINCT f.nombre AS nomFabri, p.nombre AS nomPro,  
(
SELECT AVG(pro.precio)
FROM producto pro
WHERE p.precio <= pro.precio) AS PreMasMedia
FROM fabricante f
JOIN producto p ON p.codigo_fabricante = f.codigo
GROUP BY p.nombre;


/*31. Lista el nombre del producto más caro del fabricante Lenovo.
Subconsultas (En la cláusula HAVING)*/
SELECT *
FROM producto p
WHERE p.codigo_fabricante = (
SELECT
 f.codigo
FROM fabricante f
WHERE f.nombre='Lenovo')
GROUP BY nombre
HAVING MAX(precio);

/*32. Devuelve un listado con todos los nombres de los 
fabricantes que tienen el mismo número de
productos que el fabricante Lenovo.*/
/*No hay cantidas de productos en la tabla*/