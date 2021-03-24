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
select c.id,c.nombre,c.apellido1,c.apellido2,ifnull(max(p.id),0) from cliente c left join pedido p on c.id=p.id_cliente group by c.id;

-- 8. Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
select year(fecha) as "año",id from year(fecha) group by fecha; --revisar

-- 9. Devuelve el número total de pedidos que se han realizado cada año.
select p.id as 'n_pedidos',year(p.fecha) from pedido p group by year(p.fecha) having max(p.total);

select year(fecha) as "año",count(total) as "total pedidos" from pedido group by fecha;

-- 10. Devuelve un listado con todos los pedidos que ha realizado María Santana Moreno. (Sin utilizar
-- INNER JOIN).
select * from pedido where id_cliente = (select id from cliente where nombre="María" and apellido1="Santana" and apellido2="Moreno");

-- 11. Devuelve el número de pedidos en los que ha participado el comercial Antonio Carretero
-- Ortega. (Sin utilizar INNER JOIN)
select * from pedido where id_comercial = (select id from comercial where nombre="Antonio" and apellido1="Carretero" and apellido2="Ortega");

-- 12. Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar
-- INNER JOIN)
select * from cliente where id in(select id_cliente from pedido where year(fecha)='2019');

-- 13. Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz
-- Santana.
select fecha,total from pedido where id_cliente = (select id from cliente where nombre="Pepe" and apellido1="Ruiz" and apellido2="Santana");

-- 14. Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han
-- realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio de los
-- pedidos realizados durante ese mismo año. 
select c.*,p.* from cliente c join pedido p on c.id=p.id_cliente where year(p.fecha)='2019' and total>=avg(p.total); --esta mal

-- Subconsultas con ALL y ANY
-- 15. Devuelve el pedido más caro que existe en la tabla pedido si hacer uso de MAX, ORDER BY ni
-- LIMIT.
select * from pedido p where p.total >=all (select total from pedido where total>p.total)

-- 16. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando ANY o
-- ALL).
select nombre from cliente where id !=all (select id_cliente from pedido);

-- 17. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando ANY o
-- ALL).
select nombre from comercial where id !=all (select id_comercial from pedido);

-- Subconsultas con IN y NOT IN
-- 18. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT
-- IN).
select nombre from cliente where id not in (select id_cliente from pedido);

-- 19. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o
-- NOT IN).
select nombre from comercial where id not in (select id_comercial from pedido);

-- Subconsultas con EXISTS y NOT EXISTS
-- 20. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o
-- NOT EXISTS).
select nombre from cliente c where not exists (select id_cliente from pedido p where c.id=p.id_cliente);

-- 21. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando
-- EXISTS o NOT EXISTS).
select nombre from comercial c where not exists (select id_comercial from pedido p where c.id=p.id_comercial);