/*
Predicado que relaciona una lista de temperaturas con 
la cantidad de temperaturas que se encuentran entre los 10º y los 20º.
*/

cantidadTemperaturasBajas(CantidadTemperaturasBajas, ListaDeTemperaturas) :-
    cantidadTemperaturasBajasAux(CantidadTemperaturasBajas, ListaDeTemperaturas, 0).

cantidadTemperaturasBajasAux(AcumuladorTemperaturasBajas, [], AcumuladorTemperaturasBajas).

cantidadTemperaturasBajasAux(CantidadTemperaturasBajas, 
                            [PrimerTemperatura | RestoTemperaturas], 
                            AcumuladorTemperaturasBajas) :-
    PrimerTemperatura > 10, 
    PrimerTemperatura < 20,
    AcumuladorTemperaturasBajasAux is AcumuladorTemperaturasBajas + 1,
    cantidadTemperaturasBajasAux(CantidadTemperaturasBajas, RestoTemperaturas, AcumuladorTemperaturasBajasAux).


cantidadTemperaturasBajasAux(CantidadTemperaturasBajas, 
                            [PrimerTemperatura | RestoTemperaturas], 
                            AcumuladorTemperaturasBajas) :-
    PrimerTemperatura =< 10,
    cantidadTemperaturasBajasAux(CantidadTemperaturasBajas, RestoTemperaturas, AcumuladorTemperaturasBajas).

cantidadTemperaturasBajasAux(CantidadTemperaturasBajas, 
                            [PrimerTemperatura | RestoTemperaturas], 
                            AcumuladorTemperaturasBajas) :-
    PrimerTemperatura >= 20,
    cantidadTemperaturasBajasAux(CantidadTemperaturasBajas, RestoTemperaturas, AcumuladorTemperaturasBajas).
