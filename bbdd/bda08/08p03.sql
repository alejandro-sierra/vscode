-- 1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

-- 2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

-- 3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un
-- código de jefe igual a 7.

-- 4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

-- 5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean
-- representantes de ventas.

-- 6. Devuelve un listado con el nombre de los todos los clientes españoles.

-- 7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.

-- 8. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en
-- 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan
-- repetidos. Resuelva la consulta:

    -- 1. Utilizando la función YEAR de MySQL.
    
    -- 2. Utilizando la función DATE_FORMAT de MySQL.
    
    -- 3. Sin utilizar ninguna de las funciones anteriores.

-- 9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de
-- entrega de los pedidos que no han sido entregados a tiempo.

-- 10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de
-- entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha
-- esperada.

    -- 1. Utilizando la función ADDDATE de MySQL.

    -- 2. Utilizando la función DATEDIFF de MySQL.

    -- 3. ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?

-- 11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

-- 12. Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de
-- cualquier año.

-- 13. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal.
-- Ordene el resultado de mayor a menor.

-- 14. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en
-- cuenta que no deben aparecer formas de pago repetidas.

-- 15. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que
-- tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta,
-- mostrando en primer lugar los de mayor precio.

-- 16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo
-- representante de ventas tenga el código de empleado 11 o 30.
-- Consultas multitabla (Composición interna)

-- 17.Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de
-- ventas.

-- 18.Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus
-- representantes de ventas.

-- 19.Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus
-- representantes de ventas.

-- 20. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes
-- junto con la ciudad de la oficina a la que pertenece el representante.

-- 21. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus
-- representantes junto con la ciudad de la oficina a la que pertenece el representante.

-- 22. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

-- 23. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la
-- oficina a la que pertenece el representante.

-- 24. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

-- 25. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

-- 26. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

-- Consultas multitabla (Composición externa)
-- 27. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

-- 28. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.

-- 29. Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no
-- han realizado ningún pedido.

-- 30. Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.

-- 31. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.

-- 32. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado
-- junto con los datos de la oficina donde trabajan.

-- 33. Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que
-- no tienen un cliente asociado.

-- 34. Devuelve un listado de los productos que nunca han aparecido en un pedido.

-- 35. Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe
-- mostrar el nombre, la descripción y la imagen del producto.

-- 36. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los
-- representantes de ventas de algún cliente que haya realizado la compra de algún producto de
-- la gama Frutales.
-- 37. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado
-- ningún pago.

-- 38. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el
-- nombre de su jefe asociado.

-- Consultas con funciones agregadas
-- 39. ¿Cuántos empleados hay en la compañía?

-- 40. ¿Cuál fue el pago medio en 2009?

-- 41. Calcula el precio de venta del producto más caro y más barato en una misma consulta.

-- 42. Calcula el número de clientes que tiene la empresa.

-- 43. ¿Cuántos clientes tiene la ciudad de Madrid?