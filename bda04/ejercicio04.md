HOTEL (<u>codHot</u>, nombre, calle, nCalle, telefono, poblacion, cp, web, email)

    pk: codHot

CATEGORIA (<u>codCateg</u>, descripcion, nEstrellas, iva)

    pk: codCateg

SCALIFICA (<u>codHot*, codCateg*</u>, fecha)

    pk: codHot, codCateg
    fk: codHot -> HOTEL
        codCateg -> CATEGORIA

HABITACION (<u>codHot*, nHabitacion</u>, precio, nombre)

    pk: codHot, nHabitacion
    fk: codHot -> HOTEL
    VNN: codHot

CLIENTE (<u>dniCli</u>, nombre, direccion, telefono)

    pk: dniCli

RESERVA (<u>codReser</u>, fInicio, fFin, codHot*, nHabitacion*, dniCli*)

    pk: codReser
    fk: codHot, nHabitacion -> HABITACION
        dniCli -> CLIENTE
    VNN: codHot, nHabitacion

FACTURA (<u>nFact</u>, fecha, codReser*)

    pk: nFact
    fk: codReser -> RESERVA
    ak: codReser
    VNN: codReser