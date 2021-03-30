-- C) A partir de la base de datos de jardinería:
-- 1. Inserta en la tabla empleados un empleado por cada director de oficina que haya almacenado.
-- Este nuevo empleado tendrá como nombre “Hijo de XXXX”, donde XXX es el nombre de su
-- padre/madre (deberás usar la función concat). Además, estos nuevos empleados tendrán a
-- sus padres como jefes directos y su puesto será “Becario”.

-- 2. Modifica los empleados que son representantes de ventas (y que representan a algún cliente) y
-- cuya oficina esté en España para que su extensión telefónica sea los 5 últimos dígitos del
-- teléfono de la oficina.

-- 3. Crea una vista y una tabla que contenga aquellos pedidos rechazados y no entregados
-- (vistaPRNE y tablaPRNE). ¿Contienen los mismos datos?

-- 4. Elimina las líneas de pedido ( y posteriormente los pedidos) de aquellos pedidos rechazados y
-- no entregados cuyo clientes no han realizado el pago con PayPal. (no utilices ni la vista ni la
-- tabla creada en el ejercicio anterior).

-- 5. Consultas los datos de vistaPRNE y tablaPRNE. ¿Siguen teniendo los mismos datos?
-- ¿Puedes borrar un registro de tablaPRNE sin necesidad de borrar las referencias que tenga
-- en detalle_pedido?
