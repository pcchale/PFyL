/*
pertenece(Elemento, [PrimerElemento | _]) :-
    Elemento =:= PrimerElemento.
*/
/* Esto de arriba es equivalente a escribir:*/
/*
pertenece(Elemento, [Elemento | _]).

pertenece(Elemento, [_ | RestoElementos]) :-
    pertenece(Elemento, RestoElementos).
*/

/* Pertenece con indice*/
/*
pertenece(Indice, Elemento, Lista):-
    perteneceAux(Indice, Elemento, Lista, 0).

perteneceAux(IndiceActual, Elemento, [Elemento|_], IndiceActual).

perteneceAux(Indice, Elemento, [_ | RestoElementos], IndiceActual) :-*/
    /*PrimerElemento =\= Elemento, Sin esto, si sigo pidinedo elementos, me da los otros indices del elemento*/
   /* IndiceAux is IndiceActual + 1,
    perteneceAux(Indice, Elemento, RestoElementos, IndiceAux).*/

/* Pertenece con Indice y Repeticiones*/

/* Resolución con mala complejidad algoritmica, pero más simple. */

/*Encapsulo las funciones recursivas*/
pertenece(Elemento, Indice, Repeticiones, Lista):-
    /* Primero recorro la lista buscando el indice de la primera ocurrencia del elemento */
    obtenerIndice(Elemento, Indice, Lista, 0),

    /* Despues recorro la lista buscando la cantidad de repeticiones del elemento */
    obtenerRepeticiones(Elemento, Repeticiones, Lista, 0).

/* Cuando el elemento que estoy buscando es la cabeza de la lista, 
   unifico el indice del elemento, con el indice actual */
obtenerIndice(Elemento, IndiceActual, [Elemento|_], IndiceActual).

/* Cuando la cabeza de la lista no coincide con el elemento que estoy buscando,
   incremento el valor del indiceActual y hago la llamada recursiva, sin el primer
   elemento de la lista */
obtenerIndice(Elemento, Indice, [PrimerElemento | RestoElementos], IndiceActual) :-
    PrimerElemento =\= Elemento,  
    IndiceAux is IndiceActual + 1,
    obtenerIndice(Elemento, Indice, RestoElementos, IndiceAux).

/* Cuando la lista está vacia, unifico las repeticiones del elemento buscado, 
   con las repeticiones que tengo acumuladas. */
obtenerRepeticiones(_, RepetcionesActuales, [], RepetcionesActuales).

/* Cuando el elemento que estoy contando, es la cabeza de la lista, incremento,
   las repeticiones actuales, y llamo a la funcion recursivamente para seguir contando,
   en el resto de los elementos. */
obtenerRepeticiones(Elemento, Repeticiones, [Elemento|RestoElementos], RepeticionesActuales) :-
    RepeticionesActualesAux is RepeticionesActuales + 1,
    obtenerRepeticiones(Elemento, Repeticiones, RestoElementos, RepeticionesActualesAux).

/* Cuando el elemento que estoy contando no coincide con la cabeza de la lista, llamo a 
   la funcion recursiva con el resto de los elementos, para seguir buscando ocurrencias. */
obtenerRepeticiones(Elemento, Repeticiones, [PrimerElemento|RestoElementos], RepetcionesActuales) :-
    Elemento =\= PrimerElemento,
    obtenerRepeticiones(Elemento, Repeticiones, RestoElementos, RepetcionesActuales).
