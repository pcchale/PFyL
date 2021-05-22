/*
Definir un predicado recursivo que 
sea verdadero cuando su argumento es un número primo.
*/


primoAux(Numero, Divisor) :-
    Divisor > Numero/2.

primoAux(Numero, Divisor) :-
    (Numero mod Divisor) =\= 0,
    DivisorAux is Divisor + 1,
    primoAux(Numero, DivisorAux).
    

primo(Numero) :-
    primoAux(Numero, 2).