/*
Completar el predicado anterior para sea verdadero 
si cualquiera de los números es múltiplo del otro.

*/


multiplo(Numero1, Numero2) :-
    Numero2 > Numero1,
    multiploAux(Numero1, Numero2).

multiplo(Numero1, Numero2) :-
    Numero1 > Numero2,
    multiploAux(Numero2, Numero1).

multiploAux(_, 0).

multiploAux(Numero1, Numero2) :-
    Numero2 > 0,
    Numero2Aux is Numero2 - Numero1,
    multiploAux(Numero1, Numero2Aux).