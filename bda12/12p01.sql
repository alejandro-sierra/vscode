-- 1.- Manejo de errores
-- 1) Crea una tabla alumno con las siguientes columnas:
-- *id: entero sin signo (clave primaria).
-- *nombre: cadena de 50 caracteres.
-- *apellido1: cadena de 50 caracteres.
-- *apellido2: cadena de 50 caracteres.
DROP DATABASE tema12;
CREATE DATABASE IF NOT EXISTS tema12;
USE tema12;

CREATE TABLE alumnos(
    id INT unsigned PRIMARY KEY,
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50)
);

-- 2) Crea un procedimiento llamado insertarAlumno que reciba
-- los cuatro datos como parámetros de entrada y los inserte en
-- la tabla
-- *El procedimiento devolverá como salida un parámetro
-- llamado error que tendrá un valor igual a 0 si la operación
-- se ha podido realizar con éxito o 1 en caso contrario.
-- *Deberá manejar los errores que puedan ocurrir cuando se
-- intenta insertar una fila que contiene una clave primaria
-- repetida. --ERROR 1062 
DELIMITER //
CREATE or replace PROCEDURE insertarAlumno(INT id VARCHAR(50) nombre VARCHAR(50) apellido1 VARCHAR(50) apellido2)
BEGIN
    DECLARE CONTINUE HANDLER FOR 1062     
        BEGIN
            set @error = 0;
        END;
    INSERT INTO alumnos VALUES (id,nombre,apellido1,apellido2);
    set @error = 1;
END
//
DELIMITER ;
CALL insertarAlumno(1,"Alejandro","Ballesta","Sierra");
SELECT * FROM alumnos;



-- 2.- No encontrado
-- A partir de la base de datos de jardineria:
-- 1) Escribe un procedimiento (nombreClienteIf) que
-- muestre el nombre de un cliente dado su código. En
-- caso de que no se encuentre, devolverá "Cliente
-- no encontrado".
-- *1) Utiliza if para contar si ha encontrado al cliente
-- 2) Vuelve a hacer el ejercicio anterior
-- (nombreClienteHandler) pero ahora utiliza un
-- manejador de errores (sin usar if)
-- *1) Debes comprobar el error NOT FOUND
-- *2) La consulta debe guardar el resultado en una variable
-- mediante SELECT ... INTO

-- 3.- SQLException
-- *Escribe un procedimiento (crearOficina)
-- que cree una oficina a partir de un código,
-- ciudad, país, código postal, teléfono y
-- dirección.
-- *Si el código de la oficina ya existe, modificará
-- los datos de dicha oficina con los recibidos
-- como parámetros.

-- 4.- Transacciones
-- 1) Ejecuta el siguiente script
-- 2) ¿Qué contiene la tabla producto?
-- 3) Simula que perdemos la conexión con el servidor antes de que la
-- transacción sea completada
-- *Para simular la pérdida de conexión, cierra la conexión con la BD.
-- 4) Vuelve a conectar y comprueba el contenido de la tabla producto.

-- 5.- Transacciones II

-- 6.- Procedimiento transaccional
-- *Crea la base de datos cine con las siguientes tablas:
-- **Tabla cuentas:
-- ***idCuenta: entero sin signo (pk).
-- ***saldo: real sin signo.
-- **Tabla entradas:
-- ***idButaca: entero sin signo (pk).
-- ***nif: cadena de 9 caracteres.
-- *Crear un procedimiento llamado comprarEntrada que
-- recibe 3 parámetros de entrada (nif, idCuenta,
-- idButaca) y devolverá como salida un parámetro
-- llamado error que tendrá un valor igual a 0 si la
-- operación se ha podido realizar con éxito o 1 en caso contrario.
-- *Pasos del procedimiento de compra:
-- 1) Inicia una transacción.
-- 2) Actualiza cuentas.saldo cobrando 5 euros a la cuenta con
-- el idCuenta adecuado.
-- 3) Inserta una fila en la tabla entradas indicando la butaca
-- (idButaca) que acaba de comprar el usuario (nif).
-- 4) Comprueba si ha ocurrido algún error en las operaciones
-- anteriores. Si todo va bien aplica un COMMIT a la transacción y
-- si ha ocurrido algún error haz ROLLBACK.
-- *Debe manejar los errores ERROR 1264 (Out of range value) y
-- ERROR 1062 (Duplicate entry for PRIMARY KEY).
-- *¿Qué ocurre si se compra una entrada y le pasamos como
-- parámetro un número de cuenta inexistente? ¿Ocurre algún error
-- o podemos comprar la entrada? En caso de que exista algún
-- error, ¿cómo podríamos resolverlo?.