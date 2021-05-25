/*
Predicado que relaciona dos listas con una 
tercera, formada con los elementos de ambas.
*/

/*
concatenadas([d, a, b], [m, k, f, r, d, a], X).
*/

% concatenadas([], [], []).
% concatenadas([], [], []).

% concatenadas([PrimerElementoLista1|RestoElementosLista1], 
%              [PrimerElementoLista2|RestoElementosLista2], 
%              [PrimerElementoLista1|[PrimerElementoLista2|RestoElementosLista3]]) :-
%     concatenadas(RestoElementosLista1, RestoElementosLista2, RestoElementosLista3).

concatenadas(Lista1, Lista2, Resultado) :-
    agregarElementos(Lista1, Resultado),
    agregarElementos(Lista2, Resultado).

agregarElementos([UltimoElemento|[]], [UltimoElemento]).

agregarElementos([Elemento|RestoElementosParaAgregar], [Elemento|RestoLista]) :-
    agregarElementos(RestoElementosParaAgregar, RestoLista).


/* Intercalados */
agregarElementosALista([], [UltimoElementoLista2], [UltimoElementoLista2]).

agregarElementosALista([UltimoElementoLista1], [], [UltimoElementoLista1]).

agregarElementosALista([UltimoElementoLista1], [UltimoElementoLista2], [UltimoElementoLista1, UltimoElementoLista2]).

agregarElementosALista([PrimerElementoLista1|RestoElementosLista1], 
    [PrimerElementoLista2|RestoElementosLista2], 
    [PrimerElementoLista1 | [PrimerElementoLista2 | RestoListaResultado]]) :-
    agregarElementosALista(RestoElementosLista1, RestoElementosLista2, RestoListaResultado).
/* */

/* No se me habia ocurrido esta solucion */
concatenar([], Lista2, Lista2).

concatenar([PrimerElemento|RestoDeElementos], Lista2, [PrimerElemento | RestoListaResultado]) :-
    concatenar(RestoDeElementos, Lista2, RestoListaResultado).
    