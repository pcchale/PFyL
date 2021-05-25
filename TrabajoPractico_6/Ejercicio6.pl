/*
Predicado unario que es verdadero cuando su sujeto es una 
lista numérica ordenada en forma creciente.
*/

ordenada([]).

ordenada([_ | []]).

ordenada([PrimerElemento | [SegundoElemento | RestoElementos]]) :-
    SegundoElemento > PrimerElemento,
    ordenada(RestoElementos).