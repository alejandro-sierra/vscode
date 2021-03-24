-- Consultas agrupadas
-- 1. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende
-- cada uno.
select e.nombre, count(c.codigo_cliente)
from cliente c join empleado e on e.codigo_empleado=c.codigo_empleado_rep_ventas 
group by e.nombre;

-- 2. Calcula el número de clientes que no tiene asignado representante de ventas. --revisar


-- 3. Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado
-- deberá mostrar el nombre y los apellidos de cada cliente.    
select c.nombre_contacto as 'nombre cliente',c.apellido_contacto as 'apellido',max(p.fecha_pedido),min(p.fecha_pedido) 
from cliente c join pedido p on c.codigo_cliente=p.codigo_cliente
group by c.nombre_contacto,c.apellido_contacto;

-- 4. Calcula el número de productos diferentes que hay en cada uno de los pedidos.
select dp.codigo_pedido, count(p.codigo_producto) 
from detalle_pedido dp join producto p on dp.codigo_producto=p.codigo_producto 
group by codigo_pedido;

-- 5. Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los
-- pedidos.
select dp.codigo_pedido, count(p.codigo_producto),sum(precio_unidad*cantidad) 
from detalle_pedido dp join producto p on dp.codigo_producto=p.codigo_producto 
group by codigo_pedido;

-- 6. Devuelve un listado de los 15 productos más vendidos y el número total de unidades que se
-- han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades
-- vendidas.


-- 7. La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA
-- y el total facturado. La base imponible se calcula sumando el coste del producto por el número
-- de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el
-- total la suma de los dos campos anteriores.

-- 8. La misma información que en la pregunta anterior, pero agrupada por código de producto.

-- 9. La misma información que en la pregunta anterior, pero agrupada por código de producto
-- filtrada por los códigos que empiecen por OR.

-- 10. Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará
-- el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).
-- Subconsultas - Con operadores básicos de comparación

-- 11. Devuelve el nombre del cliente con mayor límite de crédito.

-- 12. Devuelve el nombre del producto que tenga el precio de venta más caro.

-- 13. Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta que
-- tendrá que calcular cuál es el número total de unidades que se han vendido de cada producto
-- a partir de los datos de la tabla detalle_pedido. Una vez que sepa cuál es el código del
-- producto, puede obtener su nombre fácilmente.)

-- 14. Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar
-- INNER JOIN).

-- 15. Devuelve el producto que más unidades tiene en stock.

-- 16. Devuelve el producto que menos unidades tiene en stock.

-- 17. Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Emmanuel
-- Magaña Perez.

-- Subconsultas con ALL y ANY
-- 18. Devuelve el nombre del cliente con mayor límite de crédito.

-- 19. Devuelve el nombre del producto que tenga el precio de venta más caro.

-- 20. Devuelve el producto que menos unidades tiene en stock.

-- Subconsultas con IN y NOT IN
-- 21. Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.

-- 22. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

-- 23. Devuelve un listado que muestre solamente los clientes que sí han realizado ningún pago.

-- 24. Devuelve un listado de los productos que nunca han aparecido en un pedido.

-- 25. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no
-- sean representante de ventas de ningún cliente.

-- 26. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los
-- representantes de ventas de algún cliente que haya realizado la compra de algún producto de
-- la gama Frutales.

-- 27. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado
-- ningún pago.

-- Subconsultas con EXISTS y NOT EXISTS
-- 28. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

-- 29. Devuelve un listado que muestre solamente los clientes que sí han realizado ningún pago.

-- 30. Devuelve un listado de los productos que nunca han aparecido en un pedido.

-- 31. Devuelve un listado de los productos que han aparecido en un pedido alguna vez.

-- Consultas variadas
-- 32. Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado.
-- Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.
select c.nombre,count(p.codigo_pedido) 
from cliente c left join pedido p on c.codigo_cliente=p.codigo_cliente 
group by c.nombre_cliente;

-- 33. Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos.
-- Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.
select c.nombre_cliente,sum(p.total) 
from cliente c left join pago p on c.codigo_cliente=p.codigo_cliente 
group by c.nombre_cliente;

-- 34. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados
-- alfabéticamente de menor a mayor.
select c.nombre_cliente 
from cliente c join pedido p on c.codigo_cliente=p.codigo_cliente
where year(p.fecha_pedido)='2008' order by c.nombre_cliente;

-- 35. Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el
-- número de teléfono de la oficina del representante de ventas, de aquellos clientes que no
-- hayan realizado ningún pago.
select c.nombre_cliente,e.nombre as 'nombre empleado',e.apellido1,o.telefono as 'telefono oficina'
from cliente c left join pago p on p.codigo_cliente=c.codigo_cliente
            join empleado e on e.codigo_empleado=c.codigo_empleado_rep_ventas
            join oficina o on o.codigo_oficina=e.codigo_oficina
where id_transaccion is null;    


-- 36. Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer
-- apellido de su representante de ventas y la ciudad donde está su oficina.
select c.nombre_cliente,e.nombre as 'nombre empleado',e.apellido1,o.ciudad as 'ciudad oficina'
from cliente c left join pago p on p.codigo_cliente=c.codigo_cliente
            join empleado e on e.codigo_empleado=c.codigo_empleado_rep_ventas
            join oficina o on o.codigo_oficina=e.codigo_oficina
group by c.nombre_cliente;

-- 37. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no
-- sean representante de ventas de ningún cliente.
select e.nombre as 'nombre empleado',e.apellido1,e.apellido2,e.puesto,o.telefono as 'telefono oficina'
from cliente c left join pago p on p.codigo_cliente=c.codigo_cliente
            join empleado e on e.codigo_empleado=c.codigo_empleado_rep_ventas
            join oficina o on o.codigo_oficina=e.codigo_oficina
where e.puesto !='Representante Ventas' group by e.nombre;

-- 38. Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de
-- empleados que tiene.
select o.ciudad,count(e.codigo_empleado) 
from oficina o join empleado e on o.codigo_oficina=e.codigo_oficina
group by o.ciudad; 