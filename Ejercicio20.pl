perro(colita).
humano(juan).

gato(kira).

mortal(SerVivo) :-
    perro(SerVivo).

mortal(SerVivo) :-
    humano(SerVivo).

mortal(SerVivo) :-
    gato(SerVivo).