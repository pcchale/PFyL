/*
Construir una regla para definir un predicado que vincule a X, 
y los coeficientes A, B y C del polinomio: P(x) = Ax^2 + Bx + C, 
y el valor del polinomio.

*/

esValorSegun(ValorPolinomio, X, A, B, C) :-
    PrimerTermino is A*X^2,
    SegundoTermino is B*X,
    TercerTermino is C,
    ValorPolinomio is PrimerTermino + SegundoTermino + TercerTermino.