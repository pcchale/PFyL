#lang racket

(define (fibonacci numero)
    (cond
        ((= numero 0) 0)
        ((= numero 1) 1)
        (else (+ (fibonacci (- numero 1)) (fibonacci (- numero 2))))
    )
)