/*
Tenemos cuatro perros: un galgo, un dogo, un alano y un podenco. 
Éste último come más que el galgo; el alano come más que el galgo y menos que el dogo, 
pero éste come más que el podenco. ¿Cuál de los cuatro será más barato de mantener?.
*/


comeMas(dogo, alano).

comeMas(podenco, galgo).

comeMas(alano, galgo).

comeMas(dogo, podenco).

obtenerPerroQueComaMenosQue(Perro, Perro2) :-
    comeMas(Perro, Perro2).

perroQueMenosCome(Perro) :-
    comeMas(PerroQueComeMas, Perro),
    not(obtenerPerroQueComaMenosQue(Perro, Perro2)).