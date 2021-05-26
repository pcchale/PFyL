/*
Predicado que relaciona una lista L1 y un número N, menor o 
igual que la longitud de L1, con el enésimo elemento de L1.
*/

enesimo(N, Lista, ElementoResultado) :-
    enesimoAux(N, Lista, ElementoResultado, 1).

enesimoAux(N, [ElementoResultado|_], ElementoResultado, N).

enesimoAux(N, [ElementoLista|RestoElementosLista], ElementoResultado, NActual) :-
    N \= ElementoLista,
    NActualAux is NActual + 1,
    enesimoAux(N, RestoElementosLista, ElementoResultado, NActualAux).


