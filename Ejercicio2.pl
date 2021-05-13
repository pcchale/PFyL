%Progenitores de luis
esProgenitorDe(carlos, luis).
esProgenitorDe(susana, luis).

%Progenitores de roberto
esProgenitorDe(carlos, roberto).
esProgenitorDe(susana, roberto).

%Progenitores de amalia
esProgenitorDe(carlos, amalia).
esProgenitorDe(susana, amalia).

%Progenitores de carlos
esProgenitorDe(guillermo, carlos).
esProgenitorDe(ana, carlos).

%Progenitores de la hermana de Calrlos, isabel.
esProgenitorDe(guillermo, isabel).
esProgenitorDe(ana, isabel).

%Progenitores de susana
esProgenitorDe(ernesto, susana).
esProgenitorDe(mercedes, susana).

%Progenitores de angelica
esProgenitorDe(ernesto, angelica).
esProgenitorDe(mercedes, angelica).

%Hijos de luis
esProgenitorDe(luis, fererico).
esProgenitorDe(laura, fererico).

esProgenitorDe(luis, carla).
esProgenitorDe(laura, carla).
%

esVaron(luis).
esVaron(carlos).
esMujer(susana).
esVaron(roberto).
esMujer(amalia).
esMujer(isabel).
esMujer(ana).
esVaron(guillermo).
esMujer(mercedes).
esVaron(ernesto).
esMujer(angelica).
esMujer(laura).
esVaron(federico).
esMujer(carla).

padre(Padre, Hijo) :-
    esProgenitorDe(Padre, Hijo),
    esVaron(Padre).

madre(Madre, Hijo) :-
    esProgenitorDe(Madre, Hijo),
    esMujer(Madre).

esProgenitorDe(Madre, Hijo),
esMujer(Madre).

esPareja(Padre, Madre) :-
padre(Padre, Hijo),
madre(Madre, Hijo).

esHermano(Hijo1, Hijo2) :-
padre(Padre, Hijo1),
madre(Madre, Hijo1),
padre(Padre, Hijo2),
madre(Madre, Hijo2),
Hijo1 \== Hijo2.

esTio(Tio, Sobrino) :-
padre(Padre, Sobrino),
esHermano(Tio, Padre).