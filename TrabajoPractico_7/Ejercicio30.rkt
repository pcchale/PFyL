#lang racket

(define (iguales numero1 numero2 numero3)
    (and (equal? numero1 numero2) (equal? numero1 numero3))
)