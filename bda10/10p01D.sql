-- D) A partir de la base de datos de jardinería:
-- 1. Crea un usuario con login: auditor y contraseña: severo que sólo pueda realizar select en
-- toda la base de datos de jardineria. ¿Puede acceder a las vistas recién creadas?
CREATE USER 'auditor'@'localhost'
IDENTIFIED BY 'severo';
GRANT SELECT ON jardineria.* TO
'auditor'@'localhost';

--si se puede acceder a las vistas creadas

-- 2. Crea un usuario con login: comercial y contraseña: severo que solo pueda utilizar las tablas
-- de cliente, pedido y pago, tanto para consultar, insertar, modificar o borrar datos.
CREATE USER 'comercial'@'localhost'
IDENTIFIED BY 'severo';
GRANT ALL PRIVILEGES ON jardineria.cliente, jardineria.pedido, jardineria.pago TO
'comercial'@'localhost';

-- 3. Quítale el permiso de borrado al usuario comercial.

-- 4. Crea un usuario con login: comercialmadrid y contraseña: severo que solo permita
-- consultar la vista clienteMadridPedido.
CREATE USER 'comercialmadrid'@'localhost'
IDENTIFIED BY 'severo';
GRANT SELECT ON jardineria.clienteMadridPedido   TO
'comercialmadrid'@'localhost';