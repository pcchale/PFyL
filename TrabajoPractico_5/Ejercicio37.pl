%partido(EquipoLocal, GolesEquipoLocal, EquipoVisitante, GolesEquipoVisitante).
partido(sacaChispasDeChocolate, 3, locosDelBalon, 2).
partido(sospechososDeNunca, 1, turcosEnLaNeblina, 5).
partido(turcosEnLaNeblina, 2, sacaChispasDeChocolate,2).

partido(locosDelBalon, 2, sospechososDeNunca, 0).
partido(sacaChispasDeChocolate, 2, sospechososDeNunca, 1).
partido(locosDelBalon, 2, turcosEnLaNeblina, 4).

/*
a) Escribir un predicado que relacione a un equipo con los equipos que les haya hecho goles.
*/

leHizoAlgunGol(Equipo1, Equipo2) :-
    /* Equipo1 le hizo algun gol a Equipo2 */
    partido(Equipo1, GolesEquipo1, Equipo2,  _),
    GolesEquipo1 > 0.

leHizoAlgunGol(Equipo1, Equipo2) :-
    /* Equipo1 le hizo algun gol a Equipo2 */
    partido(Equipo2, _, Equipo1, GolesEquipo1),
    GolesEquipo1 > 0.

golesDeVisitante(Equipo1, Equipo2) :-
    leHizoAlgunGol(Equipo1, Equipo2).

/*
b) Escribir un predicado que relaciones 1 equipo con los puntos 
que sacó en el partido frente a otro equipo.
Nota= El que gana se lleva 3 puntos, el empate da 1 punto a cada
 equipo y 0 para el perdedor
*/

obtenerPartido(Equipo1, Equipo2, GolesEquipo1, GolesEquipo2) :-
    partido(Equipo1, GolesEquipo1, Equipo2, GolesEquipo2).

obtenerPartido(Equipo1, Equipo2, GolesEquipo1, GolesEquipo2) :-
    partido(Equipo2, GolesEquipo2, Equipo1, GolesEquipo1).

puntos(Equipo1, Equipo2, 0) :-
    obtenerPartido(Equipo1, Equipo2, GolesEquipo1, GolesEquipo2),
    GolesEquipo2 > GolesEquipo1.

puntos(Equipo1, Equipo2, 1) :-
    obtenerPartido(Equipo1, Equipo2, GolesEquipo1, GolesEquipo2),
    GolesEquipo2 =:= GolesEquipo1.

puntos(Equipo1, Equipo2, 3) :-
    obtenerPartido(Equipo1, Equipo2, GolesEquipo1, GolesEquipo2),
    GolesEquipo2 < GolesEquipo1.

/*
c) Escribir un predicado que relacione a un equipo con los equipos le ganó.
Por Ejemplo:
*/

leGano(Equipo1, Equipo2) :-
    puntos(Equipo1, Equipo2, 3).

/*
d) Escribir un predicado que relacione 2 equipos que hayan jugado un partido que terminó en empate.

*/

empate(Equipo1, Equipo2) :-
    partido(Equipo1, Goles, Equipo2, Goles).

/* Con este entendí un poco mas la complejidad de la unificación */
/*
empate(Equipo1, Equipo2) :-
    puntos(Equipo1, Equipo2, 1).

Esto me devuelve dos veces el mismo resultado pero invertido
Igual que esto

empate(Equipo1, Equipo2) :-
    partido(Equipo1, Goles, Equipo2, Goles).

empate(Equipo1, Equipo2) :-
    partido(Equipo2, Goles, Equipo1, Goles).

*/

