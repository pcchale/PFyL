/*
Un número es divisible por 7 cuando separando la primera cifra de la derecha, 
multiplicándola por 2, restando este producto de lo que queda a la izquierda y 
así sucesivamente, da cero o múltiplo de 7.
*/

divisiblePor7(0).

divisiblePor7(Numero) :-
    Numero < 0,
    Numero mod 7 =:= 0.

divisiblePor7(Numero) :-
    Numero > 0,
    CifraDerechaPorDos is (Numero mod 10)*2,
    RestoNumero is Numero div 10,
    Diferencia is RestoNumero - CifraDerechaPorDos,
    divisiblePor7(Diferencia).