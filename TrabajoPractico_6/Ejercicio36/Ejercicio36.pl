/*
Dada una lista multinivel que representa el árbol genealógico de una
familia donde el primer elemento de cada lista es el nombre del padre
y el resto de los elementos de la lista representan sus hijos, pero 
si estos tienen hijos se presentarán con una lista con la misma estructura.
Escribir un predicado relacione a una persona con la lista de todos sus antecesores.
*/
esLista([]).
esLista([_|_]).

estaEnLista(Persona, [Persona|_]).

estaEnLista(Persona, [PrimerElemento|_]) :-
    esLista(PrimerElemento),
    estaEnLista(Persona, PrimerElemento).

estaEnLista(Persona, [PrimerElemento|RestoElementos]) :-
    esLista(PrimerElemento),
    /*not(estaEnLista(Persona, PrimerElemento)), *//* Capaz no va esto*/
    estaEnLista(Persona, RestoElementos).

estaEnLista(Persona, [PrimerElemento|RestoElementos]) :-
    not(esLista(PrimerElemento)),
    estaEnLista(Persona, RestoElementos).

antecesores(_, [], []).

antecesores(Persona, [Padre|Hijos], [Padre|RestoListaResultado]) :-
    estaEnLista(Persona, Hijos),    
    antecesores(Persona, Hijos, RestoListaResultado).

antecesores(Persona, [_|Hijos], RestoListaResultado) :-
    /*not(estaEnLista(Persona, Hijos)),*/
    antecesores(Persona, Hijos, RestoListaResultado).

padreEHijos([Padre|Hijos], Padre, Hijos).


eliminarLista([[PrimerElemento|RestoElementos]], [PrimerElemento|RestoElementos]).

eliminarLista([PrimerElemento|RestoElementos], [PrimerElemento|RestoElementos]).

