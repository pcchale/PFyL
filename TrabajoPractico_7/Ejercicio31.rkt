#lang racket

(define (mayor numero1 numero2 numero3)
    (cond
        ((and (>= numero1 numero2) (>= numero1 numero3)) numero1)
        ((and (>= numero2 numero1) (>= numero2 numero3)) numero2)
        ((and (>= numero3 numero1) (>= numero3 numero2)) numero3)
    )
)

(define (menor numero1 numero2 numero3)
    (cond
        ((and (<= numero1 numero2) (<= numero1 numero3)) numero1)
        ((and (<= numero2 numero1) (<= numero2 numero3)) numero2)
        ((and (<= numero3 numero1) (<= numero3 numero2)) numero3)
    )
)

(define (diferenciaMayMen numero1 numero2 numero3)
    (- (mayor numero1 numero2 numero3) (menor numero1 numero2 numero3))
)