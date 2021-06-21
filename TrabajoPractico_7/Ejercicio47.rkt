#lang racket

; Recursividad de pila
(define (factorial numero)
        (cond 
                ((= numero 0) 1) 
                (else (* numero (factorial (- numero 1))))
        )
)

; Recursidad de cola
(define (factorialCola numero) (factorialAux numero 1))

(define (factorialAux numero acumulador)
        (cond 
                ((= numero 0) acumulador)
                (else (factorialAux (- numero 1) (* acumulador numero)))
        )
)
