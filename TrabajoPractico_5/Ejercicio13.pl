/*
Definir un predicado que vincule las notas de cuatro parciales con la nota promedio.
*/

/* Resuelto de forma horrible */
/*
esPromedioSegun(X, Nota1, Nota2, Nota3, Nota4) :-
    X is (Nota1 + Nota2 + Nota3 + Nota4) / 4.
*/

/* Resuelto con listas*/
/*
esPromedioSegun(X, Notas) :-
    esPromedioSegunAux(X, Notas, 0, 0).

esPromedioSegunAux(X, [], SumaAcumulada, CantidadAcumulada) :-
    X is (SumaAcumulada / CantidadAcumulada).

esPromedioSegunAux(X, [PrimeraNota | RestoNotas], SumaAcumulada, CantidadAcumulada) :-
    NuevaSumaAcumulada is SumaAcumulada + PrimeraNota,
    NuevaCantidadAcumulada is CantidadAcumulada + 1,
    esPromedioSegunAux(X, RestoNotas, NuevaSumaAcumulada, NuevaCantidadAcumulada).
*/
