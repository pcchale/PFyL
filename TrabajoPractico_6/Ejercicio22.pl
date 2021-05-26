/*
Predicado que relaciona una lista numérica L1, con otra L2, 
con los mismos elementos que L1, pero con el mayor de ellos 
en el último lugar.
*/

mayor([PrimerElemento | RestoElementos], Mayor) :-
    mayorAux(RestoElementos, PrimerElemento, Mayor).

mayorAux([], Mayor, Mayor).

mayorAux([PrimerElemento | RestoElementos], MayorActual, Mayor) :-
    PrimerElemento > MayorActual,
    mayorAux(RestoElementos, PrimerElemento, Mayor).


mayorAux([PrimerElemento | RestoElementos], MayorActual, Mayor) :-
    PrimerElemento =< MayorActual,
    mayorAux(RestoElementos, MayorActual, Mayor).

borrar(_, [], []).

borrar(PrimerElementoLista, [PrimerElementoLista|RestoElementos], RestoElementos).

borrar(Elemento, [PrimerElementoLista|RestoElementos], [PrimerElementoLista|RestoListaResultado]) :-
    Elemento =\= PrimerElementoLista,
    borrar(Elemento, RestoElementos, RestoListaResultado).

insertarAlFinal(Elemento, Lista, ListaResultado) :-
    concatenar(Lista, [Elemento], ListaResultado).

concatenar([], Lista2, Lista2).

concatenar([PrimerElemento|RestoDeElementos], Lista2, [PrimerElemento | RestoListaResultado]) :-
    concatenar(RestoDeElementos, Lista2, RestoListaResultado).

ultimayo(Lista, ListaResultado) :-
    mayor(Lista, Mayor),
    borrar(Mayor, Lista, ListaSinMayor),
    insertarAlFinal(Mayor, ListaSinMayor, ListaResultado).

