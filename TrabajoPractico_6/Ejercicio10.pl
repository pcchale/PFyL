/*
Predicado que relaciona una lista L1 con otra lista L2, 
con los mismos elementos que L1, 
pero rotados un lugar a la izquierda.
*/

concatenar([], Lista2, Lista2).

concatenar([PrimerElemento|RestoDeElementos], Lista2, [PrimerElemento | RestoListaResultado]) :-
    concatenar(RestoDeElementos, Lista2, RestoListaResultado).

insertarAlFinal(Elemento, Lista, ListaResultado) :-
    concatenar(Lista, [Elemento], ListaResultado).

rotada([PrimerElemento|RestoElementos], ListaResultado) :-
    insertarAlFinal(PrimerElemento, RestoElementos, ListaResultado).
