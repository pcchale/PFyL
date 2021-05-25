/*
Predicado que relaciona dos átomos A y B, y dos listas C y D, tal que D es igual a C, 
pero con el átomo A sustituido por el B, en todas sus ocurrencias.
*/
/*
sustituidan(d, m, [a, b, c, d, e, d, g, h, d, j], X).
*/

sustituidan(_, _, [], []).

sustituidan(ElementoASustituir, ElementoSustituto, 
    [ElementoASustituir | RestoElementos], [ElementoSustituto | RestoListaResultado]) :-
    sustituidan(ElementoASustituir, ElementoSustituto, RestoElementos, RestoListaResultado).

sustituidan(ElementoASustituir, ElementoSustituto, 
        [PrimerElementoLista | RestoElementos], [PrimerElementoLista|RestoListaResultado]) :-
    ElementoASustituir \= PrimerElementoLista,
    sustituidan(ElementoASustituir, ElementoSustituto, RestoElementos, RestoListaResultado).
