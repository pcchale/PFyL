/*
separaMayMen( [1 8 3 4 5 2 7], 4, L) 
L = [[1 2 3], [5 6 7]]
*/

separaMayMen([], _, [[],[]]).

separaMayMen([PrimerNumero | RestoNumeros], Numero, [RestoMenores,[PrimerNumero|RestoMayores]]) :-
    PrimerNumero > Numero,
    separaMayMen(RestoNumeros, Numero, [RestoMenores, RestoMayores]).


separaMayMen([PrimerNumero | RestoNumeros], Numero, [[PrimerNumero|RestoMenores],RestoMayores]) :-
    PrimerNumero < Numero,
    separaMayMen(RestoNumeros, Numero, [RestoMenores, RestoMayores]).


separaMayMen([PrimerNumero | RestoNumeros], Numero, [RestoMenores,RestoMayores]) :-
    PrimerNumero =:= Numero,
    separaMayMen(RestoNumeros, Numero, [RestoMenores, RestoMayores]).