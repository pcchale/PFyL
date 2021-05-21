/*
Un vendedor cobra una comisión del 3% sobre sus ventas, pero si vendió más de $ 50000 recibe un 1% más, 
además de un premio fijo de $ 1200. Preparar un predicado que relacione el total vendido con la comisión 
.
*/

%Ojo con el orden en que defino estas constatnes, como analiza top-down, puede ser que unifique antes 
%Con una constante que no es la que yo quiero.
%(Este no es el caso, porque las identifico con una palabra.)

comision(inicial, 3).
comision(premio, 4).
montoPremio(1200).

esComisionACobrarSegun(Comision, TotalVendido) :-
    TotalVendido =< 50000,
    comision(inicial, ComisionInicial),
    Comision is (ComisionInicial * TotalVendido) / 100.


esComisionACobrarSegun(Comision, TotalVendido) :-
    TotalVendido > 50000,
    comision(premio, ComisionPremio),
    montoPremio(MontoPremio),
    Comision is (ComisionPremio * TotalVendido) / 100 + MontoPremio.