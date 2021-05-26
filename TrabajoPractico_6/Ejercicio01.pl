/*
Predicado que relaciona una lista numérica de dos elementos 
con otra lista con esos dos elementos ordenados de menor a mayor.
*/

acomodados([PrimerElemento | [SegundoElemento | _]], [PrimerElemento, SegundoElemento]) :-
    SegundoElemento > PrimerElemento.


acomodados([PrimerElemento | [SegundoElemento | _]], [SegundoElemento, PrimerElemento]) :-
    PrimerElemento > SegundoElemento.