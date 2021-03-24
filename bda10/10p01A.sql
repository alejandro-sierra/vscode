use jardineria;

-- 1.- ¿Qué índices hay en la tabla producto? Escribe las dos instrucciones SQL que nos permiten
-- obtener esta información de la tabla.

--No existen indices creados, existen los indices por defecto que se crean para las claves primarias y ajenas.

show index from producto;
show index from producto from jardineria;
show index from jardineria.producto;


-- 2.- Mediante la instrucción EXPLAIN indica cuál de las dos consultas realizará menos comparaciones
-- para encontrar el producto que estamos buscando. ¿Cuántas comparaciones se realizan en cada
-- caso? ¿Por qué?.
-- SELECT * FROM producto WHERE codigo_producto = 'OR-114';

--Esta tarda menos ya que coje el indice por defecto de la clave primaria para buscar el codigo del producto, por lo que solo
--solo hace una comparación.

-- SELECT * FROM producto WHERE nombre = 'Evonimus Pulchellus';

--Este tardará más ya que para buscar en el nombre no tenemos un indice por lo que tendra que realizar tantas comparaciones como
--palabra tengan todos los nombre de la tabla producto, por lo que tendrá que hacer 276 comparaiones lo que significa que tardará más.
create index idx_nombre_producto on producto(nombre);
--podemos crear este indice para que vaya mas rapida la consulta


-- 3.- ¿Cuál de las dos consultas será más eficiente?.
-- SELECT AVG(total) FROM pago WHERE YEAR(fecha_pago) = 2008;
-- SELECT AVG(total) FROM pago WHERE fecha_pago >= '2010-01-01' AND
-- fecha_pago <= '2010-12-31';

--Las dos son igual de eficientes ya que tienen 26 comparaciones ambas.


-- 4.- Optimiza la siguiente consulta creando índices cuando sea necesario.
-- SELECT * FROM cliente INNER JOIN pedido ON cliente.codigo_cliente =
-- pedido.codigo_cliente WHERE cliente.nombre_cliente LIKE 'A%';

create index idx_codigo_cliente on pedido(codigo_cliente); --mal
--Creamos un indice en la tabla pedido para el codigo del cliente lo que evitara que busque en toda la tabla de pedidos.


create fulltext index idx_nombre_cliente on cliente(nombre_cliente); 
--tenemos que crear un fulltext porque esta buscando dentro del contenido, no en la columna la completo

select * 
from cliente inner join pedido on cliente.codigo_cliente = pedido.codigo_cliente 
where math (cliente.nombre_cliente) against ('A%');
--cambiamos la consulta para que utilize el indice