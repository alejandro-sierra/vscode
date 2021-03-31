use jardineria;

--   1. Nombre y primer apellido de los empleados cuyo jefe directo es el jefe de la empresa. --hacer esta
select nombre as 'nombre empleado', apellido1 as 'apellido empleado' 
from empleado e1 where e1.codigo_jefe = (select e2.codigo_empleado from empleado e2 where e2.codigo_jefe is null);

--   2. Pedidos rechazados que no se llegaron a entregar. --bien
select codigo_pedido,fecha_entrega,estado from pedido where fecha_entrega is null and estado='Rechazado';

--   3. Cantidad de productos pedidos cada año. --bien
select year(p.fecha_pedido),sum(dp.cantidad) 
from detalle_pedido dp join pedido p on dp.codigo_pedido=p.codigo_pedido
group by year(p.fecha_pedido);

--   4. Nombre de los clientes españoles que no han realizado pagos. --regular --hacer esta
select c.nombre_cliente, c.pais, p.id_transaccion
from cliente c left join pago p on c.codigo_cliente=p.codigo_cliente 
where c.pais='Spain' and p.id_transaccion is null;

--   5. Cantidad de pedidos gestionados por representantes de ventas que trabajan en oficinas cuyo teléfono comienza por “+1”. --hacer esta
select count(ped.codigo_pedido) as 'cantidad gestionada'
from oficina o join empleado e on o.codigo_oficina=e.codigo_oficina
               join cliente c on c.codigo_empleado_rep_ventas=e.codigo_empleado
               join pedido ped on ped.codigo_cliente=c.codigo_cliente
where o.telefono like '%+1%';

--   6. Nombre de los clientes a los cuales se les ha rechazado más de 2 pedidos. --bien
select c.nombre_cliente,p.estado
from cliente c join pedido p on c.codigo_cliente=p.codigo_cliente
where estado='Rechazado' group by c.nombre_cliente having count(p.estado)>=2;

--   7. Nombre del cliente que ha acumulado la mayor cantidad pagada mediante PayPal. --mal --hacer esta
select c.nombre_cliente, sum(p.total)
from cliente c join pago p on c.codigo_cliente=p.codigo_cliente
where p.forma_pago='PayPal' group by c.nombre_cliente order by total desc limit 1;

--   8. Gama de producto que más ha recaudado (en dinero recaudado). --mal --hacer esta
select p.gama, sum(dp.cantidad*dp.precio_unidad) as 'recaudacion'
from detalle_pedido dp join producto p on p.codigo_producto=dp.codigo_producto
group by p.gama order by recaudacion desc limit 1;

--   9. Para cada forma de pago, cuantos productos se han vendido. --hacer esta
select p.forma_pago, sum(dp.cantidad)
from pago pag join cliente c on pag.codigo_cliente=c.codigo_cliente
              join pedido ped on ped.codigo_cliente=c.codigo_cliente
              join detalle_pedido dp on ped.codigo_pedido=dp.codigo_pedido
group by p.forma_pago;

--   10. Ciudades donde hay oficinas y el número de empleados que tiene, teniendo en cuenta que sólo nos interesan las que tengan al menos 2 empleados. --bien
select o.ciudad, count(e.codigo_empleado)
from oficina o join empleado e on o.codigo_oficina=e.codigo_oficina
group by o.ciudad having count(e.codigo_empleado)>=2;

--   11. Código y nombre del representante de ventas que consiguió el pago más alto. --bien
select e.codigo_empleado,e.nombre
from empleado e join cliente c on e.codigo_empleado=c.codigo_empleado_rep_ventas
join pago p on c.codigo_cliente=p.codigo_cliente
order by p.total desc limit 1;

--   12. Ciudad de la oficina que ha gestionado los pedidos de los productos cuyo proveedor contiene la palabra “Murcia” --4 o 5 join --hacer esta
select distinct o.ciudad
from oficina o join empleado e on o.codigo_oficina=e.codigo_oficina
               join cliente c on e.codigo_empleado=c.codigo_empleado_rep_ventas
               join pedido ped on c.codigo_cliente=ped.codigo_cliente
               join detalle_pedido dp on dp.codigo_pedido=ped.codigo_pedido
               join producto pro on pro.codigo_producto=dp.codigo_producto
where pro.proveedor like '%Murcia%';

--   13. Pago medio realizado en el año 2008. --super bien
select avg(total) as 'pago medio' 
from pago 
where year(fecha_pago)='2008';

--   14. Gama de producto más vendida (a partir de la cantidad de unidades del pedido de unidades). --hacer esta
select p.gama
from producto p join detalle_pedido dp on p.codigo_producto=dp.codigo_producto
group by p.gama having sum(dp.cantidad) order by p.gama desc limit 1;

--   15. Código y nombre de los productos que nunca se han pedido. --bien
select p.codigo_producto,p.nombre
from producto p left join detalle_pedido dp on p.codigo_producto=dp.codigo_producto
where dp.codigo_pedido is null;

--   16. Código del pedido que tiene el mayor número de líneas. --regular --hacer esta
select dp.codigo_pedido, dp.numero_linea
from detalle_pedido dp
order by dp.numero_linea desc limit 1;

--   17. Cantidad de pedidos realizado por cada cliente (debe aparece el nombre del cliente), ordenados de mayor a menor por la cantidad de pedidos. 
-- Si algún cliente no ha realizado ningún pedido, deberá aparecer 0. --bien
select c.nombre_cliente,count(p.codigo_pedido)
from cliente c left join pedido p on c.codigo_cliente=p.codigo_cliente
group by c.nombre_cliente order by count(p.codigo_pedido) desc;

--   18. Nombre y apellidos de los empleados que son representantes de ventas, junto al nombre y apellidos de su jefe.
select e.nombre as 'nombre jefe',e.apellido1 as 'apellido jefe',e2.nombre,e2.apellido1
from empleado e join empleado e2 on e.codigo_empleado=e2.codigo_jefe
where e2.puesto='Representante Ventas';

--   19. Pedidos entregados en el 2009 que no tienen comentarios . --Regular (no he puesto lo de entregados) --hacer esta
select p.codigo_pedido
from pedido p 
where p.estado='Entregado' and year(fecha_entrega)='2009' and comentarios is null;

--   20. Nombre y primer apellido, así como cantidad de pedidos conseguidos, de aquellos representantes de ventas que representan a más de un cliente. --regular --hacer esta
select e.nombre,e.apellido1, count(p.codigo_pedido)
from empleado e join cliente c on c.codigo_empleado_rep_ventas=e.codigo_empleado
join pedido p on p.codigo_cliente=c.codigo_cliente
where e.puesto='Representante Ventas' group by e.codigo_empleado
having (select count(codigo_empleado_rep_ventas) from cliente where codigo_empleado_rep_ventas=e.codigo_empleado )>1;