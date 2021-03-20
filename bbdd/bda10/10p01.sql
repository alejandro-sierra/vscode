use jardineria;

-- 1.- ¿Qué índices hay en la tabla producto? Escribe las dos instrucciones SQL que nos permiten
-- obtener esta información de la tabla.
show index from producto;
show index from producto from jardineria;
show index from jardineria.producto;

-- 2.- Mediante la instrucción EXPLAIN indica cuál de las dos consultas realizará menos comparaciones
-- para encontrar el producto que estamos buscando. ¿Cuántas comparaciones se realizan en cada
-- caso? ¿Por qué?.
-- SELECT * FROM producto WHERE codigo_producto = 'OR-114';


-- SELECT * FROM producto WHERE nombre = 'Evonimus Pulchellus';


-- 3.- ¿Cuál de las dos consultas será más eficiente?.
-- SELECT AVG(total) FROM pago WHERE YEAR(fecha_pago) = 2008;
-- SELECT AVG(total) FROM pago WHERE fecha_pago >= '2010-01-01' AND
-- fecha_pago <= '2010-12-31';

-- 4.- Optimiza la siguiente consulta creando índices cuando sea necesario.
-- SELECT * FROM cliente INNER JOIN pedido ON cliente.codigo_cliente =
-- pedido.codigo_cliente WHERE cliente.nombre_cliente LIKE 'A%';