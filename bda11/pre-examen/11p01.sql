delimiter //
create or replace procedure 11holaMundo()
begin
select "Hola mundo!!";
end;
delimiter;
/*****************************************/
delimiter //
create or replace procedure 12posNegCero(numero int)
begin
    if numero < 0 then
        select "Numero negativo";
    else
        select "Numero positivo";
    end if;
end;
delimiter ;
/*****************************************/
delimiter //
create or replace procedure 13posNegCeroOut(in numero int, out resultado varchar(50))
begin
declare resultado varchar(50);
    if numero < 0 then
        set resultado = "Numero negativo";
    else
        set resultado = "Numero positivo";
    end if;
end;
delimiter ;
/*****************************************/
delimiter //
create or replace procedure 14nota(nota int)
begin
    if nota < 5 then
        select "Insuficiente";
    elseif nota < 6 then
        select "Aprobado";
    elseif nota < 7 then
        select "Bien";
    elseif nota < 9 then
        select "Notable";
    elseif <=10
        select "Sobresaliente";
    else
        select "Nota no valida";
    end if;
end;
delimiter ;
/*****************************************/
delimiter //
create or replace procedure 16notaCase(nota int)
begin
    case
        when nota < 5 then
            select "Insuficiente";
        when nota < 6 then
            select "Aprobado";
        when nota < 7 then    
            select "Bien";
        when nota < 9 then
            select "Notable";
        when nota <= 10 then
            select "Sobresaliente";
        else
            select "Nota no valida";
        end case;
end;
delimiter ;
/*****************************************/
delimiter //
create or replace procedure 17diaSemana(dia int)
begin
    case dia
        when 1 then
            select "Lunes";
        when 2 then
            select "Martes";
        when 3 then
            select "Miercoles";
        when 4 then
            select "Jueves";
        when 5 then
            select "Viernes";
        when 6 then
            select "Sabado";
        when 7 then
            select "Domiendo";
        else
            select "Numero no valido (1-7, donde 1 es Lunes)";
    end case;
end;
delimiter ;