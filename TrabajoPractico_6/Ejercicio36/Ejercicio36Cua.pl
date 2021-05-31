esLista([]).
esLista([_|_]).

primerElementoRestoElementos([PrimerElemento|RestoElementos], PrimerElemento, RestoElementos).

obtenerHijos([], []).

obtenerHijos([[PrimerElemento|_]|RestoElementos], [PrimerElemento|RestoListaResultado]) :-
    obtenerHijos(RestoElementos, RestoListaResultado).

obtenerHijos([PrimerElemento|RestoElementos], [PrimerElemento|RestoListaResultado]) :-
    obtenerHijos(RestoElementos, RestoListaResultado).

antecesores(Persona, ArbolGenialogico, ListaResultado) :-
    antecesoresAux(Persona, ArbolGenialogico, ListaResultado, []).

antecesoresAux(Persona, [Persona|_], ListaAcumuladora, ListaAcumuladora).

antecesoresAux(Persona, [Padre|Hijos], ListaResultado, [Padre|RestoListaAcumuladora]) :-
    antecesoresAux(Persona, Hijos, ListaResultado, RestoListaAcumuladora).

antecesoresAux(Persona, [Padre|Hijos], ListaResultado, [RestoListaAcumuladora]) :-
    antecesoresAux(Persona, Hijos, ListaResultado, RestoListaAcumuladora).