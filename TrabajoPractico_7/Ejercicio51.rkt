#lang racket

(define (divisor? numero candidatoDivisor)
    (cond
        ((= numero 0) #t)
        ((< numero 0) #f)
        (else (divisor? (- numero candidatoDivisor) candidatoDivisor))
    )
)

(define (primoAux numero divisorActual)
    (cond
        ((= numero divisorActual) #t)
        ((divisor? numero divisorActual) #f)
        (else (primoAux numero (+ divisorActual 1)))
    )
)

(define (primo? numero) 
    (cond
        ((= numero 1) #t)
        (else (primoAux numero 2))
    )
    
)