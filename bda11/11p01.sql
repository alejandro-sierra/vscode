--Procesimientos sin SQL
-- 1) Escribe un procedimiento (11holaMundo) que no tenga
-- ningún parámetro de entrada ni de salida y que muestre
-- el texto ¡Hola mundo desde el Severo!.
DELIMITER //
create or replace procedure 11holaMundo()
begin
select "¡Hola mundo desde el Severo!";
end
//
DELIMITER ;

call 11holaMundo();

-- 2) Escribe un procedimiento (12posNegCero) que reciba un
-- número real de entrada y muestre un mensaje indicando
-- si el número es positivo, negativo o cero.
DELIMITER //
create or replace procedure 12posNegCero(numero integer)
begin
    declare resultado integer;
    if numero < 0 then
        set resultado = "numero negativo";
    elseif numero > 0 then
        set resultado = "numero positivo";
    else numero = 0 then
        set resultado = "numero es 0";
    end if;
    select resultado;
end
//
DELIMITER ;

call 12posNegCero(12);


-- 3) Modifica el procedimiento anterior (13posNegCeroOut)
-- para que tenga un parámetro de entrada, con el valor un
-- número real, y un parámetro de salida con el resultado.

-- 4) Escribe un procedimiento (14nota) que reciba un número
-- real de entrada, que representa el valor de la nota de un
-- alumno, y muestre un mensaje indicando qué nota ha
-- obtenido teniendo en cuenta las siguientes condiciones:
-- [0,5) = Insuficiente
-- [5,6) = Aprobado
-- [6, 7) = Bien
-- [7, 9) = Notable
-- [9, 10] = Sobresaliente
-- En cualquier otro caso la nota no será válida.

-- 5) Modifica el ejercicio anterior para que el nuevo
-- procedimiento (15notaOut) tenga un parámetro de
-- entrada, con el valor de la nota en formato numérico y un
-- parámetro de salida, con una cadena de texto indicando
-- la nota correspondiente.

-- 6) Resuelva el procedimiento diseñado en el ejercicio
-- anterior haciendo uso de la estructura de control CASE
-- (16notaCase).

-- 7) Escribe un procedimiento (17diaSemana) que reciba
-- como entrada un entero que represente un día de la
-- semana y que devuelva una cadena con el nombre del
-- día de la semana correspondiente.
-- --Por ejemplo, para la entrada 1 debería devolver Lunes.
-- -- A partir de la base de datos jardineria:

--Procedimiento con SQL
-- 1) Escribe un procedimiento (21clientesPais) que
-- reciba el nombre de un país como entrada y realice
-- una consulta sobre la tabla cliente para obtener
-- todos los clientes que existen en la tabla de ese país.

-- 2) Escribe un procedimiento (22pagoMaximoPorTipo)
-- que reciba como parámetro de entrada una forma de
-- pago (PayPal, Transferencia, etc), y muestre el
-- pago de máximo valor realizado para esa forma de
-- pago.

-- 3) Escribe un procedimiento (23calculosTipoPago)
-- que reciba como parámetro de entrada una forma de
-- pago (PayPal, Transferencia, etc) y muestre los
-- siguientes cálculos a partir de la forma de pago
-- seleccionada como parámetro de entrada:
-- -- el pago de máximo valor,
-- -- el pago de mínimo valor,
-- -- el valor medio de los pagos realizados,
-- -- la suma de todos los pagos,
-- -- el número de pagos realizados para esa forma de pago.





