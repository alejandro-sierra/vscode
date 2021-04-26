-- 4) Crea una base de datos llamada procedimientos
-- que contenga una tabla llamada 24secuencia, que
-- contenga una única columna llamada numero de tipo
-- INT UNSIGNED.
DROP DATABASE IF EXISTS procedimientos;
CREATE DATABASE procedimientos CHARACTER SET utf8mb4;
USE procedimientos;

CREATE TABLE 24secuencia (
  numero INT UNSIGNED PRIMARY KEY
);

-- 5) Crea un procedimiento (25secuenciaWhile)que,
-- mediante un bucle WHILE:
-- -- Reciba un parámetro de entrada llamado
-- -- valorInicial de tipoINT UNSIGNED
-- -- Almacene en la tabla 24secuencia toda la secuencia
-- -- de números desde el valorInicial hasta el 1.
-- -- -- El procedimiento deberá eliminar el contenido de la tabla
-- -- -- antes de insertar los nuevos valores.
DELIMITER //
CREATE or replace PROCEDURE 25secuenciaWhile(IN valorInicial INT UNSIGNED)
BEGIN	
DECLARE contador INT;
TRUNCATE TABLE 24secuencia;
SET contador = valorInicial;
WHILE contador > 0 DO
INSERT INTO 24secuencia VALUES (contador); 
SET contador = contador - 1;
END WHILE;
END
//
DELIMITER ;
CALL 25secuenciaWhile(6);
SELECT * FROM 24secuencia;

-- 6) Resuelve el ejercicio anterior pero utilizando un bucle
-- REPEAT (26secuenciaRepeat).
DELIMITER //
CREATE or replace PROCEDURE 26secuenciaRepeat(IN valorInicial INT UNSIGNED)
BEGIN	
DECLARE contador INT;
TRUNCATE TABLE 24secuencia;
SET contador = valorInicial;
REPEAT
INSERT INTO 24secuencia VALUES (contador); 
SET contador = contador - 1;
UNTIL contador < 0
END REPEAT;
END
//
DELIMITER ;
CALL 26secuenciaRepeat(6);
SELECT * FROM 24secuencia;

-- 7) Vuelve a resolver el ejercicio pero ahora con un bucle
-- LOOP (27secuenciaLoop). --no funciona
DELIMITER //
CREATE or replace PROCEDURE 27secuenciaLoop(IN valorInicial INT UNSIGNED)
BEGIN	
DECLARE contador INT;
TRUNCATE TABLE 24secuencia;
SET contador = valorInicial;
bucle: LOOP
IF contador > 0 THEN
LEAVE INSERT INTO 24secuencia VALUES (contador); 
END IF;
SET contador = contador - 1;
END LOOP;
END
//
DELIMITER ;
CALL 27secuenciaLoop(6);
SELECT * FROM 24secuencia;

-- 8) Dentro de la base de datos de procedimientos, crea
-- dos tablas (28par, 28impar). Ambas deben
-- contener una única columna llamada numero de tipo
-- INT UNSIGNED.

-- 9) Crea un procedimiento (29paresImpares) que
-- reciba un parámetro de entrada llamado tope de tipo
-- INT UNSIGNED y deberá almacenar en la tabla
-- 28par aquellos números pares que existan entre el
-- número 1 y el tope. De igual manera, insertará los impares en 28impar.
-- -- El procedimiento deberá eliminar el contenido de la
-- -- tabla antes de insertar los nuevos valores.

-- 10)Resuelve el ejercicio anterior pero utilizando un
-- bucle REPEAT (210secuenciaRepeat).

-- 11)Vuelve a resolver el ejercicio pero ahora con un
-- bucle LOOP (211secuenciaLoop).