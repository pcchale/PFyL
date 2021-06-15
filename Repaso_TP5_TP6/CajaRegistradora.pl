cajaRegistradora(ListaBilletesAux, 0, [], ListaBilletesAux).

cajaRegistradora(ListaBilletes, MontoACobrar, [[MontoBillete, CantidadNecesaria]|RestoListaResultado], ListaBilletesResultado) :-
    obtenerPrimerMenorOIgual(MontoACobrar, ListaBilletes, MontoBillete, Cantidad),
    MontoBillete \= 0,
    CantidadNecesaria is MontoACobrar div MontoBillete,
    CantidadNecesaria =< Cantidad,
    MontoACobrarAux is MontoACobrar - (MontoBillete * CantidadNecesaria),
    decrementar(ListaBilletes, MontoBillete, CantidadNecesaria, ListaBilletesAux),
    cajaRegistradora(ListaBilletesAux, MontoACobrarAux, RestoListaResultado, ListaBilletesResultado).


cajaRegistradora(ListaBilletes, MontoACobrar, [[MontoBillete, Cantidad]|RestoListaResultado], ListaBilletesResultado) :-
    obtenerPrimerMenorOIgual(MontoACobrar, ListaBilletes, MontoBillete, Cantidad),
    MontoBillete \= 0,
    CantidadNecesaria is MontoACobrar div MontoBillete,
    CantidadNecesaria > Cantidad,
    MontoACobrarAux is MontoACobrar - (MontoBillete * Cantidad),
    decrementar(ListaBilletes, MontoBillete, Cantidad, ListaBilletesAux),
    cajaRegistradora(ListaBilletesAux, MontoACobrarAux, RestoListaResultado, ListaBilletesResultado).

obtenerPrimerMenorOIgual(MontoACobrar, ListaBilletes, MontoBillete, Cantidad) :-
    obtenerPrimerMenorOIgualAux(MontoACobrar, ListaBilletes, MontoBillete, Cantidad, 0, 0).

obtenerPrimerMenorOIgualAux(_, [], AcumuladorMonto, AcumuladorCantidad, AcumuladorMonto, AcumuladorCantidad).

obtenerPrimerMenorOIgualAux(MontoACobrar, [[MontoBillete1,_]|_], AcumuladorMonto, AcumuladorCantidad, AcumuladorMonto, AcumuladorCantidad) :-
    MontoBillete1 > MontoACobrar.

obtenerPrimerMenorOIgualAux(MontoACobrar, [[MontoBillete1,CantidadBillete1]|RestoBilletes], ResultadoMonto, ResultadoCantidad, _, _) :-
    MontoBillete1 =< MontoACobrar,
    CantidadBillete1 \= 0,
    obtenerPrimerMenorOIgualAux(MontoACobrar, RestoBilletes, ResultadoMonto, ResultadoCantidad, MontoBillete1, CantidadBillete1).

obtenerPrimerMenorOIgualAux(MontoACobrar, [[MontoBillete1,CantidadBillete1]|RestoBilletes], ResultadoMonto, ResultadoCantidad, AcumuladorMonto, AcumuladorCantidad) :-
    MontoBillete1 =< MontoACobrar,
    CantidadBillete1 =:= 0,
    obtenerPrimerMenorOIgualAux(MontoACobrar, RestoBilletes, ResultadoMonto, ResultadoCantidad, AcumuladorMonto, AcumuladorCantidad).

decrementar([[MontoPrimerBillete, Cantidad]|RestoBilletes], MontoBillete, CantidadUsada, [[MontoPrimerBillete, Cantidad]|RestoListaResultado]) :-
    MontoPrimerBillete \= MontoBillete,
    decrementar(RestoBilletes, MontoBillete, CantidadUsada, RestoListaResultado).

decrementar([[MontoBillete, CantidadActual]|RestoBilletes], MontoBillete, CantidadUsada, [[MontoBillete, NuevaCantidad]|RestoBilletes]) :-
    NuevaCantidad is CantidadActual - CantidadUsada.
