#lang racket

(define (nPrimeros cantidad lista)
    (nPrimerosAux cantidad lista 0 '())
)

(define (nPrimerosAux cantidad lista cantidadActual listaAcumuladora)
    (cond
        ((= cantidad cantidadActual) listaAcumuladora)
        ((null? lista) listaAcumuladora)
        (else (nPrimerosAux cantidad (cdr lista) (+ cantidadActual 1) (list listaAcumuladora (car lista))))
    )
)