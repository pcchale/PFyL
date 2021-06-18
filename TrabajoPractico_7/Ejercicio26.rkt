#lang racket

(define (multiplo? numero1 numero2)
    (equal? (modulo numero2 numero1) 0)
)

(define (multiploODivisor? numero1 numero2)
    (or (multiplo? numero1 numero2) (multiplo? numero2 numero1))
)