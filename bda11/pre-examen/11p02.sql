delimiter //
create or replace procedure 21clientesPais(paisP varchar(50))
begin
    select * from cliente where pais = paisP;
end;
delimiter ;
/*****************************************/
delimiter //
create or replace procedure 22pagoMaximoPorTipo(pagoP varchar(50))
begin
    select *,max(total) as "pago maximo" from pago where forma_pago = pagoP;
end;
delimiter ;
/*****************************************/
delimiter //
create or replace procedure 25secuenciaWhile(valorInicial int unsigned)
begin
    declare contador int;
    set contador = 1;  
    while valorInicial >= contador do
        insert into prueba01 values (valorInicial);
		set valorInicial = valorInicial - 1;
	end while;
end;
delimiter ;
/*****************************************/
delimiter //
create or replace procedure 26secuenciaRepeat(valorInicial int unsigned)
begin
    declare contador int;
    set contador = 1;  
    repeat
        insert into prueba01 values (valorInicial);
		set valorInicial = valorInicial - 1;
    until valorInicial < contador
	end repeat;
end;
delimiter ;
