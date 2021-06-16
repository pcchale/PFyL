#lang racket

(define (multiplo? num1 num2)
    (= (modulo num1 num2) 0)
)

(define (multiplo6? num1)
    (
        and
        (multiplo? num1 3)
        (multiplo? num1 2)
    )
)