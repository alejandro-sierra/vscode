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
create or replace procedure 12posNegCero(numero int)
begin
    declare resultado varchar(128);
    if numero < 0 then
        set resultado = "numero negativo";
    elseif numero > 0 then
        set resultado = "numero positivo";
    else
        set resultado = "numero es 0";
    end if;
    select resultado;
end
//
DELIMITER ;

call 12posNegCero(0);

-- 3) Modifica el procedimiento anterior (13posNegCeroOut)
-- para que tenga un parámetro de entrada, con el valor un
-- número real, y un parámetro de salida con el resultado.
DELIMITER //
create or replace procedure 12posNegCero(in numero int, out resultado varchar(128))
begin
    declare resultado varchar(128);
    if numero < 0 then
        set resultado = "numero negativo";
    elseif numero > 0 then
        set resultado = "numero positivo";
    else
        set resultado = "numero es 0";
    end if;
    select resultado;
end
//
DELIMITER ;

call 12posNegCero(12);

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
DELIMITER //
create or replace procedure 14nota(nota int)
begin
    declare resultado varchar(128);
    if nota >= 0 and nota <= 5 then
        set resultado = "insuficiente";
    elseif nota > 5 and nota <= 6 then
        set resultado = "aprobado";
    elseif nota > 6 and nota <= 7 then
        set resultado = "bien";
    elseif nota > 7 and nota <= 9 then
        set resultado = "notable";
    else
        set resultado = "sobresaliente";
    end if;
    select resultado;
end
//
DELIMITER ;

call 14nota(0);

-- 5) Modifica el ejercicio anterior para que el nuevo
-- procedimiento (15notaOut) tenga un parámetro de
-- entrada, con el valor de la nota en formato numérico y un
-- parámetro de salida, con una cadena de texto indicando
-- la nota correspondiente.
DELIMITER //
create or replace procedure 15notaOut(nota int, out resultado varchar(128))
begin
    declare resultado varchar(128);
    if nota >= 0 and nota <= 5 then
        set resultado = "insuficiente";
    elseif nota > 5 and nota <= 6 then
        set resultado = "aprobado";
    elseif nota > 6 and nota <= 7 then
        set resultado = "bien";
    elseif nota > 7 and nota <= 9 then
        set resultado = "notable";
    else
        set resultado = "sobresaliente";
    end if;
    select resultado;
end
//
DELIMITER ;

call 15notaOut(0, @resultado);

-- 6) Resuelva el procedimiento diseñado en el ejercicio
-- anterior haciendo uso de la estructura de control CASE
-- (16notaCase).

DELIMITER //
create or replace procedure 16notaCase(nota int)
begin
    declare resultado varchar(128);
    case
    when nota < 0 then
        set resultado = "insuficiente";
    when nota < 6 then
        set resultado = "aprobado";
    when nota < 7 then
        set resultado = "bien";
    when nota < 9 then
        set resultado = "notable";
    else
        set resultado = "sobresaliente";
    end case;
    select resultado;
end
//
DELIMITER ;

call 16notaCase(0);

-- DELIMITER //
-- create or replace procedure 16notaCase(nota int)
-- begin
--     declare resultado varchar(128);
--     case
--     when nota >= 0 and nota <= 5 then
--         set resultado = "insuficiente";
--     when nota > 5 and nota <= 6 then
--         set resultado = "aprobado";
--     when nota > 6 and nota <= 7 then
--         set resultado = "bien";
--     when nota > 7 and nota <= 9 then
--         set resultado = "notable";
--     else
--         set resultado = "sobresaliente";
--     end case;
--     select resultado;
-- end
-- //
-- DELIMITER ;

-- call 16notaCase(0);

-- 7) Escribe un procedimiento (17diaSemana) que reciba
-- como entrada un entero que represente un día de la
-- semana y que devuelva una cadena con el nombre del
-- día de la semana correspondiente.
-- --Por ejemplo, para la entrada 1 debería devolver Lunes.
DELIMITER //
create or replace procedure 17diaSemana(diaSemana int)
begin
    declare resultado varchar(128);
    case diaSemana
    when 1 then
        set resultado = "lunes";
    when 2 then
        set resultado = "martes";
    when 3 then
        set resultado = "miercoles";
    when 4 then
        set resultado = "jueves";
    when 5 then
        set resultado = "viernes";
    when 6 then
        set resultado = "sabado";
    else
        set resultado = "domingo";
    end case;
    select resultado;
end
//
DELIMITER ;

call 17diaSemana(5);

--Procedimiento con SQL
-- -- A partir de la base de datos jardineria:
-- 1) Escribe un procedimiento (21clientesPais) que
-- reciba el nombre de un país como entrada y realice
-- una consulta sobre la tabla cliente para obtener
-- todos los clientes que existen en la tabla de ese país.
DELIMITER //
CREATE or replace PROCEDURE 21clientesPais(variable VARCHAR(50))
BEGIN
select * from cliente where pais=variable;
END;
//
DELIMITER ;
call 21clientesPais("USA");

-- 2) Escribe un procedimiento (22pagoMaximoPorTipo)
-- que reciba como parámetro de entrada una forma de
-- pago (PayPal, Transferencia, etc), y muestre el
-- pago de máximo valor realizado para esa forma de
-- pago.
DELIMITER //
CREATE or replace PROCEDURE 22pagoMaximoPorTipo(variable VARCHAR(40))
BEGIN
select *,max(total) as "pago maximo" from pago where forma_pago=variable;
END;
//
DELIMITER ;
call 22pagoMaximoPorTipo("PayPal");

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
DELIMITER //
CREATE or replace PROCEDURE 23calculosTipoPago(variable VARCHAR(40))
BEGIN
select max(total) as "pago maximo", min(total) as "pago minimo",avg(total) as "pago medio", 
sum(total) as "suma todos pagos", count(id_transaccion) as "n pagos" from pago where forma_pago=variable;
END;
//
DELIMITER ;
call 23calculosTipoPago("PayPal");