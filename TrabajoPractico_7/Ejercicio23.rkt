#lang racket

(define (par? numero)
    (equal? (modulo numero 2) 0)
)

(define (divisiblePor3? numero)
    (equal? (modulo numero 3) 0)
)

(define (divisiblePor6? numero)
    (and (par? numero) (divisiblePor3? numero))
)