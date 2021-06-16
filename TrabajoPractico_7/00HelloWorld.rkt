#lang racket

#| Esto es un comentario de bloque |#

; Esto es un comentario de linea

; (define pulgadas) Funcion constante. Algo asi es la sintaxis.

; Con esta indentacion es como queda mas prolijo.

(define (pulgadas centimetros)
  (/ centimetros 2.54)
  )

; Para ver el resultado, en la terminal tengo que poner: (pulgadas 1524)

; Aceptó un integer pero me devolvio un double.

(define (pies centimetros)
  (/ (pulgadas centimetros) 12)
  )

