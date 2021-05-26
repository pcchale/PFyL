/*
Predicado que vincula un número decimal, la nueva base y la lista formada 
por los dígitos que representan el mismo número en la nueva base.
*/

concatenar([], Lista2, Lista2).

concatenar([PrimerElemento|RestoDeElementos], Lista2, [PrimerElemento | RestoListaResultado]) :-
    concatenar(RestoDeElementos, Lista2, RestoListaResultado).
    
insertarPrincipio(Elemento, Lista, [Elemento|Lista]).

enBaseAux(Numero, Base, [Numero]) :-
    Numero < Base.

enBaseAux(Numero, Base, [Resto|RestoListaResultado]) :-
    Numero >= Base,
    Resto is Numero mod Base,
    NumeroAux is Numero div Base,
    enBaseAux(NumeroAux, Base, RestoListaResultado).

invertir([], ListaResultado, ListaResultado).

invertir([PrimerElementoLista|RestoElementosLista], ListaAcumuladora, ListaResultado) :-
    insertarPrincipio(PrimerElementoLista, ListaAcumuladora, ListaAcumuladoraAux),
    invertir(RestoElementosLista, ListaAcumuladoraAux, ListaResultado).


enBase(Numero, Base, ListaResultado) :-
    enBaseAux(Numero, Base, ListaResultadoInvertida),
    invertir(ListaResultadoInvertida, [], ListaResultado).