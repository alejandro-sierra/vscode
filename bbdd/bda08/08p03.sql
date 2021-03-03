-- 1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
select codigo_oficina, ciudad from oficina;

-- 2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
select codigo_oficina, telefono from oficina where pais="España";

-- 3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un
-- código de jefe igual a 7.
select nombre, apellido1, apellido2, email from empleado where codigo_jefe=7;

-- 4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
select puesto, nombre, apellido1, apellido2, email from empleado where codigo_jefe is null;

-- 5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean
-- representantes de ventas.
select nombre, apellido1, apellido2, puesto from empleado where !="Representante Ventas"; --que no sean "!"

-- 6. Devuelve un listado con el nombre de los todos los clientes españoles.
select * from cliente where pais="Spain";

-- 7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.
select distinct estado from pedido;

-- 8. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en
-- 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan
-- repetidos. Resuelva la consulta:
    -- 1. Utilizando la función YEAR de MySQL.
    select distinct codigo_cliente from pago where year(fecha_pago)='2008';

    -- 2. Utilizando la función DATE_FORMAT de MySQL.
    select distinct codigo_cliente from pago where date_format(fecha_pago,"%Y")='2008';

    -- 3. Sin utilizar ninguna de las funciones anteriores.
    select distinct codigo_cliente from pago where fecha_pago like '%2008%';
    --mejor between desde 1 Ene al 31 Dic 

-- 9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de
-- entrega de los pedidos que no han sido entregados a tiempo.
select codigo_pedido, codigo_cliente, fecha_esperada,fecha_entrega from pedido where fecha_entrega>fecha_esperada;

-- 10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de
-- entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha
-- esperada.
    -- 1. Utilizando la función ADDDATE de MySQL.
    select codigo_pedido, codigo_cliente, fecha_esperada,fecha_entrega from pedido where fecha_esperada>=adddate(fecha_entrega, interval 2 day); --preguntar
    select codigo_pedido, codigo_cliente, fecha_esperada,fecha_entrega from pedido where fecha_esperada>=adddate(fecha_entrega, 2);

    -- 2. Utilizando la función DATEDIFF de MySQL.
    select codigo_pedido, codigo_cliente, fecha_esperada,fecha_entrega from pedido where datediff(fecha_esperada, fecha_entrega) >=2; --preguntar

    -- 3. ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?
    select codigo_pedido, codigo_cliente, fecha_esperada,fecha_entrega from pedido where fecha_entrega=fecha_esperada-2;

-- 11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
select * from pedido where estado="Rechazado" and year(fecha_esperada)='2009';

-- 12. Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de
-- cualquier año.
select * from pedido where date_format(fecha_entrega,"%m")='01';
select * from pedido where date_format month(fecha_entrega)='01';

-- 13. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal.
-- Ordene el resultado de mayor a menor.
select * from pago where forma_pago="PayPal" and year(fecha_pago)='2008' order by total desc;

-- 14. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en
-- cuenta que no deben aparecer formas de pago repetidas.
select distinct forma_pago from pago;

-- 15. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que
-- tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta,
-- mostrando en primer lugar los de mayor precio.
select * from producto where gama="Ornamentales" and cantidad_en_stock>100 order by precio_venta desc;

-- 16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo
-- representante de ventas tenga el código de empleado 11 o 30.
select  * from cliente where ciudad="Madrid" and codigo_empleado_rep_ventas=10 or codigo_empleado_rep_ventas=30;
select  * from cliente where ciudad="Madrid" and codigo_empleado_rep_ventas in (10,30);

-- Consultas multitabla (Composición interna)
-- 17.Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de
-- ventas.
select c.nombre_cliente, e.nombre as "nombre empleado", e.apellido1 as "apellido empleado" from cliente c join empleado e on c.codigo_empleado_rep_ventas=e.codigo_empleado;

-- 18.Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus
-- representantes de ventas.
select c.nombre_cliente, e.nombre as "nombre empleado" from cliente c join pago p on c.codigo_cliente=p.codigo_cliente
                                        join empleado e on c.codigo_empleado_rep_ventas=e.codigo_empleado;

-- 19.Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus
-- representantes de ventas.
--con left join
select c.nombre_cliente, e.nombre as "nombre empleado" from cliente c join pago p on c.codigo_cliente=p.codigo_cliente --preguntar
                                        join empleado e on c.codigo_empleado_rep_ventas=e.codigo_empleado where p.forma_pago is null;

-- 20. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes
-- junto con la ciudad de la oficina a la que pertenece el representante.
select c.nombre_cliente, e.nombre as "nombre empleado", o.ciudad from cliente c join pago p on c.codigo_cliente=p.codigo_cliente
                                        join empleado e on c.codigo_empleado_rep_ventas=e.codigo_empleado
                                        join oficina o on e.codigo_oficina=o.codigo_oficina;

-- 21. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus
-- representantes junto con la ciudad de la oficina a la que pertenece el representante.
--con left join
select c.nombre_cliente, e.nombre as "nombre empleado" from cliente c join pago p on c.codigo_cliente=p.codigo_cliente
                                        join empleado e on c.codigo_empleado_rep_ventas=e.codigo_empleado where p.forma_pago is null;

-- 22. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
select o.linea_direccion1 from oficina o join empleado e on o.codigo_oficina=e.codigo_oficina
                                        join cliente c on c.codigo_empleado_rep_ventas=e.codigo_empleado where c.ciudad="Fuenlabrada";

-- 23. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la
-- oficina a la que pertenece el representante.
select c.nombre_cliente, e.nombre as "nombre empleado",o.ciudad as "cuidad oficina" from cliente c join empleado e on c.codigo_empleado_rep_ventas=e.codigo_empleado
                                                join oficina o on o.codigo_oficina=e.codigo_oficina;

-- 24. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
select e1.nombre as "nombre jefe", e2.nombre as "nombre empleado" from empleado e1 join empleado e2 on e1.codigo_empleado=e2.codigo_jefe; --mirar

-- 25. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
select c.nombre_cliente from cliente c join pedido p on p.codigo_cliente=c.codigo_cliente where fecha_entrega>fecha_esperada;

-- 26. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
select distinct c.nombre_cliente,pro.gama from cliente c join pedido ped on ped.codigo_cliente=c.codigo_cliente
                                                        join detalle_pedido dp on dp.codigo_pedido=ped.codigo_pedido
                                                        join producto pro on pro.codigo_producto=dp.codigo_producto;

-- Consultas multitabla (Composición externa)
-- 27. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
select distinct c.codigo_cliente,c.nombre_cliente from cliente c left join pago p on c.codigo_cliente=p.codigo_cliente where forma_pago is null; 

-- 28. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.
select distinct c.codigo_cliente,c.nombre_cliente from cliente c left join pedido p on c.codigo_cliente=p.codigo_cliente where p.codigo_pedido is null; 

-- 29. Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no
-- han realizado ningún pedido.
select distinct c.codigo_cliente,c.nombre_cliente from cliente c left join pedido ped on c.codigo_cliente=ped.codigo_cliente --revisar, esta mal
                                                                   left join pago pag on c.codigo_cliente=pag.codigo_cliente where ped.codigo_oficina is null and pag.id_transaccion is null;

-- 30. Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.
select e.nombre as "nombre empleado" from empleado where codigo_oficina is null;

-- 31. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.
select e.codigo_empleado,e.nombre as "nombre empleado" from empleado e left join cliente c on c.codigo_empleado_rep_ventas=e.codigo_empleado where codigo_empleado_rep_ventas is null;

-- 32. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado
-- junto con los datos de la oficina donde trabajan.
select * from empleado e left join oficina o on o.codigo_oficina=e.codigo_oficina
                                                 left join cliente c on c.codigo_empleado_rep_ventas=e.codigo_empleado where codigo_empleado_rep_ventas is null;

-- 33. Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que
-- no tienen un cliente asociado.
select e.codigo_empleado,e.nombre as "nombre empleado" from empleado e left join cliente c on c.codigo_empleado_rep_ventas=e.codigo_empleado --revisar, esta mal
                            where e.codigo_oficina is null and e.codigo_empleado_rep_ventas is null;

-- 34. Devuelve un listado de los productos que nunca han aparecido en un pedido.
select * from producto pro left join detalle_pedido dp on dp.codigo_producto=pro.codigo_producto where codigo_pedido is null;

-- 35. Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe
-- mostrar el nombre, la descripción y la imagen del producto.
select pro.nombre as "nombre producto", pro.descripcion from producto pro left join detalle_pedido dp on dp.codigo_producto=pro.codigo_producto
                                                                     where codigo_pedido is null;

--PENDIENTES DE REVIAR 36 A AL 38
-- 36. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los
-- representantes de ventas de algún cliente que haya realizado la compra de algún producto de
-- la gama Frutales.
select --preguntar

-- 37. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado
-- ningún pago.
select c.codigo_cliente,c.nombre_cliente from cliente c left join pedido p on c.codigo_cliente=p.codigo_cliente
                        left join pago pag on pag.codigo_cliente=c.codigo_cliente where pag.codigo_cliente is null;

-- 38. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el
-- nombre de su jefe asociado.
select e1.nombre as "nombre jefe", e2.nombre as "nombre empleado",c.codigo_cliente  from empleado e1 left join cliente c on c.codigo_empleado_rep_ventas=e.codigo_empleado
                            left join empleado e2 on e1.codigo_empleado=e2.codigo_jefe where codigo_empleado_rep_ventas is null; --preguntar

-- Consultas con funciones agregadas
-- 39. ¿Cuántos empleados hay en la compañía?
select count(*) from empleado;

-- 40. ¿Cuál fue el pago medio en 2009?
select avg(total) from pago where year(fecha_pago)='2009';

-- 41. Calcula el precio de venta del producto más caro y más barato en una misma consulta.
select max(precio_venta),min(precio_venta) from producto;

-- 42. Calcula el número de clientes que tiene la empresa.
select count(*) from cliente;

-- 43. ¿Cuántos clientes tiene la ciudad de Madrid?
select count(*) from cliente where ciudad="Madrid";