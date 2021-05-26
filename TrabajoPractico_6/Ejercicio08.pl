/*
Predicado cuyos sujetos son dos listas, y que
 es verdadero cuando la primera lista es un subconjunto de la segunda.
*/

/*existe(Elemento, Lista)*/
existe(Elemento, [Elemento|_]).


existe(Elemento, [PrimerElemento|RestoElementos]) :-
    Elemento \= PrimerElemento,  /*Sin esto da dos veces true si el elemento está repetido*/
    existe(Elemento, RestoElementos).

subconjunto([], _).

subconjunto([PrimerElementoListaSubconjunto|RestoElementosListaSubconjunto], Lista) :-
    existe(PrimerElementoListaSubconjunto, Lista),
    subconjunto(RestoElementosListaSubconjunto, Lista).