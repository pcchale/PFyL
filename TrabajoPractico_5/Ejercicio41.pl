/*
Otra forma de calcular recursivamente la potencia con exponente natural más 
eficientemente es usando la siguiente función:
 
     |  1                     si n es cero
     |
m^n =     |  (m^2)^(n/2)             si n es par
     |
     |  m*(m^2)^((n-1)/2)       si n es impar

*/

potencia(1, _, 0).

/*

Resuelto de forma aritmetica
potencia(Resultado, M, N) :-
    N mod 2 =:= 0,
    Resultado is (M^2)^(N/2).

potencia(Resultado, M, N) :-
    N mod 2 \= 0,
    Resultado is M*(M^2)^((N-1)/2).
*/

/* Resuelto de forma recursiva */

potencia(Resultado, M, N) :-
     N mod 2 =:= 0,
     MAux is M*M,
     NAux is N/2,
     potencia(Resultado, MAux, NAux).
 
 potencia(Resultado, M, N) :-
     N mod 2 \= 0,
     MAux is (M*M),
     NAux is (N-1)/2,
     potencia(ResultadoAux, MAux, NAux),
     Resultado is M*ResultadoAux.