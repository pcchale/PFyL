/*
Dada una lista multinivel que representa el árbol genealógico de una familia 
donde el primer elemento de cada lista es el nombre del padre y el resto de los 
elementos de la lista representan sus hijos, pero si estos tienen hijos se presentarán
con una lista con la misma estructura.
Escribir un predicado relacione a una persona con la lista de todos sus antecesores.
*/

/* No se me habia ocurrido esta solucion */
concatenar([], Lista2, Lista2).

concatenar([PrimerElemento|RestoDeElementos], Lista2, [PrimerElemento | RestoListaResultado]) :-
    concatenar(RestoDeElementos, Lista2, RestoListaResultado).
    

esLista([]).
esLista([_|_]).

antecesorYDescendientes([[Antecesor|RestoElementos]|RestoLista], Antecesor, Descendientes, RestoLista) :-
    obtenerDescendientes(RestoElementos, Descendientes).
    /*obtenerDescendientes(RestoLista, Resultado2),*/
    /*concatenar(Resultado1, Resultado2, Hijos).*/

antecesorYDescendientes([Antecesor|RestoLista], Antecesor, Descendientes, RestoLista) :-
    obtenerDescendientes(RestoLista, Descendientes).

obtenerDescendientes([], []).

obtenerDescendientes([Antecesor|RestoElementos], [Antecesor|RestoListaResultado]) :-
    not(esLista(Antecesor)),
    obtenerDescendientes(RestoElementos, RestoListaResultado).

obtenerDescendientes([[Padre|RestoHijos]|RestoElementos], [Padre|RestoListaResultado]) :-
    obtenerDescendientes(RestoHijos, RestoListaResultado).
    /*obtenerDescendientes(RestoHijos, ListaResultado2),*/
    /*concatenar(ListaResultado1, ListaResultado2, RestoListaResultado).*/

antecesores(_, [], []).
    
antecesores(Persona, [PrimerPersona|RestoPersonas], [PrimerPersona|RestoListaResultado]) :-
    obtenerDescendientes(RestoPersonas, Descendientes),
    estaEnLista(Persona, Descendientes),
    antecesores(Persona, RestoPersonas, RestoListaResultado).

antecesores(Persona, [_|RestoPersonas], [RestoListaResultado]) :-
    obtenerDescendientes(RestoPersonas, Descendientes),
    /*padreEHijos([PrimerPersona|RestoPersonas], Descendiente, Descendientes),*/
    not(estaEnLista(Persona, Descendientes)),
    antecesores(Persona, RestoPersonas, RestoListaResultado).

estaEnLista(Persona, [Persona|_]).

estaEnLista(Persona, [PrimerElemento|RestoElementos]) :-
    Persona \= PrimerElemento,
    estaEnLista(Persona, RestoElementos).
    