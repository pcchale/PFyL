#lang racket

(define (obtenerMenorDeEdad edad1 edad2 edad3)
    (cond
        ((< edad1 18) edad1)
        ((< edad2 18) edad2)
        ((< edad3 18) edad3)
    )
)

(define (jovenYAdultos edad1 edad2 edad3)
    (obtenerMenorDeEdad edad1 edad2 edad3)
)