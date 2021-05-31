/*
Escribir un predicado que relacione a una lista multinivel con el nivel 
más profundo en el que se encuentre un elemento dado
*/

esLista([]).
esLista([_|_]).

nivelMasProfundo(Elemento, Lista, Nivel) :-
    nivelMasProfundoAux(Elemento, Lista, Nivel, 0, 0).

nivelMasProfundoAux(_, [], MayorNivel, _, MayorNivel).

nivelMasProfundoAux(Elemento, [Elemento|RestoElementos], Nivel, NivelActual, MayorNivel) :-
    NivelActual > MayorNivel,
    nivelMasProfundoAux(Elemento, RestoElementos, Nivel, NivelActual, NivelActual).

nivelMasProfundoAux(Elemento, [Elemento|RestoElementos], Nivel, NivelActual, MayorNivel) :-
    NivelActual =< MayorNivel,
    nivelMasProfundoAux(Elemento, RestoElementos, Nivel, NivelActual, MayorNivel).

nivelMasProfundoAux(Elemento, [PrimerElemento|RestoElementos], Nivel, NivelActual, MayorNivel) :-
    Elemento \= PrimerElemento,
    not(esLista(PrimerElemento)),
    nivelMasProfundoAux(Elemento, RestoElementos, Nivel, NivelActual, MayorNivel).

nivelMasProfundoAux(Elemento, [PrimerElemento|RestoElementos], Nivel, NivelActual, MayorNivel) :-
    Elemento \= PrimerElemento,
    esLista(PrimerElemento),
    NivelActualAux is NivelActual + 1,
    nivelMasProfundoAux(Elemento, PrimerElemento, ResultadoUnoNivel, NivelActualAux, MayorNivel),
    nivelMasProfundoAux(Elemento, RestoElementos, Nivel, NivelActualAux, ResultadoUnoNivel).