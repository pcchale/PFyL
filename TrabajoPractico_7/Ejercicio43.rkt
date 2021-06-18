#lang racket

(define (yy mes año)
        (cond ((or (equal? mes 1) (equal? mes 2)) (- año 1)) (else año)))

; (y 10 1582)

(define (mm mes año)
        (cond ((or (equal? mes 1) (equal? mes 2)) (+ mes 12)) (else mes)))

; (m 10 1582)

(define (aa y) (quotient y 100))

; (a (y 10 1582))

(define (bb a) (quotient a 4))

; (b (a (y 10 1582)))

(define (cc a b) (+ (- 2 a) b))

; (c (a (y 10 1582)) (b (a (y 10 1582))))

(define (ee y) (truncate (* 365.25 (+ y 4716))))

; (e (y 10 1582))

(define (ff m) (truncate (* 30.6001 (+ m 1))))

; (f (m 10 1582))

(define (aDiaJuliano dia mes año)
        (+ (cc (aa (yy mes año)) (bb (aa (yy mes año))))
           dia
           (ee (yy mes año))
           (- (ff (mm mes año)) 1524.5)))

(define (diferenciaEntreFechas dia1 mes1 año1 dia2 mes2 año2)
        (- (aDiaJuliano dia1 mes1 año1) (aDiaJuliano dia2 mes2 año2)))
