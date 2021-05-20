/*
Definir un predicado unario "par" que es 
verdadero cuando su único sujeto es un número par.
*/

/* Resuelto de forma facil */
/*
par(Numero) :-
    Numero mod 2 =:= 0.
*/

/* Resuelto de forma recursiva */
par(0).
par(Numero) :-
    Numero > 0,
    NumeroMenosDos is Numero - 2,
    par(NumeroMenosDos).