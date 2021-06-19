#lang racket

; Esto sería recursividad de pila.

(define (cantidadNaturales lista)
    (cond
        ((null? lista) 0)
        ((> (car lista) 0) (+ (cantidadNaturales (cdr lista)) 1))
        ((< (car lista) 0) (cantidadNaturales (cdr lista)))
    )
)

; Esto sería recursividad de cola

(define (cantidadNaturalesCola lista)
    (cantidadNaturalesAux lista 0)
)

(define (cantidadNaturalesAux lista acumulador)
    (cond
        ((null? lista) acumulador)
        ((> (car lista) 0) (cantidadNaturalesAux (cdr lista) (+ acumulador 1)))
        ((< (car lista) 0) (cantidadNaturalesAux (cdr lista) acumulador))
    )
)