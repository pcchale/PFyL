puntos([N, N, N, N, N], 60).

puntos([N, N, N, N, _], 40).

puntos([_, N, N, N, N], 40).

puntos([N1, N1, N1, N2, N2], 30).

puntos([N2, N2, N1, N1, N1], 30).

puntos([1, 2, 3, 4, 5], 20).

puntos([2, 3, 4, 5, 6], 20).

puntos(Lista, Puntos) :-
    puntosAux(Lista, Lista, Puntos, 0).

puntosAux(_, [], PuntosAcumulados, PuntosAcumulados).

puntosAux(ListaCompleta, [PrimerElemento|RestoElementos], Puntos, PuntosAcumulados) :-
    cantidadRepeticiones(PrimerElemento, Repeticiones, ListaCompleta),
    PuntosAux is PrimerElemento * Repeticiones,
    PuntosAux > PuntosAcumulados,
    puntosAux(ListaCompleta, RestoElementos, Puntos, PuntosAux).


puntosAux(ListaCompleta, [PrimerElemento|RestoElementos], Puntos, PuntosAcumulados) :-
    cantidadRepeticiones(PrimerElemento, Repeticiones, ListaCompleta),
    PuntosAux is PrimerElemento * Repeticiones,
    PuntosAux =< PuntosAcumulados,
    puntosAux(ListaCompleta, RestoElementos, Puntos, PuntosAcumulados).

cantidadRepeticiones(Numero, CantidadRepeticiones, Lista) :-
    cantidadRepeticionesAux(Numero, CantidadRepeticiones, Lista, 0).

cantidadRepeticionesAux(_, CantidadRepeticionesActuales, [], CantidadRepeticionesActuales).

cantidadRepeticionesAux(Numero, CantidadRepeticiones, [Numero|RestoElementos], CantidadRepeticionesActuales) :-
    CantidadRepeticionesActualesAux is CantidadRepeticionesActuales + 1,
    cantidadRepeticionesAux(Numero, CantidadRepeticiones, RestoElementos, CantidadRepeticionesActualesAux).

cantidadRepeticionesAux(Numero, CantidadRepeticiones, [PrimerElemento|RestoElementos], CantidadRepeticionesActuales) :-
    Numero \= PrimerElemento,
    cantidadRepeticionesAux(Numero, CantidadRepeticiones, RestoElementos, CantidadRepeticionesActuales).

generalaPFyL([NombreJugador1, DadosJugador1], [_, DadosJugador2], NombreJugador1) :-
    puntos(DadosJugador1, PuntosJugador1),
    puntos(DadosJugador2, PuntosJugador2),
    PuntosJugador1 > PuntosJugador2.


generalaPFyL([_, DadosJugador1], [NombreJugador2, DadosJugador2], NombreJugador2) :-
    puntos(DadosJugador1, PuntosJugador1),
    puntos(DadosJugador2, PuntosJugador2),
    PuntosJugador1 < PuntosJugador2.


generalaPFyL([_, DadosJugador1], [_, DadosJugador2], empate) :-
    puntos(DadosJugador1, PuntosJugador1),
    puntos(DadosJugador2, PuntosJugador2),
    PuntosJugador1 =:= PuntosJugador2.

% mayor([Mayor|RestoLista], Resultado) :-
%     mayorAux(Mayor, Resultado, RestoLista).

% mayorAux(Resultado, Resultado, []).

% mayorAux(Mayor, Resultado, [PrimerElementoLista|RestoLista]) :-
%     PrimerElementoLista > Mayor,
%     mayorAux(PrimerElementoLista, Resultado, RestoLista).


% mayorAux(Mayor, Resultado, [PrimerElementoLista|RestoLista]) :-
%     PrimerElementoLista =< Mayor,
%     mayorAux(Mayor, Resultado, RestoLista).
