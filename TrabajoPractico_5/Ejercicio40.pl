/*
Potencia con exponente natural: Escribir la regla de un predicado 
que vincule un número base y otro exponente con la correspondiente potencia.
*/

potencia(Resultado, Base, Exponente) :-
    potenciaAux(1, Base, Exponente, Resultado).

potenciaAux(Acumulador, Base, 0, Acumulador).

potenciaAux(Acumulador, Base, Exponente, Resultado) :-
    Exponente > 0, /* Si no pongo esto, sigue unificando y se queda en un loop */
    ExponenteAux is Exponente - 1,
    AcumuladorAux is Acumulador * Base,
    potenciaAux(AcumuladorAux, Base, ExponenteAux, Resultado).
