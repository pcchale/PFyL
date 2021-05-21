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

/* Si los litros actuales, son iguales a los litros totales del tanque*/
/* Los minutos que tardó en llenarse, son los minutos acumulados */
/* Por eso unifico el primer argumento, con el segundo */
simularMinuto(MinutosAcumulados, MinutosAcumulados, TotalLitros, TotalLitros, _, _).

/* Si los litros actuales son 0 */
/* Los minutos que tardó en vaciarse, son los minutos acumulados */
/* Por eso unifico el primer argumento, con el segundo */
simularMinuto(MinutosAcumulados, MinutosAcumulados, 0, _, _, _).

/* Si la velocidad de llenado, es igual a la velocidad de vaciado*/
/* Y el tanque no está lleno ni vacío de entrada (Porque no unificó en los hechos anteriores)*/
/* Se va a mantener siempre en los mismos litros actuales */
simularMinuto(infinitos, _, _, _, LitrosPorMinuto, LitrosPorMinuto).

simularMinuto(MinutosTotales, MinutosAcumulados, LitrosActuales, TotalLitros, LitrosCanilla, LitrosSumidero) :-
    LitrosActualesAux is LitrosActuales + LitrosCanilla - LitrosSumidero,
    MinutosAux is MinutosAcumulados + 1,
    simularMinuto(MinutosTotales, MinutosAux, LitrosActualesAux, TotalLitros, LitrosCanilla, LitrosSumidero).

minutos(MinutosTotales, TotalLitros, LitrosIniciales, LitrosCanilla, LitrosSumidero) :-
    simularMinuto(MinutosTotales, 0, LitrosIniciales, TotalLitros, LitrosCanilla, LitrosSumidero).

