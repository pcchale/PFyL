/*
Preparar un predicado binario que 
sea verdadero cuando sus dos sujetos
 sean números tales que el primero es 
 múltiplo del segundo.

*/
/*
multiplo(Numero1, Numero2) :-
    Numero2 mod Numero1 =:= 0.
*/


multiplo(_, 0).

multiploAux(Numero1, Numero2) :-
    Numero2 > 0,
    Numero2Aux is Numero2 - Numero1,
    multiplo(Numero1, Numero2Aux).