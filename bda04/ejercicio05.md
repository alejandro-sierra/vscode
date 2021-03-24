DEPARTAMENTO (<u>codDepartamento</u>, nombre, codGerente*)

    pk: codDepartamento
    fk: codGerente -> GERENTE
    ak: codGerente
    VNN: codGerente

PRODUCTO (<u>codProducto</u>, nombre, precioCompra, PrecioVenta, descuento, codDepartamento*)

    pk: codProducto
    fk: codDepartamento -> DEPARTAMENTO
    VNN: codDepartamento

TRBAJADOR (<u>codTrbajador</u>, dniTrabajador, nombre, tipo, direccion, poblacion, codPostal, telefono, codDepartamento*)

    pk: codTrbajador
    fk: codDepartamento -> Departamento
    VNN: codDepartamento

GERENTE (<u>codTrbajador</u>)

    pk: codTrbajador
    fk: codTrbajador -> TRABAJADOR
    
JEFE (<u>codTrbajador</u>, codGerente*)

    pk: codTrbajador
    fk: codTrbajador -> TRABAJADOR
        codGerente -> GERENTE
    VNN: codGerente

VENDEDOR (<u>codTrbajador</u>, codJefe*)

    pk: codTrbajador
    fk: codTrbajador -> TRABAJADOR
        codJefe -> JEFE
    VNN: codJefe

VENDE (<u>codVendedor, codProducto</u>)

    pk: dniVendedor, codProducto
    fk: dniVendedor -> VENDEDOR
        codProducto -> PRODUCTO

CLIENTE (<u>codCliente</u>, dniCliente, nombre, direccion, codPostal, poblacion, telefono)

    pk: dniCliente

VENDEA (<u>codCliente, codVendedor</u>, codArticulo, cantidad)

    pk: codCliente, codVendedor
    fk: codCliente -> GERENTE
        codVendedor -> VENDEDOR