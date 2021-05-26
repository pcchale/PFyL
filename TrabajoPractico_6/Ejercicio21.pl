/*
Predicado que relaciona una lista
numérica con el menor de sus elementos.
*/

menor([PrimerElemento | RestoElementos], Menor) :-
    menorAux(RestoElementos, PrimerElemento, Menor).

menorAux([], Menor, Menor).

menorAux([PrimerElemento | RestoElementos], MenorActual, Menor) :-
    PrimerElemento < MenorActual,
    menorAux(RestoElementos, PrimerElemento, Menor).


menorAux([PrimerElemento | RestoElementos], MenorActual, Menor) :-
    PrimerElemento >= MenorActual,
    menorAux(RestoElementos, MenorActual, Menor).