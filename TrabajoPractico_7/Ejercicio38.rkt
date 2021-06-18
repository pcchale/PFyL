#lang racket


(define (tiposRaices a b c)
    (cond
        ((< (- (expt b 2) (* 4 a c)) 0) "Raices Complejas y Conjugadas")
        ((= (- (expt b 2) (* 4 a c)) 0) "Real doble")
        ((> (- (expt b 2) (* 4 a c)) 0) "Reales distintas")
    )    
)