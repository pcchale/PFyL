/*
Predicado que relaciona un número N y una lista numérica ordenada L1, 
con otra lista numérica ordenada L2, formada con los elementos de L1 y el número N.
*/

insertado(N, [PrimerElementoLista|RestoElementosLista], [N|[PrimerElementoLista|RestoElementosLista]]) :-
    N =< PrimerElementoLista.

insertado(N, [PrimerElementoLista|RestoElementosLista], [PrimerElementoLista|RestoElementosListaResultado]) :-
    N > PrimerElementoLista,
    insertado(N, RestoElementosLista, RestoElementosListaResultado).