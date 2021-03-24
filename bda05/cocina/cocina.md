PAIS (nombrePa, capital)

    pk: nombre

INGREDIENTE (nombreIng, metodo, temp, nombrePa*)
    
    pk: nombreIng
    fk: nombrePa -> PAIS

RECETA (nombreRec ,precio, tipo, lactosa, fructosa, inspirarR*, nombrePa*)
    
    pk: nombreRec
    fk: nombrePa -> PAIS
    fk: inpirarR -> RECETA

COMPONER (nombrePa*, nombreIng*, cantidad, preparacion)
    
    pk: nombrePa, nombreIng
    fk: nombrePa -> PAIS
        nombreIng -> INGREDIENTE

CONCURSANTE (numeroCon, nombreCon, tipo, nombrePa*)
    
    pk: numeroCon
    fk: nombrePa -> PAIS
    VNN: nombrePa

TELEFONO (telefono, numeroCon*)
    
    pk: telefono
    fk: numeroCon -> CONCURSANTE

AMATEUR (numeroCon*)
    
    pk: numeroCon
    fk: numeroCon -> CONCURSANTE

PROFESIONAL (numeroCon*, numeroAmat*)
    
    pk: numeroCon
    fk: numeroCon -> CONCURSANTE
        numeroAmat -> AMATEUR
    VNN: numeroAmat


RESTAURANTE (codigoRest, nombreRest, cuidad, nombrePa*, numeroProf*)
    
    pk: codigoRest
    fk: nombrePa -> PAIS
        numeroProf -> PROFESIONAL
    VNN: nombrePa
    VNN: numeroProf

TRABAJAR (codigoRest*, numeroProf*, ffin, finicio)
    
    pk: codigoRest, numeroProf, ffin
    fk: codigoRest -> RESTAURANTE
        numeroProf -> PROFESIONAL

EDICION (numeroEdi, nombrePre*, lugar)
    
    pk: numeroEdi, nombrePre
    fk: nombrePre -> PREMIO

GANAR (codigoRest*, numeroEdi*,fecha)
    
    pk: codigoRest, numeroEdi,fecha
    fk: codigoRest -> RESTAURANTE
        numeroEdi -> EDICION

PREMIO(nombrePre, cuantia)
    
    pk: nombrePre
