/***************/
/* Ejercicio 1 */
/***************/

/* Escribir un predicado y la base de hechos necesaria que permitan 
conocer el costo de un viaje a partir del costo del transporte y 
alojamiento (considerando el número de días de alojamiento). 
Cada destino tiene un costo de transporte, a saber: 
Bariloche $5000, Salta $7000, Mar del Plata $3500. 
El turista puede alojarse en hotel, cabaña o camping, el costo está 
dado por noche: hotel en Bariloche 800, cabaña en Bariloche 1400, 
camping en Bariloche 1350; hotel en Salta $2800, cabaña en Salta 3200, 
camping en Salta 12500, hotel en Mar del Plata 3500, cabaña en Mar del 
Plata 2900, camping en Mar del Plata 1500. 

?- costoViaje(4,bariloche,hotel,Costo).
		Costo = 8200
*/

costoTransporte(bariloche, 5000).
costoTransporte(salta, 7000).
costoTransporte(marDelPlata, 3500).

costoAlojamiento(bariloche,hotel, 800).
costoAlojamiento(bariloche,cabana, 1400).
costoAlojamiento(bariloche,camping, 1350).

costoAlojamiento(salta,hotel, 2800).
costoAlojamiento(salta,cabana, 3200).
costoAlojamiento(salta,camping, 12500).

costoAlojamiento(marDelPlata,hotel, 3500).
costoAlojamiento(marDelPlata,cabana, 2900).
costoAlojamiento(marDelPlata,camping, 1500).


costoViaje(Dias, Destino, Alojamiento, Costo) :-
	costoTransporte(Destino,CT),
	costoAlojamiento(Destino,Alojamiento,CA),
	Costo is CT + Dias * CA.


/***************/
/* Ejercicio 2 */
/***************/

/*Escribir un conjunto de predicados para poder jugar al truco.

Debe contestar si la carta corresponde a un maso de cartas españolas.
 ?- cartaValida(1, espada).
 true.
*/

paloCarta(espada).
paloCarta(oro).
paloCarta(basto).
paloCarta(copa).

valorCarta(1,1).
valorCarta(2,2).
valorCarta(3,3).
valorCarta(4,4).
valorCarta(5,5).
valorCarta(6,6).
valorCarta(7,7).
valorCarta(sota,0).
valorCarta(caballo,0).
valorCarta(rey,0).

cartaValida(Valor,Palo) :-
		valorCarta(Valor,_),
		paloCarta(Palo).

cartasDistintas(ValorCarta1,PaloCarta,ValorCarta2,PaloCarta) :-
	ValorCarta1 \= ValorCarta2.

cartasDistintas(_,PaloCarta1,_,PaloCarta2) :-
	PaloCarta1 \= PaloCarta2.

manoValida(ValorCarta1,PaloCarta1,ValorCarta2,PaloCarta2,ValorCarta3, PaloCarta3) :-
	cartaValida(ValorCarta1, PaloCarta1),
	cartaValida(ValorCarta2, PaloCarta2),
	cartaValida(ValorCarta3, PaloCarta3),
	cartasDistintas(ValorCarta1,PaloCarta1,ValorCarta2,PaloCarta2),
	cartasDistintas(ValorCarta1,PaloCarta1,ValorCarta3,PaloCarta3),
	cartasDistintas(ValorCarta2,PaloCarta2,ValorCarta3,PaloCarta3).

/*Debe contestar si es flor.
 ?-  flor(1,espada,7,espada,caballo,espada).
  true.

 ?-  flor(1,espada,caballo,espada,caballo,espada).
  false.
 
?-  flor(1,espada,caballo,basto,caballo,espada).
  false.
*/

flor(ValorCarta1,PaloCarta,ValorCarta2,PaloCarta,ValorCarta3, PaloCarta) :-
	manoValida(ValorCarta1,PaloCarta,ValorCarta2,PaloCarta,ValorCarta3, PaloCarta).

/*Debe calcular cuanto tiene para el envido.
 ?-  envido(1,espada,7,espada,caballo,espada,Tanto).
  Tanto = 28.

 ?-  envido(1,espada,caballo,espada,caballo,espada, Tanto).
  false.
 
?-  envido(1,espada,caballo,basto,caballo,espada, Tanto).
    Tanto = 21.
*/


/*Predicados Auxiliares */
mayor(A, B, A) :-
	A > B.

mayor(_,B,B).

mayor(A,B,C,R) :-
	mayor(A,B,M),
	mayor(M,C,R).

menor(A, B, A) :-
	A < B.

menor(_,B,B).

menor(A,B,C,R) :-
	menor(A,B,M),
	menor(M,C,R).

dosMayores(A,B,C,A,B) :-
	menor(A,B,C,C).

dosMayores(A,B,C,A,C) :-
	menor(A,B,C,B).

dosMayores(_,B,C,B,C).

/* Envido */

envido(ValorCarta1,PaloCarta,ValorCarta2,PaloCarta,ValorCarta3, PaloCarta, Tanto) :-
	manoValida(ValorCarta1,PaloCarta,ValorCarta2,PaloCarta,ValorCarta3, PaloCarta),
	valorCarta(ValorCarta1, TantoCarta1),
	valorCarta(ValorCarta2, TantoCarta2),
	valorCarta(ValorCarta3, TantoCarta3),
	dosMayores(TantoCarta1, TantoCarta2, TantoCarta3, Mayor1, Mayor2),
	Tanto is Mayor1 + Mayor2 + 20.

envido(ValorCarta1,PaloCarta,ValorCarta2,PaloCarta,ValorCarta3, PaloCarta3, Tanto) :-
	manoValida(ValorCarta1,PaloCarta,ValorCarta2,PaloCarta,ValorCarta3, PaloCarta3),
	valorCarta(ValorCarta1, TantoCarta1),
	valorCarta(ValorCarta2, TantoCarta2),
	PaloCarta \= PaloCarta3,
	Tanto is TantoCarta1 + TantoCarta2 + 20.

envido(ValorCarta1,PaloCarta1,ValorCarta2,PaloCarta,ValorCarta3, PaloCarta, Tanto) :-
	manoValida(ValorCarta1,PaloCarta1,ValorCarta2,PaloCarta,ValorCarta3, PaloCarta),
	valorCarta(ValorCarta2, TantoCarta2),
	valorCarta(ValorCarta3, TantoCarta3),
	PaloCarta \= PaloCarta1,
	Tanto is TantoCarta2 + TantoCarta3 + 20.

envido(ValorCarta1,PaloCarta,ValorCarta2,PaloCarta2,ValorCarta3, PaloCarta, Tanto) :-
	manoValida(ValorCarta1,PaloCarta,ValorCarta2,PaloCarta2,ValorCarta3, PaloCarta),
	valorCarta(ValorCarta1, TantoCarta1),
	valorCarta(ValorCarta3, TantoCarta3),
	PaloCarta \= PaloCarta2,
	Tanto is TantoCarta1 + TantoCarta3 + 20.

envido(ValorCarta1,PaloCarta1,ValorCarta2,PaloCarta2,ValorCarta3, PaloCarta3, Tanto) :-
	manoValida(ValorCarta1,PaloCarta1,ValorCarta2,PaloCarta2,ValorCarta3, PaloCarta3),
	valorCarta(ValorCarta1, TantoCarta1),
	valorCarta(ValorCarta2, TantoCarta2),
	valorCarta(ValorCarta3, TantoCarta3),
	PaloCarta1 \= PaloCarta2,
	PaloCarta1 \= PaloCarta3,
	PaloCarta2 \= PaloCarta3,
	mayor(TantoCarta1, TantoCarta2, TantoCarta3, Tanto).

/*Debe calcular si se va al maso porque tiene 3 cartas malas de sota 
para abajo (4, 5, 6 , 7 falso o sota) y tiene menos de 20 para el envido.
?- meVoyAlMaso(1,espada,caballo,basto,caballo,espada).
	false.

?- meVoyAlMaso(4,espada,7,basto,sota,oro).
	true.
*/

cartaMala(4,_).
cartaMala(5,_).
cartaMala(6,_).
cartaMala(7,copa).
cartaMala(7,basto).
cartaMala(sota,_).

meVoyAlMaso(ValorCarta1,PaloCarta1,ValorCarta2,PaloCarta2,ValorCarta3, PaloCarta3) :-
	manoValida(ValorCarta1,PaloCarta1,ValorCarta2,PaloCarta2,ValorCarta3, PaloCarta3),
	cartaMala(ValorCarta1,PaloCarta1),
	cartaMala(ValorCarta2,PaloCarta2),
	cartaMala(ValorCarta3,PaloCarta3),
	envido(ValorCarta1,PaloCarta1,ValorCarta2,PaloCarta2,ValorCarta3, PaloCarta3, Tanto),
	Tanto < 20.

/***************/
/* Ejercicio 3 */
/***************/

/*
Se dice que un número es "perfecto", si es igual a la suma 
de sus divisores menos él mismo. El 6 es perfecto, ya que
            1 + 2 + 3 = 6
Definir un predicado que confirme si un número es perfecto.

?- perfecto(5).
false.

?- perfecto(6).
true.

*/

esDivisor(Num1, Num2):- 
	0 =:= Num1 mod Num2.            

perfecto(N) :-
	N > 1,
	NAux is N - 1,
	perfectoRecursivo(N,NAux,0).

perfectoRecursivo(_,1,1).

perfectoRecursivo(N,M,Suma) :-
   M > 1,
   esDivisor(N,M),
   MAux is M - 1,
   perfectoRecursivo(N,MAux,SumaAux),
   Suma is SumaAux + M.

perfectoRecursivo(N,M,Suma) :-
   M > 1,
   MAux is M - 1,
   perfectoRecursivo(N,MAux,Suma).

