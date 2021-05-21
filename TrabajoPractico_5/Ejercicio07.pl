perro(colita).

%Todos los perros son animales
animal(SerVivo) :-
    perro(SerVivo).

%Todos los animales son mortales
mortal(SerVivo) :-
    animal(SerVivo).

%Query: mortal(colita) -> True.