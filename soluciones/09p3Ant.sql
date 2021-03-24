/*1. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende
cada uno.*/
select emp.nombre, count(nombre_cliente)
from empleado emp join cliente c on emp.codigo_empleado=c.codigo_empleado_rep_ventas group by emp.nombre;
/*2. Calcula el número de clientes que no tiene asignado representante de ventas.*/
select count(codigo_empleado_rep_ventas) from cliente where codigo_empleado_rep_ventas is null;
/*3. Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado
deberá mostrar el nombre y los apellidos de cada cliente.*/
select nombre_contacto, apellido_contacto , max(fecha_pago),min(fecha_pago) from cliente c join pago pag on c.codigo_cliente=pag.codigo_cliente 
group by nombre_contacto, apellido_contacto;

/*4. Calcula el número de productos diferentes que hay en cada uno de los pedidos.*/
select codigo_pedido, count(pro.nombre) from detalle_pedido de join producto pro on de.codigo_producto=pro.codigo_producto group by codigo_pedido;

/*5. Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.*/
select codigo_producto, sum(cantidad) from detalle_pedido
group by codigo_producto;

/*6. Devuelve un listado de los 15 productos más vendidos y el número total de unidades que se
han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades
vendidas.*/
select nombre, sum(cantidad) from producto pro join detalle_pedido de on pro.codigo_producto=de.codigo_producto  group by nombre order by sum(cantidad) desc limit 15;

select codigo_producto, sum(cantidad) from detalle_pedido 
group by codigo_producto
order by sum(cantidad) desc
limit 15;

/*7. La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA
y el total facturado. La base imponible se calcula sumando el coste del producto por el número
de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el
total la suma de los dos campos anteriores.*/
select sum(precio_unidad*cantidad) as base_imponible,
 sum(precio_unidad*cantidad)*0.21 as IVA,
 sum(precio_unidad*cantidad)*1.21 as Total
from detalle_pedido;

-- opción 2
SELECT @BaseImponible:=sum(precio_unidad*cantidad) as BaseImponible,
@IVA:= @BaseImponible*0.21,
@Total:=@BaseImponible+@IVA
FROM detalle_pedido;


/*8. La misma información que en la pregunta anterior, pero agrupada por código de producto.*/
SELECT codigo_producto, @BaseImponible:=sum(precio_unidad*cantidad) as BaseImponible,
@IVA:= @BaseImponible*0.21,
@Total:=@BaseImponible+@IVA
FROM detalle_pedido
group by codigo_producto;

/*8B. Igual pero que hayan facturado más de 10.000€ */
SELECT codigo_producto, @BaseImponible:=sum(precio_unidad*cantidad) as BaseImponible,
@IVA:= @BaseImponible*0.21,
@Total:=@BaseImponible+@IVA as totalAtrib
FROM detalle_pedido
group by codigo_producto
having sum(precio_unidad*cantidad)*1.21>10000;


/*9. La misma información que en la pregunta anterior, pero agrupada por código de producto
filtrada por los códigos que empiecen por OR.*/
SELECT codigo_producto, @BaseImponible:=sum(precio_unidad*cantidad) as BaseImponible,
@IVA:= @BaseImponible*0.21,
@Total:=@BaseImponible+@IVA
FROM detalle_pedido
WHERE codigo_producto like "OR%"
group by codigo_producto;

/*10. Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará
el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).*/
SELECT p.codigo_producto, sum(cantidad),  @BaseImponible:=sum(precio_unidad*cantidad) as BaseImponible,
@IVA:= @BaseImponible*0.21,
@Total:=@BaseImponible+@IVA as totalAtrib
FROM detalle_pedido dp join producto p on p.codigo_producto=dp.codigo_producto
group by codigo_producto
having sum(precio_unidad*cantidad)*1.21>3000;

/*11. Devuelve el nombre del cliente con mayor límite de crédito.*/
select nombre_cliente from cliente
where limite_credito = (select max(limite_credito) from cliente);

/*12. Devuelve el nombre del producto que tenga el precio de venta más caro.*/
select nombre from producto where precio_venta = (select max(precio_venta) from producto);

/*13. Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta que
tendrá que calcular cuál es el número total de unidades que se han vendido de cada producto
a partir de los datos de la tabla detalle_pedido. Una vez que sepa cuál es el código del
producto, puede obtener su nombre fácilmente.)*/


select nombre from producto where codigo_producto =
    (select codigo_producto from detalle_pedido
    group by codigo_producto order by sum(cantidad) desc limit 1);

-- nombre del producto más solicitado en un pedido
select nombre from producto pro join detalle_pedido de on pro.codigo_producto=de.codigo_producto 
where cantidad =(select max(cantidad) from detalle_pedido)

/*14. Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar
INNER JOIN).*/
select c.codigo_cliente from cliente c where c.limite_credito > 
(select sum(total) from pago where codigo_cliente = c.codigo_cliente);

/*15. Devuelve el producto que más unidades tiene en stock.*/
select nombre from producto where cantidad_en_stock = (select max(cantidad_en_stock) from producto)

/*16. Devuelve el producto que menos unidades tiene en stock.*/
select nombre from producto where cantidad_en_stock = (select min(cantidad_en_stock) from producto)

/*17. Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Emmanuel
Magaña Perez.*/
SELECT nombre, apellido1, apellido2, email
FROM empleado
WHERE codigo_jefe=(
    SELECT codigo_empleado
    FROM empleado
    WHERE nombre='Emmanuel' AND apellido1='Magaña' AND apellido2='Perez'
);

/*18. Devuelve el nombre del cliente con mayor límite de crédito.*/
select nombre_cliente from cliente
where limite_credito >= all (select limite_credito from cliente)

select nombre_cliente from cliente
where limite_credito = (select max(limite_credito) from cliente)

/*19. Devuelve el nombre del producto que tenga el precio de venta más caro.*/
select nombre from producto where  precio_venta >= all (select precio_venta from producto)

/*20. Devuelve el producto que menos unidades tiene en stock.*/
select nombre from producto where cantidad_en_stock <= all (select cantidad_en_stock from producto)

/*21. Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.*/
select nombre, apellido1, puesto from empleado
where codigo_empleado not in
     (select codigo_empleado_rep_ventas from cliente) 

/*22. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.*/
select cli.nombre_cliente from cliente cli 
    where cli.codigo_cliente not in 
        (select pa.codigo_cliente from pago pa)

/*23. Devuelve un listado que muestre solamente los clientes que sí han realizado pagos.*/
select cli.nombre_cliente from cliente cli where cli.codigo_cliente in (select pa.codigo_cliente from pago pa)
-- Lo mismo que hacer join

/*24. Devuelve un listado de los productos que nunca han aparecido en un pedido.*/
select nombre from producto pro where pro.codigo_producto not in
    (select de.codigo_producto from detalle_pedido de)

/*25. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no
sean representante de ventas de ningún cliente.*/


SELECT nombre, apellido1,apellido2,puesto,telefono
FROM empleado e
JOIN oficina o
ON e.codigo_oficina=o.codigo_oficina
WHERE codigo_empleado NOT IN(
    SELECT codigo_empleado_rep_ventas
    FROM cliente
);

/*26. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los
representantes de ventas de algún cliente que haya realizado la compra de algún producto de
la gama Frutales.*/

select codigo_oficina from oficina
where codigo_oficina not in 
    (select codigo_oficina from empleado e join cliente c on e.codigo_empleado=c.codigo_empleado_rep_ventas
    join pedido p on p.codigo_cliente=c.codigo_cliente
    join detalle_pedido dp on dp.codigo_pedido=p.codigo_pedido
    join producto pro on pro.codigo_producto=dp.codigo_producto where
    pro.gama="Frutales")

/*27. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado
ningún pago.*/
select nombre_cliente from cliente cli 
where cli.codigo_cliente in 
    (select ped.codigo_cliente from pedido ped)
and cli.codigo_cliente not in
    (select pa.codigo_cliente from pago pa);

/*28. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.*/
select nombre_cliente from cliente cli
where not exists (select pa.codigo_cliente from pago pa where cli.codigo_cliente=pa.codigo_cliente);

/*29. Devuelve un listado que muestre solamente los clientes que sí han realizado pago.*/
select nombre_cliente from cliente cli
where exists (select pa.codigo_cliente from pago pa where cli.codigo_cliente=pa.codigo_cliente);

/*30. Devuelve un listado de los productos que nunca han aparecido en un pedido.*/
select nombre from producto pro 
where not exists (select * from detalle_pedido de where pro.codigo_producto=de.codigo_producto)

/*29. Devuelve un listado que muestre solamente los clientes que sí han realizado ningún pago.*/
select nombre_cliente from cliente cli
where exists (select pa.codigo_cliente from pago pa where cli.codigo_cliente=pa.codigo_cliente);

/*31. Devuelve un listado de los productos que han aparecido en un pedido alguna vez.*/
select nombre from producto pro
where exists (select de.codigo_producto from detalle_pedido de where pro.codigo_producto=de.codigo_producto);

/*32. Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado.
Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.*/
select nombre_cliente,count(ped.codigo_cliente) from cliente cli left join pedido ped on cli.codigo_cliente=ped.codigo_cliente group by nombre_cliente;
/*32B Clientes que han realizado más de 10 pedidos */
select nombre_cliente,count(ped.codigo_cliente) from cliente cli join pedido ped on cli.codigo_cliente=ped.codigo_cliente
group by nombre_cliente
having count(ped.codigo_cliente)>10;

/*33. Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos.
Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.*/
select nombre_cliente,sum(total) from cliente cli left join pago pa on cli.codigo_cliente=pa.codigo_cliente group by nombre_cliente

/*34. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados
alfabéticamente de menor a mayor.*/
select nombre_cliente from cliente cli join pedido ped on cli.codigo_cliente=ped.codigo_cliente where year(fecha_pedido)='2008' order by nombre_cliente

/*35. Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el
número de teléfono de la oficina del representante de ventas, de aquellos clientes que no
hayan realizado ningún pago*/
--Antonio
select nombre_cliente,nombre,apellido1, ofi.telefono from cliente cli 
left join pago pa on  cli.codigo_cliente=pa.codigo_cliente
left join empleado emp on codigo_empleado_rep_ventas=codigo_empleado
left join oficina ofi on emp.codigo_oficina=ofi.codigo_oficina where pa.codigo_cliente is null;
--Aitor
select nombre_cliente, nombre, apellido1, ofi.telefono
from cliente cli 
join empleado emp on cli.codigo_empleado_rep_ventas=emp.codigo_empleado
join oficina ofi on emp.codigo_oficina=ofi.codigo_oficina
where cli.codigo_cliente not in (select codigo_cliente from pago);

/*36. Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer
apellido de su representante de ventas y la ciudad donde está su oficina.*/
select cli.codigo_cliente, cli.nombre_cliente, nombre,apellido1, ofi.ciudad from cliente cli
join empleado emp on codigo_empleado_rep_ventas=codigo_empleado
join oficina ofi on emp.codigo_oficina=ofi.codigo_oficina;

/*37. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no
sean representante de ventas de ningún cliente.*/
select nombre, apellido1,apellido2, ofi.telefono from empleado emp
left join cliente cli on codigo_empleado=codigo_empleado_rep_ventas
left join oficina ofi on emp.codigo_oficina=ofi.codigo_oficina where codigo_empleado_rep_ventas is null;

select nombre, apellido1,apellido2,puesto, ofi.telefono from empleado emp
join oficina ofi on emp.codigo_oficina=ofi.codigo_oficina
where emp.codigo_empleado not in (select codigo_empleado_rep_ventas from cliente);

/*38. Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de
empleados que tiene.*/
select ciudad, count(codigo_empleado) from oficina ofi join empleado emp on ofi.codigo_oficina=emp.codigo_oficina
group by ciudad;