/*
 Definir un predicado binario "paridad" 
 que relaciona un número con la palabra 
 "par" si el número es par, o con la palabra 
 "impar" de otro modo.

*/

/*paridad(X, Paridad).*/
/*
paridad(X, par) :-
    X mod 2 =:= 0. *//* Este operador significa IGUAL */
/*
paridad(X, impar) :-
    X mod 2 =\= 0. *//* Este operador significa DISTINTO */
/*

No hace falta escribir esto asi!!!!
paridad(X, Paridad) :-
    X mod 2 =\= 0,
    Paridad is impar.
No hace falta escribir esto asi!!!!
*/

/* Resuelto de forma recursiva */

paridad(0, par).
paridad(1, impar).

paridad(Numero, Paridad) :-
    Numero >= 0,
    NumeroAux is Numero - 2,
    paridad(NumeroAux, Paridad).