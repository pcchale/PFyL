#lang racket

(define (aSegundos minutos segundos centesimas)
        (+ segundos (* minutos 60) (/ centesimas 3600)))

(define (velocidad distancia minutos segundos centesimas)
        (* (/ distancia (aSegundos minutos segundos centesimas)) 3.6))
