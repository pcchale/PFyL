/*
Predicado que relaciona dos vectores de igual dimensión con su producto escalar. 
Las coordenadas de cada vector son elementos de una lista.
*/

producto(Vector1, Vector2, Resultado) :-
    productoAux(Vector1, Vector2, 0, Resultado).

productoAux([], [], Resultado, Resultado).

productoAux([ValorV1|RestoValoresV1], [ValorV2|RestoValoresV2], Acumulador, Resultado) :-
    AcumuladorAux is (ValorV1 * ValorV2) + Acumulador,
    productoAux(RestoValoresV1, RestoValoresV2, AcumuladorAux, Resultado).