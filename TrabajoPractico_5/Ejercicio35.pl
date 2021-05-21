/*
La cantidad de días entre dos fechas es igual a la diferencia entre los respectivos días julianos. 
Preparar un predicado que 
relacione dos fechas con la cantidad de días transcurridos entre ambas.
*/

obtenerAPyMP(Mes, Anio, AP, MP) :-
    Mes =< 2,
    AP is Anio - 1,
    MP is Mes + 13.


obtenerAPyMP(Mes, Anio, AP, MP) :-
    Mes > 2,
    AP is Anio,
    MP is Mes + 1.

diaJuliano(DiaJuliano, Dia, Mes, Anio) :-
    obtenerAPyMP(Mes, Anio, AP, MP),
    DiaJuliano is 1720982 +
                  Dia + 
                  integer(365.25 * AP) + 
                  integer(30.6001 * MP).


diferenciaEntreDias(DiasDeDiferencia, Dia1, Mes1, Anio1, Dia2, Mes2, Anio2) :-
    diaJuliano(DiaJulianoFecha1, Dia1, Mes1, Anio1),
    diaJuliano(DiaJulianoFecha2, Dia2, Mes2, Anio2),
    DiasDeDiferencia is DiaJulianoFecha2 - DiaJulianoFecha1.

