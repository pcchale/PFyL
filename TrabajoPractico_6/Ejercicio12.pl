/*
Predicado que relaciona una lista L1 y un elemento A perteneciente a la misma, 
con otra lista L2, formada con los mismos elementos de L1, menos A.
*/

menos1(_, [], []).

menos1(Elemento, [Elemento|RestoElementos], ListaResultado) :-
    menos1(Elemento, RestoElementos, ListaResultado).

menos1(Elemento, [PrimerElemento|RestoElementos], [PrimerElemento|RestoListaResultado]) :-
    Elemento \= PrimerElemento, 
    menos1(Elemento, RestoElementos, RestoListaResultado).