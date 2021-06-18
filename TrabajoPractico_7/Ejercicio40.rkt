#lang racket

(define (obtenerComision totalVendidoVendedorACalcularComision
                         totalVendidoOtroVendedor)
        (cond ((> totalVendidoVendedorACalcularComision totalVendidoOtroVendedor)
               (* totalVendidoVendedorACalcularComision 0.04))
              (else (* totalVendidoVendedorACalcularComision 0.03))))

(define (comisiones totalVendidoVendedor1 totalVendidoVendedor2)
        (list (obtenerComision totalVendidoVendedor1 totalVendidoVendedor2)
              (obtenerComision totalVendidoVendedor2 totalVendidoVendedor1)))
