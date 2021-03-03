-- 1. Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar
-- ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
select * from pedido order by fecha desc;

-- 2. Devuelve todos los datos de los dos pedidos de mayor valor.
select * from pedido order by total desc limit 2;

-- 3. Devuelve un listado con los identificadores de los clientes que han realizado algún pedido.
-- Tenga en cuenta que que no debe mostrar identificadores que estén repetidos.
select distinct id_cliente from pedido;
-- 4. Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad
-- total sea superior a 500€.
select * from pedido where  fecha like ('%2017%') and total>500;

-- 5. Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión
-- entre 0.05 y 0.11.
select nombre,apellido1,apellido2 from comercial where (comisión>0.05 and comisión<0.11);

-- 6. Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
select max(comisión) from comercial;

-- 7. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido
-- no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
select id,nombre,apellido1,apellido2 from cliente where apellido2 is not null order by apellido1,apellido2,nombre;

-- 8. Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y
-- también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.
select nombre from cliente where nombre like ('A%n') or nombre like ('P%') order by nombre;

-- 9. Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá
-- estar ordenado alfabéticamente.
select nombre from cliente where nombre not like ('A%') order by nombre; 

-- 10. Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en
-- cuenta que se deberán eliminar los nombres repetidos.
select distinct nombre from comercial where nombre like ('%o');

-- 11. Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han
-- realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los
-- elementos repetidos.
select distinct c.id,nombre,apellido1,aquellos2 from cliente c join pedido p on c.id=p.id_cliente order by nombre;

-- 12. Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado
-- debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de
-- los clientes ordenados alfabéticamente.
select * from cliente c join pedido p on c.id=p.id_cliente order by c.nombre;

-- 13. Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El
-- resultado debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe
-- mostrar los datos de los comerciales ordenados alfabéticamente.
select * from comercial c join pedido p on p.id_comercial=c.id order by c.nombre;

-- 14. Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y
-- con los datos de los comerciales asociados a cada pedido.
select * from cliente cli join pedido p on cli.id=p.id_cliente
                          join comercial com on com.id=p.id_comercial;
                          
-- 15. Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya
-- cantidad esté entre 300 € y 1000 €.
select * from cliente c join pedido p on c.id=p.id_cliente where (total>300 and total<1000) and fecha like ('%2017%');

-- 16. Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún
-- pedido realizado por María Santana Moreno.
select distinct com.nombre,com.apellido1,com.apellido2 from comercial com join pedido p on com.id=p.id_comercial 
                                                                          join cliente cli on cli.id=p.id_cliente 
                                                                          where cli.nombre="María" and cli.apellido1="Santana" and cli.apellido2="Moreno";

-- 17. Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial
-- Daniel Sáez Vega.
select distinct cli.nombre,cli.apellido1,cli.apellido2 from cliente cli join pedido p on cli.id=p.id_cliente 
                                                                          join comercial com on com.id=p.id_comercial 
                                                                          where com.nombre="Daniel" and com.apellido1="Sáez" and com.apellido2="Vega";

-- 24. Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
select sum(total) from pedido;

-- 25. Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
select avg(total) form pedido;

-- 26. Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
select count(distinct id_comercial) from pedido;

-- 27. Calcula el número total de clientes que aparecen en la tabla cliente.
select count(*) from cliente;

-- 28. Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
select max(total) from pedido;

-- 29. Calcula cuál es la menor cantidad que aparece en la tabla pedido.
select min(total) from pedido;

-- 30. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la
-- tabla cliente.
-- select max(distinct categoría) from cliente;
select ciudad, max(categoría) from cliente group by cuidad;

-- LEFT JOIN y RIGHT JOIN
-- 18. Devuelve un listado con todos los clientes junto con los datos de los pedidos que han
-- realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido. El
-- listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre
-- de los clientes.

-- 19. Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han
-- realizado. Este listado también debe incluir los comerciales que no han realizado ningún
-- pedido. El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido
-- y nombre de los comerciales.

-- 20. Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.

-- 21. Devuelve un listado que solamente muestre los comerciales que no han realizado ningún
-- pedido.

-- 22. Devuelve un listado con los clientes que no han realizado ningún pedido y de los comerciales
-- que no han participado en ningún pedido. Ordene el listado alfabéticamente por los apellidos y
-- el nombre. En en listado deberá diferenciar de algún modo los clientes y los comerciales.

-- 23. ¿Se podrían realizar las consultas anteriores con NATURAL LEFT JOIN o NATURAL RIGHT
-- JOIN? Justifique su respuesta.