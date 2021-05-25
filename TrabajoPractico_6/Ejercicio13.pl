/*
Predicado que relaciona dos átomos A y B, y dos listas C y D, 
tal que D es igual a C, pero con el átomo A sustituido por el B, en su primera ocurrencia.
*/

sustituida1(ElementoASustituir, ElementoSustituto, 
    [ElementoASustituir | RestoElementos], [ElementoSustituto | RestoElementos]).

sustituida1(ElementoASustituir, ElementoSustituto, 
        [PrimerElementoLista | RestoElementos], [PrimerElementoLista|RestoListaResultado]) :-
    ElementoASustituir \= PrimerElementoLista,
    sustituida1(ElementoASustituir, ElementoSustituto, RestoElementos, RestoListaResultado).
