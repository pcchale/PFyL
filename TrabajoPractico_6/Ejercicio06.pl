/*
Predicado unario que es verdadero cuando su sujeto es una 
lista numérica ordenada en forma creciente.
*/

ordenada([]).

ordenada([_]).

ordenada([PrimerElemento|RestoElementos]) :-
  ordenadaAux(RestoElementos, PrimerElemento).

ordenadaAux([Elemento | []], ElementoAnterior) :-
  Elemento >= ElementoAnterior.

ordenadaAux([PrimerElemento | RestoElementos], ElementoAnterior) :-
  PrimerElemento >= ElementoAnterior,
  ordenadaAux(RestoElementos, PrimerElemento).

%ordenada([_ | []]).

%ordenada([PrimerElemento | [SegundoElemento | RestoElementos]]) :-
%    SegundoElemento >= PrimerElemento,
%    ordenada(RestoElementos).
