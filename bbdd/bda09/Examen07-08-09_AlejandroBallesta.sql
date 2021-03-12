use jardineria;

--   1. Nombre y primer apellido de los empleados cuyo jefe directo es el jefe de la empresa.

--   2. Pedidos rechazados que no se llegaron a entregar.
select codigo_pedido,fecha_entrega,estado from pedido where fecha_entrega is null and estado='Rechazado';

--   3. Cantidad de productos pedidos cada año.
select year(p.fecha_pedido),sum(dp.cantidad) 
from detalle_pedido dp join pedido p on dp.codigo_pedido=p.codigo_pedido
group by year(p.fecha_pedido);

--   4. Nombre de los clientes españoles que no han realizado pagos.
select c.nombre_cliente, c.pais, p.id_transaccion
from cliente c join pago p on c.codigo_cliente=p.codigo_cliente 
where c.pais='Spain' and p.id_transaccion is null;

--   5. Cantidad de pedidos gestionados por representantes de ventas que trabajan en oficinas cuyo teléfono comienza por “+1”.


--   6. Nombre de los clientes a los cuales se les ha rechazado más de 2 pedidos.
select c.nombre_cliente,p.estado
from cliente c join pedido p on c.codigo_cliente=p.codigo_cliente
where estado='Rechazado' group by c.nombre_cliente having count(p.estado)>=2;

--   7. Nombre del cliente que ha acumulado la mayor cantidad pagada mediante PayPal.
select c.nombre_cliente, count(p.forma_pago='PayPal')
from cliente c join pago p on c.codigo_cliente=p.codigo_cliente
group by c.nombre_cliente;

--   8. Gama de producto que más ha recaudado (en dinero recaudado).
select g.gama, max(dp.cantidad*dp.precio_unidad)
from gama_producto g join producto p on g.gama=p.gama
join detalle_pedido dp on p.codigo_producto=dp.codigo_producto
limit 1;

--   9. Para cada forma de pago, cuantos productos se han vendido.


--   10. Ciudades donde hay oficinas y el número de empleados que tiene, teniendo en cuenta que sólo nos interesan las que tengan al menos 2 empleados.
select o.ciudad, count(e.codigo_empleado)
from oficina o join empleado e on o.codigo_oficina=e.codigo_oficina
group by o.ciudad having count(e.codigo_empleado)>=2;

--   11. Código y nombre del representante de ventas que consiguió el pago más alto.
select e.codigo_empleado,e.nombre,p.total
from empleado e join cliente c on e.codigo_empleado=c.codigo_empleado_rep_ventas
join pago p on c.codigo_cliente=p.codigo_cliente
order by p.total desc limit 1;

--   12. Ciudad de la oficina que ha gestionado los pedidos de los productos cuyo proveedor contiene la palabra “Murcia”


--   13. Pago medio realizado en el año 2008.
select avg(total) as 'pago medio' 
from pago 
where year(fecha_pago)='2008';

--   14. Gama de producto más vendida (a partir de la cantidad de unidades del pedido de unidades).


--   15. Código y nombre de los productos que nunca se han pedido.
select p.codigo_producto,p.nombre
from producto p left join detalle_pedido dp on p.codigo_producto=dp.codigo_producto
where dp.codigo_pedido is null;

--   16. Código del pedido que tiene el mayor número de líneas.
select dp.codigo_pedido, max(numero_linea)
from detalle_pedido dp
limit 1;

--   17. Cantidad de pedidos realizado por cada cliente (debe aparece el nombre del cliente), ordenados de mayor a menor por la cantidad de pedidos. Si algún cliente no ha realizado ningún pedido, deberá aparecer 0.
select c.nombre_cliente,count(p.codigo_pedido)
from cliente c left join pedido p on c.codigo_cliente=p.codigo_cliente
group by c.nombre_cliente order by count(p.codigo_pedido) desc;

--   18. Nombre y apellidos de los empleados que son representantes de ventas, junto al nombre y apellidos de su jefe.
select e.nombre as 'nombre jefe',e.apellido1 as 'apellido jefe',e2.nombre,e2.apellido1
from empleado e join empleado e2 on e.codigo_empleado=e2.codigo_jefe
where e2.puesto='Representante Ventas';

--   19. Pedidos entregados en el 2009 que no tienen comentarios .
select p.codigo_pedido
from pedido p 
where year(fecha_entrega)='2009' and comentarios is null;

--   20. Nombre y primer apellido, así como cantidad de pedidos conseguidos, de aquellos representantes de ventas que representan a más de un cliente.
select e.nombre,e.apellido1, count(p.codigo_pedido)
from empleado e join cliente c on c.codigo_empleado_rep_ventas=e.codigo_empleado
join pedido p on p.codigo_cliente=c.codigo_cliente
where e.puesto='Representante Ventas' group by e.nombre,e.apellido1 having count(c.codigo_empleado_rep_ventas)>=2;