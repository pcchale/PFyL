#lang racket

(define (divisiblePor4? numero)
    (equal? (modulo numero 4) 0)
)

(define (distint numero1 numero2)
    (not (equal? numero1 numero2))
) 

(define (notDivisiblePor100? numero)
    (distint (modulo numero 100) 0)
)

(define (divisiblePor400? numero)
    (equal? (modulo numero 400) 0)
)

(define (bisiesto anio)
    (or (divisiblePor400? anio) (and (divisiblePor4? anio) (notDivisiblePor100? anio)))
)