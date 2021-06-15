ultimayo(Lista, ListaResultado) :-
    mayor(Lista, Mayor),
    moverAlFinal(Lista, Mayor, ListaResultado).

mayor([PrimerElemento|RestoLista], Resultado) :-
    mayorAux(RestoLista, Resultado, PrimerElemento).

mayorAux([], Mayor, Mayor).

mayorAux([PrimerElemento|RestoLista], Resultado, Mayor) :-
    PrimerElemento >= Mayor,
    mayorAux(RestoLista, Resultado, PrimerElemento).


mayorAux([PrimerElemento|RestoLista], Resultado, Mayor) :-
    PrimerElemento < Mayor,
    mayorAux(RestoLista, Resultado, Mayor).

moverAlFinal(Lista, Mayor, ListaResultado) :-
    moverAlFinalAux(Lista, Mayor, ListaResultado, 0).

moverAlFinalAux([], Mayor, ListaResultado, Repeticiones) :-
    agregar(Mayor, ListaResultado, Repeticiones).

moverAlFinalAux([Mayor|RestoElementos], Mayor, ListaResultado, Repeticiones) :-
    RepeticionesAux is Repeticiones + 1,
    moverAlFinalAux(RestoElementos, Mayor, ListaResultado, RepeticionesAux).


moverAlFinalAux([PrimerElemento|RestoElementos], Mayor, [PrimerElemento|RestoListaResultado], Repeticiones) :-
    PrimerElemento \= Mayor,
    moverAlFinalAux(RestoElementos, Mayor, RestoListaResultado, Repeticiones).

agregar(_, [], 0).

agregar(Elemento, [Elemento|RestoListaResultado], Repeticiones) :-
    Repeticiones > 0,
    RepeticionesAux is Repeticiones - 1,
    agregar(Elemento, RestoListaResultado, RepeticionesAux).