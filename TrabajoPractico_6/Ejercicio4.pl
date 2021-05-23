/*
Predicado que vincula una lista numérica, con la suma de sus elementos.
*/

/* Resuelto con recursividad de pila */
sumaPila([], 0).

sumaPila([PrimerElemento | RestoElementos], Suma) :-
    sumaPila(RestoElementos, SumaRestoElementos),
    Suma is PrimerElemento + SumaRestoElementos.

/* Resuelto con recursividad de cola */

sumaCola(Lista, Suma) :-
    sumaColaAux(Lista, Suma, 0).

sumaColaAux([], AcumuladorSuma, AcumuladorSuma).

sumaColaAux([PrimerElemento | RestoElementos], Suma, AcumuladorSuma) :-
    AcumuladorSumaAux is AcumuladorSuma + PrimerElemento,
    sumaColaAux(RestoElementos, Suma, AcumuladorSumaAux).
