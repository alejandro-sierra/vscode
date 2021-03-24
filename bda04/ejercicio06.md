FABRICANTE (<u>dniFa</u>, direccion , nombre)

    pk: dniFa

DISTRIBUIDOR (<u>dniDis</u>, nombre, direccion)

    pk: dniDis

CEDE (<u>dniDis*</u>, cede1, cede2)
    
    pk: dniDis
    fk: dniDis-> DISTRIBUIDOR
        cede1, cede2 -> DISTRIBUIDOR

TRABAJA (<u>dniFa*, dniDis*</u>)

    pk: dniFa, dniDis
    fk: dniFa -> FABRICANTE
        dniDis -> DISTRIBUIDOR

COCINA (<u>codCocina</u>, nombre, nMuebles, nBajos, nAltos, nEncimeras, nPanerles, dniDis*)

    pk: codCocina
    fk: dniDis -> DISTRIBUIDOR

CLIENTE (<u>dniCli</u>, direccion, telefono)

    pk: dniCli

COMPRA (<u>codCocina*, dniCli*</u>)

    pk: codCocina, dniCli
    fk: codCocina -> COCINA
        dniCli -> CLIENTE

MONTADOR (<u>dniMont</u>, nCocinas, nombre, direccion, telefono)

    pk: dniMont

MONTA (<u>dniMont*, codCocina*</u>)

    pk:dniMont, codCocina
    fk: dniMont -> MONTADOR
        codCocina -> COCINA

MUEBLE (<u>codMueble</u>, tipo, descripcion, linea, color, ancho, largo, alto, dniFa*, codCocina*)

    pk: codMueble
    fk: dniFa -> FABRICANTE
        codCocina -> COCINA
    VNN: dniFa, codCocina

ENCIMERA (<u>codMueble</u>, tipoEncimera)

    pk: codMueble
    fk: codMueble -> MUEBLE

ALTO (<u>codMueble</u>)

    pk: codMueble
    fk: codMueble -> MUEBLE

BAJO (<u>codMueble</u>, altura)

    pk: codMueble
    fk: codMueble -> MUEBLE

PANEL (<u>codMueble</u>)

    pk: codMueble
    fk: codMueble -> MUEBLE