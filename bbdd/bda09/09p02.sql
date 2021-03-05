-- 1. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la
-- tabla cliente.
select ciudad,max(categoría) from cliente  group by ciudad;

-- 2. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno
-- de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes
-- cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada
-- uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del
-- cliente, nombre, apellidos, la fecha y el valor de la cantidad.
select c.id,c.nombre,p.fecha,max(p.total) from cliente c join pedido p on c.id=p.id_cliente group by p.fecha order by c.nombre;

-- 3. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno
-- de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen
-- la cantidad de 1900 €.
select c.id,c.nombre,p.fecha,max(p.total) from cliente c join pedido p on c.id=p.id_cliente where total>=1900 group by p.fecha order by c.nombre;

-- 4. Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la
-- fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.
select c.id,c.nombre,c.apellido1,c.apellido2,p.total from comercial c join pedido p on c.id=p.id_comercial where p.fecha="2016-08-17"; --preguntar

-- 5. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de
-- pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes
-- que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado
-- indicando que el número de pedidos realizados es 0.
select c.id,c.nombre,c.apellido1,c.apellido2,count(p.id) from cliente c left join pedido p on c.id=p.id_cliente group by c.id;

-- 6. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de
-- pedidos que ha realizado cada uno de clientes durante el año 2017.
select c.id,c.nombre,c.apellido1,c.apellido2,count(p.id) from cliente c left join pedido p on c.id=p.id_cliente where year(p.fecha)="2017" group by c.id;

-- 7. Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor
-- de la máxima cantidad del pedido realizado por cada uno de los clientes. El resultado debe
-- mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima
-- cantidad de sus pedidos realizados es 0. Puede hacer uso de la función IFNULL.
select c.id,c.nombre,c.apellido1,c.apellido2,ifnull(0,count(p.id)) from cliente c left join pedido p on c.id=p.id_cliente group by c.id; --preguntar

-- 8. Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
select year(fecha) as "año",max(total) as "mayor pedido" from pedido group by fecha; 

-- 9. Devuelve el número total de pedidos que se han realizado cada año.
select year(fecha) as "año",count(total) as "total pedidos" from pedido group by fecha; 