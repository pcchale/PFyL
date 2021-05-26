/*
Predicado que vincula un número en notación romana, tal que los
 caracteres romanos son elementos de una lista L1, con el mismo número en notación arábiga.
*/

valores(m, 1000).
valores(c, 100).
valores(x, 10).
valores(i, 1).
valores(v, 5).

arabigo(ListaNumerosRomanos, NumeroResultado) :-
    arabigoAux(ListaNumerosRomanos, NumeroResultado, 0).

arabigoAux([], NumeroResultado, NumeroResultado).

arabigoAux([Numero], NumeroResultado, Acumulador) :-
    valores(Numero, ValorNumero),
    NumeroResultado is Acumulador + ValorNumero.

arabigoAux([PrimerNumeroRomano | [SegundoNumeroRomano | RestoNumerosRomanos]], NumeroResultado, Acumulador) :-
    valores(PrimerNumeroRomano, ValorPrimerNumeroRomano),
    valores(SegundoNumeroRomano, ValorSegundoNumeroRomano),
    ValorPrimerNumeroRomano >= ValorSegundoNumeroRomano,
    AcumuladorAux is Acumulador + ValorPrimerNumeroRomano,
    arabigoAux([SegundoNumeroRomano | RestoNumerosRomanos], NumeroResultado, AcumuladorAux).


arabigoAux([PrimerNumeroRomano | [SegundoNumeroRomano | RestoNumerosRomanos]], NumeroResultado, Acumulador) :-
    valores(PrimerNumeroRomano, ValorPrimerNumeroRomano),
    valores(SegundoNumeroRomano, ValorSegundoNumeroRomano),
    ValorPrimerNumeroRomano < ValorSegundoNumeroRomano,
    AcumuladorAux is Acumulador + (ValorSegundoNumeroRomano - ValorPrimerNumeroRomano) ,
    arabigoAux(RestoNumerosRomanos, NumeroResultado, AcumuladorAux).