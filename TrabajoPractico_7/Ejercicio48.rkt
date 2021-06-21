#lang racket

; Recursividad de pila
(define (potencia numero exponente)
        (cond ((= exponente 0) 1) (else (* numero (potencia numero (- exponente 1))))))

; Recursividad de cola
(define (potenciaCola numero exponente) (potenciaAux numero exponente 1))

(define (potenciaAux numero exponente acumulador)
        (cond 
                ((= exponente 0) acumulador)
                (else (potenciaAux numero (- exponente 1) (* acumulador numero)))
        )
)
