ZONA (<u>codPostal</u>, nombre)

    pk: codPostal

REPARTIDOR (<u>matricula</u>, nombre, codPostal*)

    pk: matricula
    fk: codPostal -> ZONA
    VNN: codPostal


CLIENTE (<u>dniCli</u>, nombre, direccion, email, pwd, codPostal*)

    pk: dniCli
    fk: codPostal -> ZONA
    VNN: codPostal

PEDIDO (<u>codPedi</u>, fecha, dEntrega, nTarjeta, fechCaducidad, dniCli*, matricula*)

    pk: codPedi
    fk: dniCli -> CLIENTE
        matricula -> REPARTIDOR
    VNN: dniCli, matricula

PRODUCTO (<u>codProd</u>, pvp, unidades, volumen, ...)

    pk: codProd

L.PEDIDO (<u>nLinea, codPedi*</u>, cantidad, codProd*)

    pk: nLinea, codPedido
    fk: codPedi -> PEDIDO
        codProd -> PRODUCTO
    VNN: codPedi, codProd

