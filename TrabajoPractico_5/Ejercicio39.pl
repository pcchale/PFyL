%factorial(Numero, Resultado) :-
%    Numero = 1,
%    Resultado is 1.

%factorial(1, Resultado) :-
%        Resultado is 1.

factorial(Numero, Resultado) :-
    Numero < 0,
    Resultado is 0.

factorial(0, 1).

factorial(Numero, Resultado) :-
    Numero2 is (Numero - 1),
    factorial(Numero2, Resultado2),
    Resultado is Numero * Resultado2.