/*
Predicado que vincula una lista de números enteros, 
con la cantidad de números naturales que contiene.
*/

/* Resuelto recursividad de pila */
naturalesPila([], 0).

naturalesPila([PrimerElemento | RestoElementos], Cantidad) :-
    PrimerElemento >= 0,
    naturalesPila(RestoElementos, CantidadRestoElementos),
    Cantidad is 1 + CantidadRestoElementos.

naturalesPila([PrimerElemento | RestoElementos], Cantidad) :-
    PrimerElemento < 0,
    naturalesPila(RestoElementos, Cantidad).

/* Resuelto con recursividad de cola */
naturalesCola(Lista, CantidadDeNaturales) :-
    naturalesColaAux(Lista, CantidadDeNaturales, 0).

naturalesColaAux([], CantidadNaturales, CantidadNaturales).

naturalesColaAux([PrimerElemento | RestoElementos], CantidadDeNaturales, CantidadDeNaturalesAcumulados) :-
    PrimerElemento >= 0,
    CantidadDeNaturalesAcumuladosAux is CantidadDeNaturalesAcumulados + 1,
    naturalesColaAux(RestoElementos, CantidadDeNaturales, CantidadDeNaturalesAcumuladosAux).

naturalesColaAux([PrimerElemento | RestoElementos], CantidadDeNaturales, CantidadDeNaturalesAcumulados) :-
    PrimerElemento < 0,
    naturalesColaAux(RestoElementos, CantidadDeNaturales, CantidadDeNaturalesAcumulados).