/*
A un tanque llega agua a través 
de una canilla, mientras que 
simultáneamente desagua a través 
de un sumidero. La capacidad del 
tanque es de T litros, por la canilla
 llegan C litros por minuto, y por el
  sumidero desaguan S litros por minuto.
 Inicialmente el tanque tiene L litros.
 Desarrollar un predicado que vincule los valores
  T, C, S y L, con los minutos que tarda en llenarse o vaciarse el tanque.

*/


minutosLlenadoOVaciadoSegun(Minutos, LitrosTotales, LitrosActuales, LitrosCanilla, LitrosSumidero) :-
    Minutos is (LitrosTotales-LitrosActuales) / (LitrosCanilla - LitrosSumidero).


minutos(Minutos, vacio, _, LitrosIniciales, LitrosCanilla, LitrosSumidero) :-
    LitrosSumidero > LitrosCanilla,
    minutosLlenadoOVaciadoSegun(Minutos, 0, LitrosIniciales, LitrosCanilla, LitrosSumidero).


minutos(Minutos, lleno, TotalLitros, LitrosIniciales, LitrosCanilla, LitrosSumidero) :-
    LitrosCanilla > LitrosSumidero,
    minutosLlenadoOVaciadoSegun(Minutos, TotalLitros, LitrosIniciales, LitrosCanilla, LitrosSumidero).

minutos(infinitos, LitrosIniciales, _, LitrosIniciales, LitrosCanilla, LitrosSumidero) :-
    LitrosCanilla =:= LitrosSumidero.