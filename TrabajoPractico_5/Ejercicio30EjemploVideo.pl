/*
Un vendedor cobra una comisión del 3% sobre sus ventas, pero si vendió más de $ 50000 recibe un 1% más, 
además de un premio fijo de $ 1200. Preparar un predicado que relacione el total vendido con la comisión 
.
*/

comisiones(5, 5000, 1000000, _).

comisiones(4, 1200, 5000, X) :-
    X =< 999999.

comisiones(3, 0, 0, X) :-
    X =< 4999. 

%Esa X es el valor de corte para que ya no unifique si el valor de ventas está en un valor mayor


comisionACobrar(Comision, Ventas) :-
    comisiones(Porcentaje, Premio, VentasMinimas, Ventas),
    Ventas > VentasMinimas,
    Comision is Premio + (Ventas * Porcentaje / 100).
