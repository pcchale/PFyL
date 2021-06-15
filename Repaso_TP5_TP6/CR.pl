/*Dado un predicado en el que se indica la cantidad de billetes que posee la caja registradora, 
indicar, para cobrar un monto determinado, cuantos billetes otorgar de cada uno, 
intentando perder la menor cantidad de cambio posible.

cajaRegistradora([CantidadBilletes5Pesos, CantidadBilletes10Pesos, CantidadBilletes20Pesos, CantidadBilletes50Pesos, 
	CantidadBilletes100Pesos, CantidadBilletes200Pesos, CantidadBilletes1000Pesos], MontoACobrar, ListaResultado)
*/

valorBillete(7, 1000).
valorBillete(6, 200).
valorBillete(5, 100).
valorBillete(4, 50).
valorBillete(3, 20).
valorBillete(2, 10).
valorBillete(1, 5).

quitarultimoelemento([_], []).
quitarultimoelemento([Cab|Cola], [Cab| SinUltimo]):- 
	quitarultimoelemento(Cola, SinUltimo).


ultimo([U], U).
ultimo([_|Cola], U):- 
	ultimo(Cola, U).

%Caja registradora sin dinero
cajaRegistradora2([], _, 0, []).

%Caja registradora con billetes suficientes por valor monetario
cajaRegistradora2(ListaBilletes, MontoACobrar, N, ListaResultado):-
	N >= 1,
	MontoACobrar > 0,
	valorBillete(N, ValorMonetario),
	CantBilletes is MontoACobrar // ValorMonetario,
	CantBilletes >= 1,
	ultimo(ListaBilletes, U),
	U >= CantBilletes,
	MontoACobrar1 is MontoACobrar - ValorMonetario*CantBilletes,
	quitarultimoelemento(ListaBilletes, ListaBilletesSinUltimo),
	N1 is N - 1,
%	append(CantBilletes, [ListaResultado2], [ListaResultado]),
	cajaRegistradora2(ListaBilletesSinUltimo, MontoACobrar1, N1, [CantBilletes | ListaResultado]).

%caja registradora sin billetes suficientes por valor monetario
cajaRegistradora2(ListaBilletes, MontoACobrar, N, ListaResultado):-
	N >= 1,
	MontoACobrar > 0,
	valorBillete(N, ValorMonetario),
	CantBilletes is MontoACobrar // ValorMonetario,
	CantBilletes >= 1,
	ultimo(ListaBilletes, U),
	U < CantBilletes,
	quitarultimoelemento(ListaBilletes, ListaBilletesSinUltimo),
	N1 is N - 1,
	append(0, [ListaResultado2], [ListaResultado]),
	cajaRegistradora2(ListaBilletesSinUltimo, MontoACobrar, N1, ListaResultado2).
	
%caja registradora en billete de valor monetario mayor a lo necesitado
cajaRegistradora2(ListaBilletes, MontoACobrar, N, ListaResultado):-
	N >= 1,
	MontoACobrar > 0,
	valorBillete(N, ValorMonetario),
	CantBilletes is MontoACobrar // ValorMonetario,
	CantBilletes < 1,
	%ultimo(ListaBilletes, U),
	%U < CantBilletes,
	%MontoACobrar1 is MontoACobrar,
	quitarultimoelemento(ListaBilletes, ListaBilletesSinUltimo),
	N1 is N - 1,
	append(CantBilletes, [ListaResultado2], [ListaResultado]),
	cajaRegistradora2(ListaBilletesSinUltimo, MontoACobrar, N1, ListaResultado2).
	%append(CantBilletes, ListaResultado2, ListaResultado).


cajaRegistradora([],_, []).

cajaRegistradora(ListaBilletes, MontoACobrar, ListaResultado):-
	cajaRegistradora2(ListaBilletes, MontoACobrar, 7, ListaResultado).
	%append(ListaResultado, Resultado).

obtenerCantidadBilletes(ListaBilletes, Indice, Resultado) :-
    obtenerCantidadBilletesAux(ListaBilletes, Indice, Resultado, 0).

obtenerCantidadBilletesAux([CantidadBilletes|_], IndiceAcumulado, CantidadBilletes, IndiceAcumulado).

obtenerCantidadBilletesAux([_|RestoBilletes], Indice, Resultado, IndiceAcumulado) :-
    Indice \= IndiceAcumulado,
    IndiceAcumuladoAux is IndiceAcumulado + 1,
    obtenerCantidadBilletesAux(RestoBilletes, Indice, Resultado, IndiceAcumulado).