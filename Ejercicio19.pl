/*
Definir un predicado ternario "mayor_o_igual" que relaciona 
dos números con el mayor de ambos, o con uno de ellos si son iguales.

*/

mayor_o_igual(Mayor, Numero1, Numero2) :-
    Numero1 > Numero2,
    Mayor is Numero1.

mayor_o_igual(Mayor, Numero1, Numero2) :-
    Numero2 > Numero1,
    Mayor is Numero2.

mayor_o_igual(Mayor, Numero1, Numero2) :-
    Numero2 = Numero1,
    Mayor is Numero1.