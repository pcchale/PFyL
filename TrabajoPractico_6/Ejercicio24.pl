puntaje(puntito, 1).
puntaje(frutilla, 10).
puntaje(banana, 30).
puntaje(cerezas, 50).
puntaje(fantasma, 100).

bonus(2, 5).

puntajePacman(ListaCosas, Puntaje) :-
    puntajePacmanAux(ListaCosas, Puntaje, 0, 0).

puntajePacmanAux([], PuntajeAcumulado, PuntajeAcumulado, _).

puntajePacmanAux([bonus | RestoDeCosas], Puntaje, PuntajeAcumulado, BonusRestante) :-
    bonus(_, CantidadTurnos),
    BonusRestanteAux is BonusRestante + CantidadTurnos,
    puntajePacmanAux(RestoDeCosas, Puntaje, PuntajeAcumulado, BonusRestanteAux).


puntajePacmanAux([PrimeraCosa | RestoDeCosas], Puntaje, PuntajeAcumulado, 0) :-
    PrimeraCosa \= bonus,
    puntaje(PrimeraCosa, PuntajeCosa),
    PuntajeAcumuladoAux is PuntajeAcumulado + PuntajeCosa,
    puntajePacmanAux(RestoDeCosas, Puntaje, PuntajeAcumuladoAux, 0).

puntajePacmanAux([PrimeraCosa | RestoDeCosas], Puntaje, PuntajeAcumulado, BonusRestante) :-
    PrimeraCosa \= bonus,
    BonusRestante =\= 0,
    puntaje(PrimeraCosa, PuntajeCosa),
    BonusRestanteAux is BonusRestante - 1,
    bonus(Multiplicador, _),
    PuntajeAcumuladoAux is PuntajeAcumulado + (PuntajeCosa * Multiplicador),
    puntajePacmanAux(RestoDeCosas, Puntaje, PuntajeAcumuladoAux, BonusRestanteAux).