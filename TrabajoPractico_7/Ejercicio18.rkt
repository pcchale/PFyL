#lang racket

(define (porcentajeDeVyM v m)
    (list (/ (* v 100) (+ v m)) (/ (* m 100) (+ v m)))
)