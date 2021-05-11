/*
1.- Manejo de errores
1) Crea una tabla alumno con las siguientes columnas:
-id: entero sin signo (clave primaria).
-nombre: cadena de 50 caracteres.
-apellido1: cadena de 50 caracteres.
-apellido2: cadena de 50 caracteres.
*/

DROP DATABASE tema12;
CREATE DATABASE IF NOT EXISTS tema12;
USE tema12;

CREATE TABLE alumnos(
    id INT unsigned PRIMARY KEY,
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50)
);

/*
2) Crea un procedimiento llamado insertarAlumno que reciba
los cuatro datos como parámetros de entrada y los inserte en
la tabla
-El procedimiento devolverá como salida un parámetro
llamado error que tendrá un valor igual a 0 si la operación
se ha podido realizar con éxito o 1 en caso contrario.
-Deberá manejar los errores que puedan ocurrir cuando se
intenta insertar una fila que contiene una clave primaria
repetida. --ERROR 1062
*/

DELIMITER //
CREATE or replace PROCEDURE insertarAlumno(id INT, nombre VARCHAR(50), apellido1 VARCHAR(50), apellido2 VARCHAR(50))
BEGIN
    DECLARE CONTINUE HANDLER FOR 23000     
        BEGIN
            set @error = 0;
        END;
    INSERT INTO alumnos VALUES (id,nombre,apellido1,apellido2);
    set @error = 1;
END;
//
DELIMITER ;
CALL insertarAlumno(1,"Alejandro","Ballesta","Sierra");

SELECT * FROM alumnos;

/*
2.- No encontrado
A partir de la base de datos de jardineria:
1) Escribe un procedimiento (nombreClienteIf) que
muestre el nombre de un cliente dado su código. En
caso de que no se encuentre, devolverá "Cliente
no encontrado".
-1) Utiliza if para contar si ha encontrado al cliente
*/

DELIMITER //
CREATE or replace PROCEDURE nombreClienteIf(codigo INT)
BEGIN
    declare resultado varchar(50);
    set resultado = (select nombre_cliente from cliente where codigo_cliente = codigo);

    if exists (select nombre_cliente from cliente where codigo_cliente = codigo) then
        begin
            select resultado;
        end;
    else
        begin
            set resultado = 'Cliente no encntrado';
            select resultado;
        end;
    end if;
END;
//
DELIMITER ;
CALL nombreClienteIf(6);

/*
2) Vuelve a hacer el ejercicio anterior
(nombreClienteHandler) pero ahora utiliza un
manejador de errores (sin usar if)
-1) Debes comprobar el error NOT FOUND
-2) La consulta debe guardar el resultado en una variable
mediante SELECT ... INTO
*/

DELIMITER //
CREATE or replace PROCEDURE nombreClienteHandler(codigo INT)
BEGIN
    declare resultado varchar(50);
    set resultado = (select nombre_cliente from cliente where codigo_cliente = codigo);

    DECLARE EXIT HANDLER FOR NOT FOUND     
        begin
            set resultado = 'Cliente no encntrado';
            select resultado;
        end;
        begin
            select resultado;
        end;
END;
//
DELIMITER ;
CALL nombreClienteHandler(1);

/*
3.- SQLException
-Escribe un procedimiento (crearOficina)
que cree una oficina a partir de un código,
ciudad, país, código postal, teléfono y
dirección.
-Si el código de la oficina ya existe, modificará
los datos de dicha oficina con los recibidos
como parámetros.
*/

DELIMITER //
CREATE or replace PROCEDURE insertarAlumno(codigo varchar(10), ciudad VARCHAR(30), pais VARCHAR(50), codigoPostal VARCHAR(10), telefono VARCHAR(20), direccion VARCHAR(50))
BEGIN
    DECLARE CONTINUE HANDLER FOR 1062     
        BEGIN
            update oficina set codigo_oficina = codigo, ciudad = ciudad,pais = pais, region = null
            , codigo_postal = codigoPostal, telefono = telefono, linea_direccion1= direccion, linea_direccion1 = null;
        END;
    INSERT INTO oficina VALUES (codigo,ciudad,pais,null,codigoPostal,telefono,direccion,null);
END;
//
DELIMITER ;
CALL insertarAlumno("SPA","Barcelona","España","03206","+ 34 654 645 757", "Avenida de la Libertad");

/*
4.- Transacciones
-1) Ejecuta el siguiente script
-2) ¿Qué contiene la tabla producto?
La tabla contiene los tres datos insertados anteriormente, ya que todavia estados dentro de mariadb

-3) Simula que perdemos la conexión con el servidor antes de que la
transacción sea completada
--Para simular la pérdida de conexión, cierra la conexión con la BD.
Al perder la conexión te borran todo lo que hemos insertado ya que una trasferecia debe ser finalizada
con un commit para guardar los datos, o en su defecto estar en autocommit=1.

-4) Vuelve a conectar y comprueba el contenido de la tabla producto.
Se ha borrado todo los datos de la tabla ya que teniamos el autocommit a 0.
*/

/*
5.- Transacciones II
SET AUTOCOMMIT = 1;
SELECT @@AUTOCOMMIT;

TRUNCATE producto;

INSERT INTO producto (id, nombre) VALUES (1, 'Primero');
INSERT INTO producto (id, nombre) VALUES (2, 'Segundo');
INSERT INTO producto (id, nombre) VALUES (3, 'Tercero');

-- 1. Ejecutamos la siguiente transacción
START TRANSACTION;
INSERT INTO producto (id, nombre) VALUES (4, 'Cuarto');
SELECT * FROM producto;
ROLLBACK;

-- 2.  ¿Qué devolverá esta consulta? Justifique su respuesta.
SELECT * FROM producto;
Al hacer rollback regresamos al ultimo commit realizado, es decir, al tener el autocommit=1
el ultimo commit que  se a relizado es al teminar la inserción del 'Tercero'.

-- 3. Ejecutamos la siguiente transacción
INSERT INTO producto (id, nombre) VALUES (5, 'Quinto');
ROLLBACK;

-- 4.  ¿Qué devolverá esta consulta? Justifique su respuesta.
SELECT * FROM producto;
Tenemos en la tabla el Primero, Segundo,Tercero y el Quinto, el rollback a vuleto al ultimo commit
realizado que al igual que el anterior al tener el autocommit=1, el ultimo commit es al finalizar
la inserción del quiento por lo que no cambia al hacer rollback. 

-- 5. Desactivamos el modo AUTOCOMMIT y borramos el contenido de la tabla
SET AUTOCOMMIT = 0;
SELECT @@AUTOCOMMIT;
DELETE FROM producto WHERE id > 0;

-- 6. Comprobamos que la tabla esta vacia
SELECT * FROM producto;

-- 7. Insertamos dos filas nuevas
INSERT INTO producto (id, nombre) VALUES (6, 'Sexto');
INSERT INTO producto (id, nombre) VALUES (7, 'Séptimo');
SELECT * FROM producto;

-- 8. Hacemos un ROLLBACK
ROLLBACK;

-- 9.  ¿Qué devolverá esta consulta? Justifique su respuesta.
SELECT * FROM producto;
Con rollback volvemos al ultimo commit realizado que es cuando el autocommit valia 1
, por lo que no tenemos ni el 6 ni el 7 ya que no habiamos relizado ningun commit, pero 
si tenemos el 1, 2, 3, 5 porque es la situación del ultimo commit=1.

-- 10. Ejecutamos la siguiente transacción
SET AUTOCOMMIT = 0;
START TRANSACTION;
CREATE TABLE fabricante (id INT UNSIGNED);
INSERT INTO fabricante (id) VALUES (1);
SELECT * FROM fabricante;
ROLLBACK;

-- 11. ¿Se puede hacer ROLLBACK de instrucciones de tipo DDL?
-- (CREATE, ALTER, DROP, RENAME y TRUNCATE)
No, no se puede hacer porque si cortamos la conexión (salir de mariadb) se para la transición
y no se guarda el insert, pero no nos borra la tabla a pesar de que también estaba dentro de la 
misma transición.
*/

/*
6.- Procedimiento transaccional
-Crea la base de datos cine con las siguientes tablas:
--Tabla cuentas:
---idCuenta: entero sin signo (pk).
---saldo: real sin signo.
--Tabla entradas:
---idButaca: entero sin signo (pk).
---nif: cadena de 9 caracteres.

-Crear un procedimiento llamado comprarEntrada que
recibe 3 parámetros de entrada (nif, idCuenta,
idButaca) y devolverá como salida un parámetro
llamado error que tendrá un valor igual a 0 si la
operación se ha podido realizar con éxito o 1 en caso contrario.
-Pasos del procedimiento de compra:
1) Inicia una transacción.
2) Actualiza cuentas.saldo cobrando 5 euros a la cuenta con
el idCuenta adecuado.
3) Inserta una fila en la tabla entradas indicando la butaca
(idButaca) que acaba de comprar el usuario (nif).
4) Comprueba si ha ocurrido algún error en las operaciones
anteriores. Si todo va bien aplica un COMMIT a la transacción y
si ha ocurrido algún error haz ROLLBACK.
-Debe manejar los errores ERROR 1264 (Out of range value) y
ERROR 1062 (Duplicate entry for PRIMARY KEY).
-¿Qué ocurre si se compra una entrada y le pasamos como
parámetro un número de cuenta inexistente? ¿Ocurre algún error
o podemos comprar la entrada? En caso de que exista algún
error, ¿cómo podríamos resolverlo?.
*/
DROP DATABASE cine;
CREATE DATABASE IF NOT EXISTS cine;
USE cine;

CREATE TABLE cuentas(
    idCuenta INT unsigned PRIMARY KEY,
    saldo float unsigned
);
CREATE TABLE entradas(
    idButaca INT unsigned PRIMARY KEY,
    nif VARCHAR(9)

);


DELIMITER //
CREATE or replace PROCEDURE comprarEntrada(nifPro varchar(9), idCuentaPro int, idButacaPro int, out error int)
BEGIN
    DECLARE CONTINUE HANDLER FOR 1062, 1264     
        BEGIN
            set error = 0;
            rollback;
        END;
    start transaction;
    update cuentas.saldo set saldo=-5 where idCuenta = idCuentaPro;
    insert into entradas values (idButacaPro,nifPro);
    commit;
END;
//
DELIMITER ;
CALL comprarEntrada ("12345678A",1,1,@error);