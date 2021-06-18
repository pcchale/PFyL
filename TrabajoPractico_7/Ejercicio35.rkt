#lang racket

#|
(define (dia numero)
    (if (equal? numero 1) 
        'domingo 
        (if (equal? numero 2) 
            'lunes 
            (if (equal? numero 3)
                'martes 
                (if (equal? numero 4)
                    'miercoles 
                    (if (equal? numero 5)
                        'jueves 
                          (if (equal? numero 6)
                            'viernes 
                            (if (equal? numero 7)
                                'sabado 
                                'diaErroneo)))))))
)
|#

; De forma mas entendible:
(define (dia numero)
    (cond 
    ((= numero 1) 'domingo)
    ((= numero 2) 'lunes)
    ((= numero 3) 'martes)
    ((= numero 4) 'miercoles)
    ((= numero 5) 'jueves)
    ((= numero 6) 'viernes)
    ((= numero 7) 'sabado)
    (else 'error))
)
