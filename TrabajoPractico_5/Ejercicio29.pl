/*
Desarrollar un predicado ternario 
cuyos sujetos representan las longitudes
 de tres segmentos, y que sea verdadero 
 si estos tres segmentos forman triángulo. 
 Recordar que la suma de las longitudes de 
 dos lados cualesquiera de un triángulo siempre 
 debe ser mayor que la longitud del restante.

*/

esMayorASumaDe(Lado1, Lado2, Lado3) :-
    Lado1 > Lado2 + Lado3.

esTriangulo(Lado1, Lado2, Lado3) :-
    esMayorASumaDe(Lado1, Lado2, Lado3).

esTriangulo(Lado1, Lado2, Lado3) :-
    esMayorASumaDe(Lado2, Lado1, Lado3).

esTriangulo(Lado1, Lado2, Lado3) :-
    esMayorASumaDe(Lado3, Lado2, Lado1).