/*
En un grupo de tres personas hay dos mellizos, 
el restante es mucho más viejo. Preparar un predicado 
que relacione las tres edades con la edad de los mellizos.

*/

sonLaMismaEdad(Edad1, Edad2) :-
    Edad1 =:= Edad2.

edadMellizos(Edad1, Edad1, Edad2, _) :-
    sonLaMismaEdad(Edad1, Edad2).

edadMellizos(Edad2, _, Edad2, Edad3) :-
    sonLaMismaEdad(Edad2, Edad3).