#lang racket

(define (dia numero)
        (cond ((= numero 0) 'domingo)
              ((= numero 1) 'lunes)
              ((= numero 2) 'martes)
              ((= numero 3) 'miercoles)
              ((= numero 4) 'jueves)
              ((= numero 5) 'viernes)
              ((= numero 6) 'sabado)
              (else 'error)))

(define (diaSemana JD) (dia (modulo (+ (- (truncate (+ JD 0.5)) 1720982) 5) 7)))
