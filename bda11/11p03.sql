-- 1) Escribe una función (31par) que reciba un entero como
-- entrada y devuelva TRUE si el número es par o FALSE
-- en caso contrario.
delimiter //
create or replace function 31par(numero int)
    returns boolean
begin
    declare resultado varchar(50);
        if numero % 2 = 0 then
            set resultado = TRUE;
        else
            set resultado = FALSE;
        end if;
    return resultado;
end;
//
delimiter ;
select 31par(2);

-- 2) Escribe una función (32mayor2) que tras recibir dos
-- enteros, devuelva el mayor de los dos.
delimiter //
create or replace function 32mayor2(n int, m int)
    returns int
begin
    declare resultado int;
        if n > m then
            set resultado = n;
        else
            set resultado = m;
        end if;
    return resultado;
end;
//
delimiter ;
select 32mayor2(2, 10);

-- 3) Escribe una función (33mayor3) que tras recibir tres
-- enteros, devuelva el mayor de los tres.
delimiter //
create or replace function 33mayor3(a int, b int, c int)
    returns int
begin
    declare resultado int;
        if (a > b and a > c) then
            set resultado = a;
        elseif (b > a and b > c) then
            set resultado = b;
        else
            set resultado = c;
        end if;
    return resultado;
end;
//
delimiter ;
select 33mayor3(1, 11, 13);

-- 4) Escribe una función (34anyosEntreFechas) que
-- devuelva como salida el número de años que han
-- transcurrido entre dos fechas que se reciben como
-- parámetros de entrada.
-- --Por ejemplo, si pasamos como parámetros de entrada
-- --las fechas 2021-01-01 y 2011-01-01 la función tiene que
-- --devolver que han pasado 10 años.   
-- --Debes emplear las siguientes funciones:
-- -- --DATEDIFF: https://mariadb.com/kb/en/datediff/
-- -- --TRUNCATE: https://mariadb.com/kb/en/truncate/
delimiter //
create or replace function 34anyosEntreFechas(fecha1 date, fecha2 date)
    returns int
begin
    declare resultado int;
    set resultado = (datediff(fecha1, fecha2)); --dias 
    set resultado = truncate(resultado / 365); --lo pasamos a anyos
    return resultado;
end;
//
delimiter ;
select 34anyosEntreFechas('2020-01-01', '2018-01-01');

-- 5) Escribe una función (35diaSemana) que a partir de una
-- fecha, devuelva el día de la semana mediante texto
-- (Lunes, Martes, ....).
-- --Recuerda que en el ejercicio 17diaSemana mostrabas
-- --el día de la semana a partir de un número.
-- --Debes emplear la siguiente función:
-- -- --WEEKDAY: https://mariadb.com/kb/en/weekday/
DELIMITER //
create or replace function 35diaSemana(diaSemana date)
    returns varchar(128)
begin
    declare resultado varchar(128);
    declare variable int;
    set variable = (weekday (diaSemana));
    case variable
    when 0 then
        set resultado = "lunes";
    when 1 then
        set resultado = "martes";
    when 2 then
        set resultado = "miercoles";
    when 3 then
        set resultado = "jueves";
    when 4 then
        set resultado = "viernes";
    when 5 then
        set resultado = "sabado";
    when 6 then
        set resultado = "domingo";
    else
        set resultado = "valor no valido";
     end case;
   return resultado;
end;
//
DELIMITER ;

select 35diaSemana('1999-09-23');

-- A partir de la base de datos tienda:
-- 1) Escribe una función (41totalProductos) que
-- devuelva el número total de productos que hay en la
-- tabla productos.
DELIMITER //
create or replace function 41totalProductos()
    returns int
begin
    declare resultado int;
    set resultado = (select count(codigo) from tienda.producto);
    --select count(codigo) into resultado from producto;    
    return resultado;
end;
//
DELIMITER ;

select 41totalProductos();

-- 2) Escribe una función
-- (42precioMedioPorFabricante) que devuelva el
-- valor medio del precio de los productos de un
-- determinado fabricante que se recibirá como
-- parámetro de entrada.
-- --El parámetro de entrada será el nombre del fabricante. --revisar
DELIMITER //
create or replace function 42precioMedioPorFabricante(nombre varchar(100))
    returns int
begin
    declare resultado int;
    set resultado = (select avg(p.precio) from producto p join fabricante f on p.codigo_fabricante=f.codigo where f.nombre=nombre);
    --select avg(p.precio) into resultado from producto p join fabricante f on p.codigo_fabricante=f.codigo where f.nombre=nombre;
    return resultado;
end;
//
DELIMITER ;

select 42precioMedioPorFabricante('Asus');

-- 3) Escribe una función
-- (43precioMaxPorFabricante) que devuelva el
-- valor máximo del precio de los productos de un
-- determinado fabricante que se recibirá como parámetro de entrada.
DELIMITER //
create or replace function 43precioMaxPorFabricante(nombre varchar(100))
    returns int
begin
    declare resultado int;
    set resultado = (select max(p.precio) from producto p join fabricante f on p.codigo_fabricante=f.codigo where f.nombre=nombre);
    select max(p.precio) into resultado from producto p join fabricante f on p.codigo_fabricante=f.codigo where f.nombre=nombre);
    return resultado;
end;
//
DELIMITER ;

select 43precioMaxPorFabricante('Asus');

-- 4) Escribe una función
-- (44precioMinPorFabricante) que devuelva el
-- valor mínimo del precio de los productos de un
-- determinado fabricante que se recibirá como
-- parámetro de entrada.
DELIMITER //
create or replace function 44precioMinPorFabricante(nombre varchar(100))
    returns int
begin
    declare resultado int;
    set resultado = (select min(p.precio) from producto p join fabricante f on p.codigo_fabricante=f.codigo where f.nombre=nombre);
    --select min(p.precio) into resultado from producto p join fabricante f on p.codigo_fabricante=f.codigo where f.nombre=nombre;
    return resultado;
end;
//
DELIMITER ;

select 44precioMinPorFabricante('Asus');