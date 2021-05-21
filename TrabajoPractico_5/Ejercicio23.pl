/*
Escribir una regla para "cuñado_de" dada una base como:
esposos(ana, luis).
...
hermanos(maria, juan).

*/

esposos(camila, agustin).
hermanos(agustin, lourdes).
hermanos(agustin, catalina).

esPareja(Pareja, Persona) :-
    esposos(Persona, Pareja).

esPareja(Pareja, Persona) :-
    esposos(Pareja, Persona).

sonHermanos(Hermano1, Hermano2) :-
    hermanos(Hermano1, Hermano2).

sonHermanos(Hermano1, Hermano2) :-
    hermanos(Hermano2, Hermano1).

cuniadoDe(Cuniado, Persona) :-
    esPareja(ParejaCuniado, Cuniado),
    sonHermanos(ParejaCuniado, Persona).


