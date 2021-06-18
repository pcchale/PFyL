#lang racket

(define (divisiblePor3? numero)
    (equal? (modulo numero 3) 0)
)