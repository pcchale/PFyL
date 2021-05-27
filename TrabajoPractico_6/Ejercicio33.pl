/*
Escribir un predicado que relaciones una lista de gustos de helado con una lista 
formada por todas las combinaciones que se pueden hacer para vender helados de 2 gustos. 
Realizar las 2 posibilidades. 
Una que permita repeticiones y otra que no los permita.
*/
/*
heladosPosiblesSinRepeticion([frutilla, chocolate, americana, dulceDeLeche], Lista).
*/

concatenar([], Lista2, Lista2).

concatenar([PrimerElemento|RestoDeElementos], Lista2, [PrimerElemento | RestoListaResultado]) :-
    concatenar(RestoDeElementos, Lista2, RestoListaResultado).
    

armarPares(_, [], []).

armarPares(PrimerGusto, [SegundoGusto|RestoGustos], [[PrimerGusto, SegundoGusto] | RestoListaResultado]) :-
    armarPares(PrimerGusto, RestoGustos, RestoListaResultado).

heladosPosiblesSinRepeticion([], []).

heladosPosiblesSinRepeticion([PrimerGusto|RestoGustos], ListaResultado) :-
    armarPares(PrimerGusto, RestoGustos, ListaResultadoUno),
    heladosPosiblesSinRepeticion(RestoGustos, ListaResultadoDos),
    concatenar(ListaResultadoUno, ListaResultadoDos, ListaResultado).

/* Ese concatenar no me resultó muy intuivito, parece magia */



heladosPosiblesConRepeticion([], []).

heladosPosiblesConRepeticion([PrimerGusto|RestoGustos], ListaResultado) :-
    armarPares(PrimerGusto, [PrimerGusto | RestoGustos], ListaResultadoUno),
    heladosPosiblesSinRepeticion(RestoGustos, ListaResultadoDos),
    concatenar(ListaResultadoUno, ListaResultadoDos, ListaResultado).