#lang racket

(define (calculateX2 a11 a12 b1 a21 a22 b2)
    (- (/ (* (/ b2 a21) a11) (- (* a11 (/ a22 a21)) a12)) (/ b1 (- (* a11 (/ a22 a21)) a12)))
)

(define (calculateX1 a11 a12 b1 x2)
    (/ (- b1 (* a12 x2)) a11)
)

(define (resuelveSistema a11 a12 b1 a21 a22 b2)
    (list (calculateX1 a11 a12 b1 (calculateX2 a11 a12 b1 a21 a22 b2)) (calculateX2 a11 a12 b1 a21 a22 b2))
)

