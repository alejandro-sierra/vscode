-- B) A partir de la base de datos de jardinería:
-- 1. Crea vistas que muestren los siguientes datos:
    -- 1. clienteSinPedido: Clientes que no han hecho pedidos.
create view clienteSinPedido as 
select c.codigo_cliente,c.nombre_cliente,c.telefono
from cliente c left join pedido p on c.codigo_cliente=p.codigo_cliente
where p.codigo_pedido is null;

    -- 2. clientePayPal: Clientes que han hecho pagos con PayPal.
create view clientePayPal as 
select c.codigo_cliente,c.nombre_cliente,c.telefono
from cliente c left join pago p on C.codigo_cliente=P.codigo_cliente
where p.forma_pago="PayPal";

    -- 3. productosSinPedido: Productos que no se han pedido
create view productosSinPedido as 
select p.codigo_producto,p.nombre
from producto p left join detalle_pedido dp on p.codigo_producto=dp.codigo_producto
where dp.codigo_pedido is null;

    -- 4. clienteMadridPedido: Clientes madrileños que han realizado pedidos
create view clienteMadridPedido as 
select c.codigo_cliente,c.nombre_cliente,c.telefono
from cliente c left join pedido p on c.codigo_cliente=p.codigo_cliente
where c.ciudad="Madrid" and p.codigo_pedido is not null group by c.codigo_cliente;
--en esta vista no podremos insertar o modificar datos ya que tiene un group by (10tDB, pag 16)

    -- 5.directoresNivel2: Empleados cuyo jefe sea el empleado del jefe de la empresa. --revisar
create view directoresNivel2 as 
select e3.nombre as 'nombre empleado', e3.apellido1 as 'apellido empleado'
from empleado e3 where e3.codigo_jefe =all (select nombre as 'nombre empleado', apellido1 as 'apellido empleado' 
from empleado e1 where e1.codigo_jefe = (select e2.codigo_empleado from empleado e2 where e2.codigo_jefe is null));

-- 2. Inserta una fila en cada una de las vistas creadas en el ejercicio anterior. ¿Has podido
-- realizarlo en todas las vistas?
--No en las vistas con group by, having, distinct, union, union all, unciones agregadas (max, min, sum, count)
--no podemos añadir o modificar datos.