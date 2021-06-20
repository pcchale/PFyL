#lang racket

(define (nPrimerosRecursividadCola cantidad lista)
        (nPrimerosAux cantidad lista 0 '()))

(define (nPrimerosAux cantidad lista cantidadActual listaAcumuladora)
        (cond ((= cantidad cantidadActual) listaAcumuladora)
              ((null? lista) listaAcumuladora)
              (else
               (nPrimerosAux cantidad
                             (cdr lista)
                             (+ cantidadActual 1)
                             (append listaAcumuladora (list (car lista)))))))
                            #|Esto está medio confuso, lo intuitivo era (list listaAcumuladora (car lista))
                              pero eso devolvía parentesis de más y quedaba resprolijo |#

(define (nPrimerosRecursividadPila cantidadElementos lista)
        (cond ((= cantidadElementos 0) '())
              ((null? lista) '())
              (else (cons (car lista) (nPrimerosP (- cantidadElementos 1) (cdr lista))))))
