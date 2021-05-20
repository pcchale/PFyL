/*
Escribe un proceso recursivo que permita
decidir si un numero natural N es 
divisible por 11. Dado que se sabe que
un numero es divisible entre 11 si, y solo si, 
la suma de los digitos de posicion par,
menos la suma de los digitos de posicion impar
es multiplo de 11.
N = 2341675 (5+6+4+2) - (7+1+3) = 6
No es multiplo de 11, no es divisible por 11

*/

/*

Con este ejercicio aprendí bastantes cosas interesantes de Prolog
https://youtu.be/Fw1b20vYBIM

*/

obtenerUltimoDigito(Numero, UltimoDigito, NumeroRestante) :-
    UltimoDigito is Numero mod 10,
    NumeroRestante is Numero div 10.

esDivisiblePor11(Numero) :-
    esDivisiblePor11Aux(Numero, 0, 0, impar).

/*restaEsMultiploDe11(SumaPares, SumaImpares) :-
    Resta is (SumaPares - SumaImpares),
    RestaMod is (Resta mod 11),
    RestaMod = 0.*/
/*
esDivisiblePor11Aux(0, SumaPares, SumaImpares, _) :-
    restaEsMultiploDe11(SumaPares, SumaImpares).
*/

esDivisiblePor11Aux(0, Suma, Suma, _).


esDivisiblePor11Aux(0, SumaPares, SumaImpares, _) :-
    Resta is abs(SumaPares - SumaImpares),
    Resta >= 11,
    esDivisiblePor11(Resta).

esDivisiblePor11Aux(Numero, SumaPares, SumaImpares, par) :-
    Numero \= 0,
    obtenerUltimoDigito(Numero, UltimoDigito, NumeroRestante),
    SumaDigitos is (SumaPares + UltimoDigito),
    esDivisiblePor11Aux(NumeroRestante, SumaDigitos, SumaImpares, impar).

esDivisiblePor11Aux(Numero, SumaPares, SumaImpares, impar) :-
    Numero \= 0,
    obtenerUltimoDigito(Numero, UltimoDigito, NumeroRestante),
    SumaDigitos is (SumaImpares + UltimoDigito),
    esDivisiblePor11Aux(NumeroRestante, SumaPares, SumaDigitos, par).



