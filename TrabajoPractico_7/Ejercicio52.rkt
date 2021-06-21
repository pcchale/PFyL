#lang racket

(define (mmTo valorOrigen unidadDestino) 
    (cond
        ((equal? unidadDestino 'mm) valorOrigen)
        ((equal? unidadDestino 'cm) (/ valorOrigen 10))
        ((equal? unidadDestino 'dm) (/ valorOrigen 100))
        ((equal? unidadDestino 'm) (/ valorOrigen 1000))
    )
)

(define (convertir valorOrigen unidadOrigen unidadDestino)
    (cond
        ((equal? unidadOrigen 'mm) (mmTo valorOrigen unidadDestino))
        ((equal? unidadOrigen 'cm) (mmTo (* valorOrigen 10) unidadDestino))
        ((equal? unidadOrigen 'dm) (mmTo (* valorOrigen 100) unidadDestino))
        ((equal? unidadOrigen 'm) (mmTo (* valorOrigen 1000) unidadDestino))
    )
)