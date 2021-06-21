#lang racket


(define (explota numero bomba)
    (cond
        ((>= bomba numero) (list numero))
        (else 
            (append 
                (explota (quotient numero bomba) bomba) 
                (explota (- numero (quotient numero bomba)) bomba)))
    )
)

; Cons devuelve '(3 2 1 1 . 3)

; List devuelve '(3 (2 (1 (1 3))))
