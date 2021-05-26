/*
Predicado que relaciona una lista L1 y un número N, con otra lista L2, 
con los elementos de L1 menos los primeros N.
*/


menosn(N, Lista, ListaResultado) :-
    menosnaux(N, Lista, ListaResultado, 0).

menosnaux(NAcumulado, ListaResultado, ListaResultado, NAcumulado).

menosnaux(N, [_|RestoElementos], ListaResultado, NAcumulado):-
    NAcumuladoAux is NAcumulado + 1,
    menosnaux(N, RestoElementos, ListaResultado, NAcumuladoAux).