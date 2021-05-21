/*
Construir una regla para definir un predicado que vincule a los coeficientes 
A, B y C del polinomio de grado 2 con la cantidad de raíces distintas que tiene 
y el conjunto numérico al que pertenecen.

*/

% A coeficiente al cuadrado

% B coeficiente que multiplica la x

% C coeficiente solo

% Si yo dentro de la funcion le asigno un valor a cantidad y tipo de raices, estaría
% rompiendo el paradigma, por eso tengo que hacer que unifiquen.

% Error comun es poner siempre variables en los predicados.
% DIFERENCIAR EL CONCEPTO DE ASIGNACION Y DE UNIFICACION.

cantidadDeRaices(2, reales, A, B, C) :-
    Discriminante is B^2 - 4 * A * C,
    % 2 Raices reales
    Discriminante > 0.
    % El if se reemplaza por este objetivo
    % Si el discriminante es mayor a 0, unifica con 2 y reales.

cantidadDeRaices(1, realDoble, A, B, C) :-
    Discriminante is B^2 - 4 * A * C,
    % 2 Raices reales
    Discriminante = 0.

cantidadDeRaices(2, complejasYConjugadas, A, B, C) :-
    Discriminante is B^2 - 4 * A * C,
    % 2 Raices reales
    Discriminante < 0.

/*
cantidadDeRaices(2, complejasYConjugadas, _, _, _)
Se usa la variable anonima porque no me interesa el valor de A B y C.
*/