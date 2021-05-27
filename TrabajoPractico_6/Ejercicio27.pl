/*
Predicado que relaciona dos listas de igual longitud L1 y L2,
con una tercera L3, tal que los elementos de L3 son sublistas 
formadas por los elementos correspondientes de L1 y L2 tomados de a pares.
*/

duplas(Lista1, Lista2, ListaResultado) :-
    duplasAux(Lista1, Lista2, ListaResultado).

duplasAux([], [], []).

duplasAux([PrimerElementoLista1|RestoElementosLista1], [PrimerElementoLista2|RestoElementosLista2], 
    [[PrimerElementoLista1,PrimerElementoLista2]|RestoListaResultado]) :-
    duplasAux(RestoElementosLista1, RestoElementosLista2, RestoListaResultado).