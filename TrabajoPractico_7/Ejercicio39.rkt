#lang racket


(define (comision totalVendido)
    (cond
        ((> totalVendido 1000) (+ (* totalVendido 0.04) 200))
        ((<= totalVendido 1000) (* totalVendido 0.03))
    )
)