#lang racket


(define (pulgadas centimetros)
    (/ centimetros 2.54)
)

(define (pies centimetros)
    (/ (pulgadas centimetros) 12)
)

(define (yardas centimetros)
    (/ (pies centimetros) 3)
)

(define (pasaje centimetros)
    (list (pulgadas centimetros) (pies centimetros) (yardas centimetros))
)