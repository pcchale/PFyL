/*
Escribir un predicado que relacione una hora dada en horas, 
minutos y segundos con la hora será un segundo después.
*/

incrementarSegundos(Hora, Minutos, SegundosResultantes, Hora, Minutos, Segundos) :-
    Segundos < 59,
    SegundosResultantes is Segundos + 1.

incrementarSegundos(HoraResultante, MinutosResultantes, SegundosResultantes, Hora, Minutos, Segundos) :-
    Segundos =:= 59,
    SegundosResultantes is 0,
    incrementarMinutos(HoraResultante, MinutosResultantes, Hora, Minutos).

incrementarMinutos(Hora, MinutosResultantes, Hora, Minutos) :-
    Minutos < 59,
    MinutosResultantes is Minutos + 1.

incrementarMinutos(HoraResultante, MinutosResultantes, Hora, Minutos) :-
    Minutos =:= 59,
    MinutosResultantes is 0,
    incrementarHora(HoraResultante, Hora).

incrementarHora(HoraResultante, Hora) :-
    Hora < 24,
    HoraResultante is Hora + 1.

incrementarHora(HoraResultante, Hora) :-
    Hora =:= 24,
    HoraResultante is 0.

siguienteSegundo(SiguienteHora, SiguientesMinutos, SiguientesSegundos, Hora, Minutos, Segundos) :-
    incrementarSegundos(SiguienteHora, SiguientesMinutos, SiguientesSegundos, Hora, Minutos, Segundos).