
edadMellizos(Edad, Edad, Edad, Edad).

edadMellizos(Edad, Edad, Edad3, Edad) :-
    Edad > Edad3.

edadMellizos(Edad, Edad, Edad3, Edad3) :-
    Edad3 > Edad.


edadMellizos(Edad1, Edad2, Edad3, Resultado) :-
    Edad1 \= Edad2,
    edadMellizos(Edad2, Edad3, Edad1, Resultado).