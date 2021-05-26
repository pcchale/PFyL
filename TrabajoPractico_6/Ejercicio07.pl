/*
Predicado que relaciona una lista cualquiera con el 
elemento que se encuentra en el último lugar.
*/

ultimo(UltimoElemento, [UltimoElemento | []]).

ultimo(UltimoElemento, [_ | RestoElementos]) :-
    ultimo(UltimoElemento, RestoElementos).