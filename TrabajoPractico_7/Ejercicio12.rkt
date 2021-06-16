#lang racket

(define gravity (* 6.673 (expt 10 -8)))

(define (fuerza masa1 masa2 distancia)
    (/ (* gravity masa1 masa2) (expt distancia 2))
)
