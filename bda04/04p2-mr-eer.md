A (<u>a0</u>, a1, a2)

    pk (a0)

B (<u>b0</u>, b1, a0*, r0, x0*, x1) 1:1

    pk (b0)
    fk: ao -> A
    fk: x0 -> B
    ak: x0

C (<u>a0, b0</u>, c0) 0:N

    pk (a0, b0)
    fk: a0 -> A
    fk: b0 -> B

D (<u>d0, b0</u>, d1) 0:N

    pk: (do, bo)
    fk: bo -> B

E (e0, e1) 0:N

    pk: eo
    fk: eo -> A