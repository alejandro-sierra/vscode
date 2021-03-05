-- 1. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la
-- tabla cliente.
select ciudad,max(categoría) from cliente  group by ciudad;

-- 2. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno
-- de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes
-- cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada
-- uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del
-- cliente, nombre, apellidos, la fecha y el valor de la cantidad.
select c.id,c.nombre,p.fecha,max(p.total) from cliente c join pedido p on c.id=p.id_cliente group by p.fecha,c.id order by c.nombre;

-- 3. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno
-- de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen
-- la cantidad de 1900 €.
select c.id,c.nombre,p.fecha,max(p.total) from cliente c join pedido p on c.id=p.id_cliente where total>=1900 group by c.id,p.fecha order by c.nombre;

-- 4. Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la
-- fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.
select c.id,c.nombre,c.apellido1,c.apellido2,f.fecha,max(p.total) from comercial c join pedido p on c.id=p.id_comercial where p.fecha="2016-08-17" group by c.id,f.fecha;

-- 5. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de
-- pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes
-- que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado
-- indicando que el número de pedidos realizados es 0.
select c.id,c.nombre,c.apellido1,c.apellido2,count(p.id) from cliente c left join pedido p on c.id=p.id_cliente group by c.id,c.nombre,c.apellido1,c.apellido2;
--podemos poner todos los atributos del select en el group para que no falle (excepto los que agrupamos como max,min,sum,etc)

-- 6. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de
-- pedidos que ha realizado cada uno de clientes durante el año 2017.
select c.id,c.nombre,c.apellido1,c.apellido2,count(p.id) from cliente c left join pedido p on c.id=p.id_cliente where year(p.fecha)="2017" group by c.id;

-- 7. Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor
-- de la máxima cantidad del pedido realizado por cada uno de los clientes. El resultado debe
-- mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima
-- cantidad de sus pedidos realizados es 0. Puede hacer uso de la función IFNULL.
select c.id,c.nombre,c.apellido1,c.apellido2,ifnull(count(p.id),0) from cliente c left join pedido p on c.id=p.id_cliente group by c.id; --revisar

-- 8. Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
select year(fecha) as "año",id from year(fecha) group by fecha; --revisar

-- 9. Devuelve el número total de pedidos que se han realizado cada año.
select year(fecha) as "año",count(total) as "total pedidos" from pedido group by fecha; --revisar

-- 10. Devuelve un listado con todos los pedidos que ha realizado María Santana Moreno. (Sin utilizar
-- INNER JOIN).

-- 11. Devuelve el número de pedidos en los que ha participado el comercial Antonio Carretero
-- Ortega. (Sin utilizar INNER JOIN)

-- 12. Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar
-- INNER JOIN)

-- 13. Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz
-- Santana.

-- 14. Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han
-- realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio de los
-- pedidos realizados durante ese mismo año.
-- Subconsultas con ALL y ANY

-- 15. Devuelve el pedido más caro que existe en la tabla pedido si hacer uso de MAX, ORDER BY ni
-- LIMIT.

-- 16. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando ANY o
-- ALL).

-- 17. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando ANY o
-- ALL).

-- Subconsultas con IN y NOT IN
-- 18. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT
-- IN).

-- 19. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o
-- NOT IN).

-- Subconsultas con EXISTS y NOT EXISTS
-- 20. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o
-- NOT EXISTS).

-- 21. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando
-- EXISTS o NOT EXISTS).