/*
Resolver el problema de encontrar el MCD entre dos números, 
sabiendo que, si los números son iguales, el MCD es el mismo 
número, en otro caso el MCD es igual al MCD entre el menor de 
ellos y la diferencia entre ambos.
*/

obtenerMenor(Menor, Menor, Numero2) :-
    Numero2 > Menor.

obtenerMenor(Menor, Numero1, Menor) :-
    Numero1 > Menor.

diferencia(Diferencia, Numero1, Numero2) :-
    Numero1 > Numero2,
    Diferencia is Numero1 - Numero2.


diferencia(Diferencia, Numero1, Numero2) :-
    Numero2 > Numero1,
    Diferencia is Numero2 - Numero1.

mcd(Numero1, Numero1, Numero1).

mcd(MCD, Numero1, Numero2) :-
    obtenerMenor(Menor, Numero1, Numero2),
    diferencia(Diferencia, Numero1, Numero2),
    mcd(MCD, Menor, Diferencia).
