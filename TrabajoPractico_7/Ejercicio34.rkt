#lang racket

(define (sumaEsMayor lado1 lado2 lado3)
    (>= (+ lado1 lado2) lado3)
)

(define (triangulo lado1 lado2 lado3)
    (and
        (sumaEsMayor lado1 lado2 lado3)
        (sumaEsMayor lado2 lado1 lado3)
        (sumaEsMayor lado3 lado1 lado2)
    )
)