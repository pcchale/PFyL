/*
Dados los siguientes datos sobre jugadores de basket:
cantidad_de_dobles(juan, 15).
cantidad_de_triples(jose, 5).
cantidad_de_infracciones(juan, 6).
 
que representan la cantidad de dobles, triples e infracciones de los jugadores a lo largo del 
campeonato, se requiere un predicado que relacione el nombre de un jugador con alguna de las 
siguientes categorías:
Posible NBA, cuando el jugador hizo al menos 10 triples, 30 dobles y cometió menos de 5 infracciones.
Bueno, cuando el jugador hizo al menos 20 dobles y cometió menos de 8 infracciones.
Regular, cuando el jugador hizo al menos 10 dobles y cometió menos de 12 infracciones.
Desastroso, cuando el jugador hizo menos de 10 dobles y cometió 12 o más infracciones.
*/

cantidad_de_dobles(juan, 9).
cantidad_de_triples(juan, 9).
cantidad_de_infracciones(juan, 12).

restricciones(posibleNBA, 10, 30, 5).
restricciones(bueno, 0, 20, 8).
restricciones(regular, 0, 10, 12).
restricciones(desastroso, 0, 10, 12).

obtenerEstadisticas(NombreJugador, CantidadDeTriples, CantidadDeDobles, CantidadDeInfracciones) :-
    cantidad_de_triples(NombreJugador, CantidadDeTriples),
    cantidad_de_dobles(NombreJugador, CantidadDeDobles),
    cantidad_de_infracciones(NombreJugador, CantidadDeInfracciones).

calidadJugador(posibleNBA, NombreJugador) :-
    obtenerEstadisticas(NombreJugador, CantidadDeTriples, CantidadDeDobles, CantidadDeInfracciones),
    restricciones(posibleNBA, CantidadDeTriplesMinimos, CantidadDeDoblesMinimos, CantidadDeInfraccionesMaximas),
    CantidadDeTriples >= CantidadDeTriplesMinimos,
    CantidadDeDobles >= CantidadDeDoblesMinimos,
    CantidadDeInfracciones < CantidadDeInfraccionesMaximas.

calidadJugador(bueno, NombreJugador) :-
    obtenerEstadisticas(NombreJugador, _, CantidadDeDobles, CantidadDeInfracciones),
    restricciones(bueno, _, CantidadDeDoblesMinimos, CantidadDeInfraccionesMaximas),
    CantidadDeDobles >= CantidadDeDoblesMinimos,
    CantidadDeInfracciones < CantidadDeInfraccionesMaximas.

calidadJugador(regular, NombreJugador) :-
    obtenerEstadisticas(NombreJugador, _, CantidadDeDobles, CantidadDeInfracciones),
    restricciones(regular, _, CantidadDeDoblesMinimos, CantidadDeInfraccionesMaximas),
    CantidadDeDobles > CantidadDeDoblesMinimos,
    CantidadDeInfracciones < CantidadDeInfraccionesMaximas.

calidadJugador(desastroso, NombreJugador) :-
    obtenerEstadisticas(NombreJugador, _, CantidadDeDobles, CantidadDeInfracciones),
    restricciones(desastroso, _, CantidadDeDoblesMaximos, CantidadDeInfraccionesMinimas),
    CantidadDeDobles < CantidadDeDoblesMaximos,
    CantidadDeInfracciones >= CantidadDeInfraccionesMinimas.