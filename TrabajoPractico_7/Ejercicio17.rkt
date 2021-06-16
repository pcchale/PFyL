#lang racket

(define (aHoras segundos)
    (quotient segundos 3600)
)

(define (restoHoras segundos)
    (modulo segundos 3600)
)

(define (aMinutos segundos)
    (quotient segundos 60)
)

(define (restoMinutos segundos)
    (modulo segundos 60)
)

(define (hms segundos)
    (list (aHoras segundos) (aMinutos (restoHoras segundos)) (restoMinutos (restoHoras segundos)))
)