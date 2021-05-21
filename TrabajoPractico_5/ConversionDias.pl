acomodarValoresFechaAJuliano(Mes, MesAcomodado, Anio, AnioAcomodado) :-
    Mes >= 1,
    Mes =< 2,
    /* Si el mes es enero o febrero */
    AnioAcomodado is Anio - 1,
    MesAcomodado is Mes + 12.

acomodarValoresFechaAJuliano(Mes, Mes, Anio, Anio).

fechaADiaJuliano(Dia, Mes, Anio, DiaJuliano) :-
    acomodarValoresFechaAJuliano(Mes, MesAcomodado, Anio, AnioAcomodado),
    A is AnioAcomodado div 100,
    B is A div 4,
    C is 2-A+B,
    E is truncate(365.25*(AnioAcomodado+4716)),
    F is truncate(30.6001*(MesAcomodado+1)),
    DiaJuliano is C+Dia+E+F-1524.5.

obtenerMes(E, Mes) :-
    E - 1 >= 1,
    E - 1 =< 12,
    Mes is E - 1.

obtenerMes(E, Mes) :-
    E - 13 >= 1,
    E - 13 =< 12,
    Mes is E - 13.

obtenerAnio(C, Mes, Anio) :-
    Mes >= 1,
    Mes =< 2,
    Anio is C-4715.

obtenerAnio(C, Mes, Anio) :-
    Mes > 2,
    Anio is C-4716.

acomodarValoresJulianoAFecha(E, C, Mes, Anio) :-
    obtenerMes(E, Mes),
    obtenerAnio(C, Mes, Anio).

diaJulianoAFecha(DiaJuliano, Dia, Mes, Anio) :-
    Q is DiaJuliano + 0.5, 
    Z is truncate(Q),
    W is truncate((Z - 1867216.25)/36524.25),
    X is truncate(W/4),
    A is Z+1+W-X,
    B is A+1524,
    C is truncate((B-122.1)/365.25),
    D is truncate(365.25*C),
    E is truncate((B-D)/30.6001),
    F is truncate(30.6001*E),
    Dia is truncate(B-D-F+(Q-Z)),
    acomodarValoresJulianoAFecha(E, C, Mes, Anio).
    