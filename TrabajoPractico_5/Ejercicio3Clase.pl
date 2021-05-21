%Ejercicio 1
es(oro, valioso).
esValiso(oro).

mujer(isabel).
mujer(carla).
mujer(marina).

%Ejercicio 2

esVaron(luis).
esVaron(carlos).
esVaron(roberto).
esVaron(luis).
esVaron(guillermo).
esVaron(ernesto).
esVaron(federico).

esMujer(susana).
esMujer(amalia).
esMujer(isabel).
esMujer(ana).
esMujer(mercedes).
esMujer(laura).
esMujer(carla).

padre(Padre, Hijo) :-
    esProgenitorDe(Padre, Hijo),
    esVaron(Padre).

esProgenitorDe(carlos, luis).
esProgenitorDe(susana, luis).
esProgenitorDe(carlos, amalia).
esProgenitorDe(susana, amalia).
esProgenitorDe(carlos, roberto).
esProgenitorDe(susana, roberto).
esProgenitorDe(ana, carlos).
esProgenitorDe(guillermo, carlos).
esProgenitorDe(ana, isabel).
esProgenitorDe(guillermo, isabel).


madre(Madre, Hijo) :-
    esProgenitorDe(Madre, Hijo),
    esMujer(Madre).

esPareja(Padre, Madre) :-
    padre(Padre, Hijo),
    madre(Madre, Hijo).

esHermano(Persona1, Persona2) :-
    padre(Padre, Persona1),
    padre(Padre, Persona2),
    Persona1 \= Persona2.

esHermano(Persona1, Persona2) :-
    madre(Madre, Persona1),
    madre(Madre, Persona2),
    Persona1 \= Persona2.


esMedioHermano(Hijo1, Hijo2) :-
    padre(Padre, Hijo1),
    padre(Padre, Hijo2),
    madre(Madre1, Hijo1),
    madre(Madre2, Hijo2),
    Hijo1 \= Hijo2,
    Madre1 \= Madre2.

esMedioHermano(Hijo1, Hijo2) :-
    madre(Madre, Hijo1),
    madre(Madre, Hijo2),
    padre(Padre1, Hijo1),
    padre(Padre2, Hijo2),
    Padre1 \= Padre2, 
    Hijo1 \= Hijo2.



esTio(Tio, Sobrino) :-
    padre(Padre, Sobrino),
    esHermano(Tio, Padre).