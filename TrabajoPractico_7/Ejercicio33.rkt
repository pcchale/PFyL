#lang racket

(define (puntaje cantidadPiezasProducidas cantidadPiezasDefectuosas)
    (cond
        ((and (not (>= cantidadPiezasProducidas 1000)) (not (<= cantidadPiezasDefectuosas 20))) 1)
        ((and (>= cantidadPiezasProducidas 1000) (not (<= cantidadPiezasDefectuosas 20))) 3)
        ((and (not (>= cantidadPiezasProducidas 1000)) (<= cantidadPiezasDefectuosas 20)) 2)
        ((and (>= cantidadPiezasProducidas 1000) (<= cantidadPiezasDefectuosas 20)) 4)
    )
)