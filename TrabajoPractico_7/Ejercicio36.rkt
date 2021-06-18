#lang racket

(define (minutosVaciado litrosTotales litrosActuales litrosCanilla litrosSumidero)
    (cond 
        ((equal? litrosCanilla litrosSumidero) -1)
        ((< litrosCanilla litrosSumidero) (/ litrosActuales (- litrosSumidero litrosCanilla)))
        ((> litrosCanilla litrosSumidero) (/ (- litrosTotales litrosActuales) (- litrosCanilla litrosSumidero)))
    )
    
)