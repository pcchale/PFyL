#lang racket

#|

DE

FECHA

A

DIA

JULIANO|#

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

#|

DE

DIA

JULAINO

A

FECHA|#

(define (q JD) (+ JD 0.5))

; (q 2299160.5) ; (q JD)

(define (z q) (truncate q))

; (z (q 2299160.5)) ; (z (q JD))

(define (w z) (truncate (/ (- z 1867216.25) 36524.25)))

; (w (z (q 2299160.5))) ; (w (z (q JD)))

(define (x w) (quotient w 4))

; (x (w (z (q 2299160.5)))) ; (x (w (z (q JD))))

(define (a z w x) (truncate (- (+ z 1 w) x)))

; (a (z (q 2299160.5)) (w (z (q 2299160.5))) (x (w (z (q 2299160.5)))))
; (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD)))))

(define (b a) (truncate (+ a 1524)))

; (b (a (z (q 2299160.5)) (w (z (q 2299160.5))) (x (w (z (q 2299160.5))))))
; (b (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD))))))

(define (c b) (truncate (/ (- b 122.1) 365.25)))

; (c (b (a (z (q 2299160.5)) (w (z (q 2299160.5))) (x (w (z (q 2299160.5)))))))
; (c (b (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD)))))))

(define (d c) (truncate (* 365.25 c)))

; (d (c (b (a (z (q 2299160.5)) (w (z (q 2299160.5))) (x (w (z (q 2299160.5))))))))
; (d (c (b (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD))))))))

(define (e b d) (truncate (/ (- b d) 30.6)))

; (e (b (a (z (q 2299160.5)) (w (z (q 2299160.5))) (x (w (z (q 2299160.5)))))) (d (c (b (a (z (q 2299160.5)) (w (z (q 2299160.5))) (x (w (z (q 2299160.5)))))))))
; (e (b (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD)))))) (d (c (b (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD)))))))))

(define (f e) (truncate (* 30.6 e)))

; (f(e (b (a (z (q 2299160.5)) (w (z (q 2299160.5))) (x (w (z (q 2299160.5)))))) (d (c (b (a (z (q 2299160.5)) (w (z (q 2299160.5))) (x (w (z (q 2299160.5))))))))))
; (f(e (b (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD)))))) (d (c (b (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD))))))))))

(define (dia JD)
        (+ (- (b (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD))))))
              (d (c (b (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD))))))))
              (f
               (e (b (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD))))))
                  (d (c (b (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD)))))))))))
           (- (q JD) (z (q JD)))))

(define (mes JD)
        (cond ((and (>= (- (e (b (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD))))))
                              (d (c (b (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD)))))))))
                           1)
                        1)
                    (<= (- (e (b (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD))))))
                              (d (c (b (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD)))))))))
                           1)
                        12))
               (- (e (b (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD))))))
                     (d (c (b (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD)))))))))
                  1))
              ((and (>= (- (e (b (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD))))))
                              (d (c (b (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD)))))))))
                           13)
                        1)
                    (<= (- (e (b (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD))))))
                              (d (c (b (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD)))))))))
                           13)
                        12))
               (- (e (b (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD))))))
                     (d (c (b (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD)))))))))
                  13))))

(define (año JD)
        (cond ((or (= (mes JD) 1) (= (mes JD) 2))
               (- (c (b (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD))))))) 4715))
              (else (- (c (b (a (z (q JD)) (w (z (q JD))) (x (w (z (q JD))))))) 4716))))

(define (aFecha diaJuliano)
        (list (dia diaJuliano) (mes diaJuliano) (año diaJuliano)))

#|

DIFERENCIA

ENTRE

FECHAS

|#

(define (diferenciaEntreFechas dia1 mes1 año1 dia2 mes2 año2)
        (abs (- (aDiaJuliano dia1 mes1 año1) (aDiaJuliano dia2 mes2 año2))))

#|

CONVERTIR

IDA

Y

VUELTA|#

(define (convertirIdaYVueta dia mes año) (aFecha (aDiaJuliano dia mes año)))
