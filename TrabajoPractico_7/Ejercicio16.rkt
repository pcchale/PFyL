#lang racket

(define (dcyr numero1 numero2)
    (list (quotient numero1 numero2) (modulo numero1 numero2))
)