/*
Predicado que relaciona una lista con la cantidad de átomos que contiene.
*/

esLista([]).
esLista([_|_]).

atomos(Lista, Resultado) :-
    atomosAux(Lista, Resultado, 0).

atomosAux([], ResultadoAcumulado, ResultadoAcumulado).

atomosAux([PrimerElemento|RestoElementos], Resultado, ResultadoAcumulado) :-
    esLista(PrimerElemento),
    atomosAux(PrimerElemento, ResultadoAux, 0),
    ResultadoAcumuladoAux is ResultadoAux + ResultadoAcumulado,
    atomosAux(RestoElementos, Resultado, ResultadoAcumuladoAux).


atomosAux([PrimerElemento|RestoElementos], Resultado, ResultadoAcumulado) :-
    not(esLista(PrimerElemento)),
    ResultadoAcumuladoAux is ResultadoAcumulado + 1,
    atomosAux(RestoElementos, Resultado, ResultadoAcumuladoAux).