esposos(camila, agustin).
hermanos(agustin, lourdes).
hermanos(camila, enzo).


esPareja(Pareja, Persona) :-
    esposos(Persona, Pareja).

esPareja(Pareja, Persona) :-
    esposos(Pareja, Persona).

sonHermanos(Hermano1, Hermano2) :-
    hermanos(Hermano1, Hermano2).

sonHermanos(Hermano1, Hermano2) :-
    hermanos(Hermano2, Hermano1).


concuniado(Concuniado, Persona) :-
    sonHermanos(Concuniado, HermanoConcuniado),
    sonHermanos(Persona, HermanoPersona),
    esPareja(HermanoConcuniado, HermanoPersona).
