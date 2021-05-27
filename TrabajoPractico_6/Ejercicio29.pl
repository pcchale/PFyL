/*
Predicado que relaciona una lista de listas, con otra lista 
formada únicamente con los átomos de la primera.
*/
esLista([]).
esLista([_|_]).
/* No se me habia ocurrido esta solucion */
concatenar([], Lista2, Lista2).

concatenar([PrimerElemento|RestoDeElementos], Lista2, [PrimerElemento | RestoListaResultado]) :-
    concatenar(RestoDeElementos, Lista2, RestoListaResultado).
    

/*planchada(Lista, ListaResultado).*/

planchada([], []).

planchada([PrimerElemento|RestoElementos], [PrimerElemento|RestoListaResultado]) :-
    not(esLista(PrimerElemento)),
    planchada(RestoElementos, RestoListaResultado).

planchada([PrimerElemento|RestoElementos], RestoListaResultado) :-
    esLista(PrimerElemento),
    planchada(PrimerElemento, ResultadoAux1),
    planchada(RestoElementos, ResultadoAux2),
    concatenar(ResultadoAux1, ResultadoAux2, RestoListaResultado).

/* Me costó encontrar esa solucion. */