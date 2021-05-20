progenitorDe(oveja, agustin).
progenitorDe(alberto, oveja).
progenitorDe(leon, alberto).
progenitorDe(tigre, leon).
progenitorDe(hipopotamo, tigre).
progenitorDe(jirafa, hipopotamo).
progenitorDe(alex, jirafa).
progenitorDe(productor, alex).
progenitorDe(maquina, productor).


ancestroDe(Ancestro, Persona2) :-
    progenitorDe(Ancestro, Persona2).

ancestroDe(Ancestro, Persona2) :-
    progenitorDe(Ancestro, X),
    ancestroDe(X, Persona2).



%ancestroDe(maquina, agustin). %???