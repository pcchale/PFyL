/*antecesores()

Antecesor

Antecesor, Descendiente

Antecesor, [Decendiente | Hijos]*/

concatenar([], Lista2, Lista2).

concatenar([PrimerElemento|RestoDeElementos], Lista2, [PrimerElemento | RestoListaResultado]) :-
    concatenar(RestoDeElementos, Lista2, RestoListaResultado).

esLista([]).
esLista([_|_]).

obtenerDescendientes([_|[]]q, []).
    /* [pepe]*/

obtenerDescendientes([Antecesor|[PrimerDescendiente|RestoDescendientes]], ListaResultado) :-
    /* [pepe, [juan, jose, raul], [ricardo, ruben]]*/
    esLista(PrimerDescendiente),
    obtenerDescendientes([Antecesor|PrimerDescendiente], ListaResultado1),
    obtenerDescendientes([Antecesor|RestoDescendientes], ListaResultado2),
    concatenar(ListaResultado1, ListaResultado2, ListaResultado).


obtenerDescendientes([Antecesor|[PrimerDescendiente|RestoDescendientes]], [PrimerDescendiente|RestoListaResultado]) :-
    /* [pepe, juan, [ricardo, ruben]]*/
    not(esLista(PrimerDescendiente)),    
    obtenerDescendientes([Antecesor|RestoDescendientes], RestoListaResultado).

antecesores(_, [], []).

antecesores(Persona, [Antecesor|RestoPersonas], [Antecesor|RestoListaResultado]) :-
    obtenerDescendientes([Antecesor|RestoPersonas], Descendientes),
    estaEnLista(Persona, Descendientes),
    antecesores(Persona, RestoPersonas, RestoListaResultado).


/*
antecesores(Persona, [Antecesor|RestoPersonas], [RestoListaResultado]) :-
    antecesores(Persona, RestoP)*/

estaEnLista(Persona, [Persona|_]).

estaEnLista(Persona, [PrimerElemento|RestoElementos]) :-
    Persona \= PrimerElemento,
    estaEnLista(Persona, RestoElementos).
    
