/*
Predicados que relacionan una lista con una expresión aritmética 
escrita en notación polaca, es decir, representada en forma de árbol, 
donde los operadores forman los nodos intermedios y los operandos las hojas-, 
con el resultado numérico de la expresión. Limitarse a las cuatro operaciones elementales.
?- calculo([*,5,[+,4,3]],X).
X = 35
*/

esOperador(*).
esOperador(+).
esOperador(-).
esOperador(/).

suma(+).
resta(-).
division(/).
multiplicacion(*).

esLista([]).
esLista([_|_]).

obtenerResultado(Valor1, Operador, Valor2, Resultado) :-
    suma(Operador),
    Resultado is Valor1 + Valor2.

obtenerResultado(Valor1, Operador, Valor2, Resultado) :-
    resta(Operador),
    Resultado is Valor1 - Valor2.

obtenerResultado(Valor1, Operador, Valor2, Resultado) :-
    division(Operador),
    Resultado is Valor1 / Valor2.

obtenerResultado(Valor1, Operador, Valor2, Resultado) :-
    multiplicacion(Operador),
    Resultado is Valor1 * Valor2.

calculo(PrimerElemento, PrimerElemento) :-
    not(esLista(PrimerElemento)).

calculo([PrimerElemento,SegundoElemento,TercerElemento], Resultado) :-
    esOperador(PrimerElemento),
    calculo(SegundoElemento, ResultadoUno),
    calculo(TercerElemento, ResultadoDos),
    obtenerResultado(ResultadoUno, PrimerElemento, ResultadoDos, Resultado).