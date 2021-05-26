/*
Predicado "estaEntre", que vincula dos números enteros "m" y "n",
 con la lista de los enteros mayores o iguales que "m" y menores o iguales que "n".
*/

/*estaEntre(NumeroInicial, NumeroFinal, ListaResultado).*/

estaEntre(NumeroInicial, NumeroFinal, Lista) :-
    agregarNumeros(NumeroInicial, NumeroFinal, Lista).

agregarNumeros(NumeroFinal, NumeroFinal, [NumeroFinal]).
/* No me resulto muy intuitivo tener que unificar [NumeroFinal] */

agregarNumeros(NumeroInicial, NumeroFinal, [NumeroInicial|RestoNumeros]) :-
    /* Sin esto no eran mutuamente excluyentes y entraba en un loop. */
    /*NumeroInicial =\= NumeroFinal, Cambiando esto por lo de abajo, 
    hace que si pido "estaEntre(NumeroMayor, NumeroMenor, V)", no entre en un loop*/
    NumeroInicial =< NumeroFinal,
    NumeroInicialAux is NumeroInicial + 1,
    agregarNumeros(NumeroInicialAux, NumeroFinal, RestoNumeros).