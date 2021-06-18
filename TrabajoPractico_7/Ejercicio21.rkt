#lang racket

(define (par? numero)
    (equal? (modulo numero 2) 0)
)