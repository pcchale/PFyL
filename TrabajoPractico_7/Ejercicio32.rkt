#lang racket

(define (iguales numero1 numero2 numero3)
    (or (equal? numero1 numero2) (equal? numero1 numero3) (equal? numero2 numero3))
)