
concatenar([], Lista2, Lista2).

concatenar([PrimerElemento|RestoDeElementos], Lista2, [PrimerElemento | RestoListaResultado]) :-
    concatenar(RestoDeElementos, Lista2, RestoListaResultado).
    
insertarPrincipio(Elemento, Lista, [Elemento|Lista]).

inversa(Lista, ListaResultado) :-
    inversaAux(Lista, [], ListaResultado).

inversaAux([], ListaResultado, ListaResultado).

inversaAux([PrimerElementoLista|RestoElementosLista], ListaAcumuladora, ListaResultado) :-
    insertarPrincipio(PrimerElementoLista, ListaAcumuladora, ListaAcumuladoraAux),
    inversaAux(RestoElementosLista, ListaAcumuladoraAux, ListaResultado).

