/* No se me habia ocurrido esta solucion */
concatenar([], Lista2, Lista2).

concatenar([PrimerElemento|RestoDeElementos], Lista2, [PrimerElemento | RestoListaResultado]) :-
    concatenar(RestoDeElementos, Lista2, RestoListaResultado).
    

/*
insertarPrincipio(Elemento, Lista, ListaResultado).
*/

insertarPrincipio(Elemento, Lista, [Elemento|Lista]).

/* Mi solucion
insertarAlFinal(Elemento, [], [Elemento]).

insertarAlFinal(Elemento, [ElementoLista|RestoElementos], [ElementoLista|RestoElementosListaResultado]):-
    insertarAlFinal(Elemento, RestoElementos, RestoElementosListaResultado).
*/

/*
    Mejor solucion, de Pablo.
*/

insertarAlFinal(Elemento, Lista, ListaResultado) :-
    concatenar(Lista, [Elemento], ListaResultado).
/* Si al elemento no lo ponia en una lista devolvia algo como:
X = [1, 2, 3, 4|2].
 */

dividirLista(Posicion, Lista, ListaResultado, ListaSobrante) :-
    dividirListaAux(Posicion, Lista, ListaResultado, ListaSobrante, 0).

dividirListaAux(PosicionActual, ListaSobrante, [], ListaSobrante, PosicionActual).

dividirListaAux(Posicion, [ElementoLista|RestoElementos], [ElementoLista|RestoListaResultado], ListaSobrante, PosicionActual) :-
    PosicionActual =\= Posicion,
    PosicionActualAux is PosicionActual + 1,
    dividirListaAux(Posicion, RestoElementos, RestoListaResultado, ListaSobrante, PosicionActualAux).


insertarEnPosicion(Elemento, Posicion, Lista, ListaResultado) :-
    dividirLista(Posicion, Lista, ListaIzq, ListaDer),
    concatenar(ListaIzq, [Elemento], ListaIzqConElemento),
    concatenar(ListaIzqConElemento, ListaDer, ListaResultado).


insertarOrdenado(Elemento, ListaOrdenada, ListaResultado) :-
    obtenerIndiceDelMayorA(Indice, Elemento, ListaOrdenada),
    dividirLista(Indice, ListaOrdenada, ListaIzq, ListaDer),
    concatenar(ListaIzq, [Elemento], ListaIzqConElemento),
    concatenar(ListaIzqConElemento, ListaDer, ListaResultado).


obtenerIndiceDelMayorA(Indice, Elemento, ListaOrdenada) :-
    obtenerIndiceDelMayorAAux(Indice, Elemento, ListaOrdenada, 0).

obtenerIndiceDelMayorAAux(IndiceActual, _, [], IndiceActual).

obtenerIndiceDelMayorAAux(IndiceActual, Elemento, [ElementoOrdenado | _], IndiceActual) :-
    ElementoOrdenado > Elemento.

obtenerIndiceDelMayorAAux(Indice, Elemento, [ElementoOrdenado | RestoElementosOrdenados], IndiceActual) :-
    ElementoOrdenado =< Elemento,
    IndiceActualAux is IndiceActual + 1,
    obtenerIndiceDelMayorAAux(Indice, Elemento, RestoElementosOrdenados, IndiceActualAux).


/*  */

obtenerIndiceDelElementoAux(IndiceActual, PrimerElementoLista, [PrimerElementoLista | _], IndiceActual).

obtenerIndiceDelElementoAux(Indice, Elemento, [PrimerElementoLista | RestoElementosLista], IndiceActual) :-
    IndiceActualAux is IndiceActual + 1,
    PrimerElementoLista =\= Elemento,
    obtenerIndiceDelMayorAAux(Indice, Elemento, RestoElementosLista, IndiceActualAux).

obtenerIndiceDelElemento(Indice, Elemento, Lista) :-
    obtenerIndiceDelElementoAux(Indice, Elemento, Lista, 0).
/*
borrar(Elemento, Lista, ListaResultado) :-
    obtenerIndiceDelElemento(Indice, Elemento, Lista),
    dividirLista(Indice, Lista, ListaIzq, ListaDer).
*/
/* */

/* El "Borrar" cambia en que cuando encuentra al elemento, unifica la cola de la lista resultaado,
con la cola de la lista de elementos. El borrarTodos, vuelve a llamar a la funcion recursiva, 
para que siga borrando.*/

borrar(_, [], []).

borrar(PrimerElementoLista, [PrimerElementoLista|RestoElementos], RestoElementos).

borrar(Elemento, [PrimerElementoLista|RestoElementos], [PrimerElementoLista|RestoListaResultado]) :-
    Elemento =\= PrimerElementoLista,
    borrar(Elemento, RestoElementos, RestoListaResultado).

borrarTodos(_, [], []).

borrarTodos(PrimerElementoLista, [PrimerElementoLista|RestoElementos], ListaResultado) :-
    borrarTodos(PrimerElementoLista, RestoElementos, ListaResultado).


borrarTodos(Elemento, [PrimerElementoLista|RestoElementos], [PrimerElementoLista|RestoListaResultado]) :-
    Elemento =\= PrimerElementoLista,
    borrarTodos(Elemento, RestoElementos, RestoListaResultado).