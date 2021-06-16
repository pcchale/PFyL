#lang racket

(define (p ladoA ladoB ladoC) (/ (+ ladoA ladoB ladoC) 2))

(define (heron ladoA ladoB ladoC)
        (sqrt
         (* (p ladoA ladoB ladoC)
            (- (p ladoA ladoB ladoC) ladoA)
            (- (p ladoA ladoB ladoC) ladoB)
            (- (p ladoA ladoB ladoC) ladoC))))
