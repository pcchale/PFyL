/*

Cuantos elementos tiene una lista
Ej: 
[a, b, c, d, e, f]
*/
/*
contarElementos([], 0).

contarElementos([_ | Cola], Resultado) :-
    contarElementos(Cola, ResultadoAcumulado),
    Resultado is ResultadoAcumulado + 1.
*/

/*
obtenerValorSuma(Nota, Resultado) :-
    Nota >= 4,
    Resultado is 1.

obtenerValorSuma(_, Resultado) :-
    Resultado is 0.

contarAprobados([], 0).

contarAprobados([Cabeza | Cola], Resultado) :-
    obtenerValorSuma(Cabeza, ResultadoSuma),
    contarAprobados(Cola, ResultadoCuenta),
    Resultado is ResultadoCuenta + ResultadoSuma.
    
*/


/*
contarAprobados([], 0).

contarAprobados([Cabeza | Cola], Resultado) :-
    Cabeza >= 4,
    contarAprobados(Cola, ResultadoCuenta),
    Resultado is 1 + ResultadoCuenta.
  
contarAprobados([Cabeza | Cola], Resultado) :-
    Cabeza < 4,
    contarAprobados(Cola, ResultadoCuenta),
    Resultado is 0 + ResultadoCuenta.
*/

/*vocalesEn(ListaVocales, Palabra).*/

esVocal(a).
esVocal(e).
esVocal(i).
esVocal(o).
esVocal(u).

/*
vocalesEn([], 0).

vocalesEn([PrimeraLetra | RestoPalabra], CantidadDeVocales) :-
    esVocal(PrimeraLetra),
    vocalesEn(RestoPalabra, CantidadDeVocalesAux),
    CantidadDeVocales is CantidadDeVocalesAux + 1.

vocalesEn([_ | RestoPalabra], CantidadDeVocales) :-
    vocalesEn(RestoPalabra, CantidadDeVocalesAux),
    CantidadDeVocales is CantidadDeVocalesAux + 0.
*/

/*
Este es el unico medio confuso que habria que practicar mas
https://youtu.be/F7HRb2Gc5o0
*/

vocalesEn([], []).

vocalesEn([PrimeraLetra | RestoVocales], [PrimeraLetra | RestoDeLetras]) :-
    esVocal(PrimeraLetra),
    vocalesEn(RestoVocales, RestoDeLetras).

vocalesEn(RestoVocales, [PrimeraLetra | RestoDeLetras]) :-
    not(esVocal(PrimeraLetra)),
    vocalesEn(RestoVocales, RestoDeLetras).
