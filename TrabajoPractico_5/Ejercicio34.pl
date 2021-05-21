/*
DJ = ENT( 365.25 * AP) + ENT( 30.6001 * MP ) + DIA + 1720982
Para MES 1 o 2 :
                                     AP = AÑO - 1
                                     MP = MES + 13

 Para MES > 2:
                                     AP = AÑO
                                     MP = MES + 1

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