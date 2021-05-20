/*
Escribir un algoritmo que permita convertir una magnitud expresada en 
una unidad de medida de longitud en la correspondiente en otra unidad de medida. 
Por ejemplo en prolog el predicado sería: 
convertir(ValorOrigen, UnidadOrigen, Resultado, UnidadDestino).
?- convertir(30,cm, X, m).
   X = 0,3.
Las unidades a contemplar son: mm, cm, dm, m

*/

/* Mi version, lo de clase no se me hubiera ocurrido. */

unidad(mm, 1).
unidad(cm, 10).
unidad(dm, 100).
unidad(m, 1000).

convertir(ValorOrigen, UnidadOrigen, Resultado, UnidadDestino) :-
    unidad(UnidadOrigen, ValorConversionAMM),
    unidad(UnidadDestino, ValorConversionAUnidadDestino),
    Resultado is (ValorOrigen * ValorConversionAMM) / ValorConversionAUnidadDestino.

/*

% Primero paso el valor origen a milimetros
% Despues obtengo el valor de conversion de Milimetros a la Unidad Destino
% Finalmente divido el valor en milimetros por el valor de conversion  a la Unidad Destino.


obtenerFactor(Factor, UnidadOrigen, UnidadDestino) :-
    UnidadOrigen = mm,
    UnidadDestino = cm,
    Factor is 10.

obtenerFactor(Factor, UnidadOrigen, UnidadDestino) :-
    UnidadOrigen = mm,
    UnidadDestino = dm,
    Factor is 100.

obtenerFactor(Factor, UnidadOrigen, UnidadDestino) :-
    UnidadOrigen = mm,
    UnidadDestino = dm,
    Factor is 100.
%convertir(ValorOrigen, UnidadOrigen, Resultado, UnidadDestino) :-


% Version intuitiva posiblemente horrible

convertir(ValorCm, cm, ValorM, m) :-
    ValorM is ValorCm / 100.

convertir(ValorM, m, ValorCm, cm) :-
    ValorCm is ValorM * 100.

% cm mm
% mm cm
% cm dm
% dm cm

% mm dm
% dm mm
% mm m
% m mm

% ...

% Query: convertir(30, cm, X, m).*/