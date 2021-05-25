/*
Predicado que relaciona una lista L1 con otra lista L2, con los mismos elementos que L1, 
pero rotados N lugares a la izquierda.
*/
/*
obtenerPrimerosNElementos(N, Lista, ListaResultado) :-
    obtenerPrimerosNElementosAux(N, Lista, ListaResultado, 0).

obtenerPrimerosNElementosAux(N, _, [], N).

obtenerPrimerosNElementosAux(N, [PrimerElementoLista|RestoElementosLista], 
    [PrimerElementoLista|RestoElementosListaResultado], NActual) :-
    NAux is NActual + 1,
    obtenerPrimerosNElementosAux(N, RestoElementosLista, RestoElementosListaResultado, NAux).
*/
dividirLista(Posicion, Lista, ListaResultado, ListaSobrante) :-
    dividirListaAux(Posicion, Lista, ListaResultado, ListaSobrante, 0).

dividirListaAux(PosicionActual, ListaSobrante, [], ListaSobrante, PosicionActual).

dividirListaAux(Posicion, [ElementoLista|RestoElementos], [ElementoLista|RestoListaResultado], ListaSobrante, PosicionActual) :-
    PosicionActual =\= Posicion,
    PosicionActualAux is PosicionActual + 1,
    dividirListaAux(Posicion, RestoElementos, RestoListaResultado, ListaSobrante, PosicionActualAux).

concatenar([], Lista2, Lista2).

concatenar([PrimerElemento|RestoDeElementos], Lista2, [PrimerElemento | RestoListaResultado]) :-
    concatenar(RestoDeElementos, Lista2, RestoListaResultado).

rotadaN(N, Lista, ListaResultado) :-
    dividirLista(N, Lista, ListaIzq, ListaDer),
    concatenar(ListaDer, ListaIzq, ListaResultado).
