#lang racket

(define (y mes año)
        (cond ((or (equal? mes 1) (equal? mes 2)) (- año 1)) (else año)))

; (y 10 1582)

(define (m mes año)
        (cond ((or (equal? mes 1) (equal? mes 2)) (+ mes 12)) (else mes)))

; (m 10 1582)

(define (a y) (quotient y 100))

; (a (y 10 1582))

(define (b a) (quotient a 4))

; (b (a (y 10 1582)))

(define (c a b) (+ (- 2 a) b))

; (c (a (y 10 1582)) (b (a (y 10 1582))))

(define (e y) (round (- (* 365.25 (+ y 4716)) 0.5)))

; (e (y 10 1582))

(define (f m) (round (- (* 30.6001 (+ m 1)) 0.5)))

; (f (m 10 1582))

(define (aDiaJuliano dia mes año)
        (+ 
            (c (a (y mes año)) (b (a (y mes año))))
            dia
            (e (y mes año))
            (- (f (m mes año)) 1524.5)
        )
)
