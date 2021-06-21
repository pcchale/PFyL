#lang racket


(define (explota numero bomba)
    (cond
        ((>= bomba numero) numero)
        (else 
            (cons 
                (explota (quotient numero bomba) bomba) 
                (explota (- numero (quotient numero bomba)) bomba)))
    )
)