/*
1.- (2,5 p) Escribe un procedimiento llamado obtenerNumeroEmpleados que reciba como
parámetro de entrada el código de una oficina y devuelva mediante un parámetro de salida el
número de empleados que tiene. Si el código de la oficina no existe, deberá devolver -1.
Escribe una sentencia SQL que realice una llamada al procedimiento para comprobar que se
ejecuta correctamente.
*/
delimiter //
create or replace procedure obtenerNumeroEmpleados(in oficinaP varchar(10), out cuanta varchar(50))
begin
declare resultado varchar(50);
select *  into resultado from oficina where codigo_oficina = oficinaP;
    if resultado is null then
        set resultado = -1;
    else
        select count(codigo_empleado) into resultado from empleado where codigo_oficina = oficinaP;
    end if;
end;
delimiter ;

/*
2.- (2,5 p) Escribe una función llamada cantidadTotalDeProductosVendidos que reciba
como parámetro de entrada el código de un producto y devuelva la cantidad total de productos
que se han vendido con ese código (depende de la cantidad de detalle_pedido)
Escribe una sentencia SQL que realice una llamada a la función realizada para comprobar que se
ejecuta correctamente.
*/
delimiter //
create or replace function cantidadTotalDeProductosVendidoscodigoProducto(codigoProducto varchar(50)) 
	returns int
begin
declare resultado int;
    select sum(cantidad) into resultado from detalle_pedido where codigo_producto = codigoProducto;
    return resultado;
end;
delimiter ;

select cantidadTotalDeProductosVendidoscodigoProducto("FR-40")

/*
3.- (3 p) A partir de la siguiente tabla:
Escribe un procedimiento llamado estadísticasProductosVendidos que para cada uno de
los productos de la tabla producto calcule la cantidad total de unidades que se han vendido
(utiliza la función del ejercicio anterior) y almacene esta información en la tabla
productosVendidos, todo dentro de una transacción.
*/
delimiter //
create or replace procedure estadísticasProductosVendidos()
begin
    declare salir int default 0;
    declare codigoProducto varchar(15);
    declare cur cursor for select codigo_producto from detalle_pedido;
   
   declare exit handler for not found close cur;

    declare continue handler for SQLEXCEPTION
    begin
        rollback;
    end;

    open cur;

    start transaction;
        while salir = 0 do
        fetch cur into codigoProducto;
            insert into productosVendidos values (null,codigoProducto,(cantidadTotalDeProductosVendidoscodigoProducto(codigoProducto)));
        end while;
    commit;

end;
delimiter ;

/*
3.- (3 p) A partir de la siguiente tabla:
Escribe un trigger cuyo nombre sea triggerNotificarPago que nos permita llevar un control
de los pagos que van realizando los clientes.
Cada vez que un cliente realice un pago (es decir, tras hacer una inserción en la tabla pago), el
trigger deberá insertar un nuevo registro en una tabla llamada notificaciones.
Escribe algunas sentencias SQL para comprobar que el trigger funciona correctamente.
*/
delimiter //
create or replace trigger triggerNotificarPago
    after insert on pago for each row
begin
    insert into notificaciones values (null,now(),new.total,new.codigo_cliente);
end;
delimiter ;