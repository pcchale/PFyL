#lang racket

(define (menor numero1 numero2)
    (cond
        ((> numero2 numero1) numero1)
        (else numero2)
    )
)

(define (mayor numero1 numero2)
    (cond
        ((> numero2 numero1) numero2)
        (else numero1)
    )
)

(define (diferencia numero1 numero2)
    (- (mayor numero1 numero2) (menor numero1 numero2))
)

; Recursividad de cola
(define (mcd numero1 numero2)
    (cond
        ((= numero1 numero2) numero1)
        (else (mcd (menor numero1 numero2) (diferencia numero1 numero2)))
    )
)