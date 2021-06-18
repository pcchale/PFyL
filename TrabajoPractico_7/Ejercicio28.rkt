#lang racket

(define (obtainDiferentAge edad1 edad2 edad3)
    (cond
        ((= edad2 edad3) edad1)
        ((= edad1 edad3) edad2)
        ((= edad1 edad2) edad3)
        (else -1)
    )
)

(define (mellizosYViejo edad1 edad2 edad3)
    (obtainDiferentAge edad1 edad2 edad3)
)