/*
En un grupo de tres personas hay un joven y dos viejos. 
Construir un predicado que relacione las tres edades con la edad del joven.
*/

esMenorEdad(Edad, Edad1, Edad2) :-
    Edad < Edad1,
    Edad < Edad2.

edadJoven(Edad1, Edad1, Edad2, Edad3) :-
    esMenorEdad(Edad1, Edad2, Edad3).

edadJoven(Edad2, Edad1, Edad2, Edad3) :-
    esMenorEdad(Edad2, Edad1, Edad3).

edadJoven(Edad3, Edad1, Edad2, Edad3) :-
    esMenorEdad(Edad3, Edad1, Edad2).


/*
edadJoven(Edad1, Edad1, Edad2, Edad3) :-
    Edad1 =:= Edad2,
    Edad2 =:= Edad3.
*/