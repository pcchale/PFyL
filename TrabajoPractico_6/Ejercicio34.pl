/*
Escribir una función que dada una lista de temperaturas en distintas 
ciudades del país retorne una lista de pares ordenados que relacione 
la cantidad de ciudades que cumplen con cada una de las clasificaciones. A saber:
Helado: Hasta 0º
Frio: Más de 0º y menos de 10º
Templado: Más de 10º y hasta 25º
Cálido: Más de 25º
*/

clasificaciones(calido, 25, _).
clasificaciones(templado, 10, 25).
clasificaciones(frio, 0, 10).
clasificaciones(helado, _, 0).

clasifica(Temperaturas, ListaResultado) :-
    clasificaAux(Temperaturas, [[helado, 0], [frio, 0], [templado, 0], [calido, 0]], ListaResultado).

clasificaAux([], Clasificaciones, Clasificaciones).

clasificaAux([PrimerTemperatura|RestoTemperaturas], Clasificaciones, ListaResultado) :-
    clasificarTemperatura(PrimerTemperatura, Clasificacion),
    incrementarClasificacion(Clasificacion, Clasificaciones, ClasificacionesAux),
    clasificaAux(RestoTemperaturas, ClasificacionesAux, ListaResultado).


clasificarTemperatura(Temperatura, helado) :-
    clasificaciones(helado, _, TemperaturaHasta),
    Temperatura =< TemperaturaHasta.

clasificarTemperatura(Temperatura, frio) :-
    clasificaciones(frio, TemperaturaDesde, TemperaturaHasta),
    Temperatura > TemperaturaDesde,
    Temperatura =< TemperaturaHasta.

clasificarTemperatura(Temperatura, templado) :-
    clasificaciones(templado, TemperaturaDesde, TemperaturaHasta),
    Temperatura > TemperaturaDesde,
    Temperatura =< TemperaturaHasta.

clasificarTemperatura(Temperatura, calido) :-
    clasificaciones(calido, TemperaturaDesde, _),
    Temperatura > TemperaturaDesde.

incrementarClasificacion(_, [], []).

incrementarClasificacion(Clasificacion, [[Clasificacion, Contador]|RestoClasificaciones], [[Clasificacion, ContadorAux]|RestoListaResultado]) :-
    ContadorAux is Contador + 1,
    incrementarClasificacion(Clasificacion, RestoClasificaciones, RestoListaResultado).

incrementarClasificacion(Clasificacion, [[PrimeraClasificacion, Contador]|RestoClasificaciones], [[PrimeraClasificacion, Contador]|RestoListaResultado]) :-
    PrimeraClasificacion \= Clasificacion,
    incrementarClasificacion(Clasificacion, RestoClasificaciones, RestoListaResultado).

