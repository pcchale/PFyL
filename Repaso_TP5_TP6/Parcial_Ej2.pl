cartaValida(Numero, Palo) :-
    numeroEsValido(Numero),
    paloEsValido(Palo).

numeroEsValido(Numero) :-
    Numero >= 1,
    Numero =< 7.

numeroEsValido(sota).
numeroEsValido(caballo).
numeroEsValido(rey).

paloEsValido(espada).
paloEsValido(basto).
paloEsValido(copa).
paloEsValido(oro).

esSotaCaballoORey(sota).
esSotaCaballoORey(caballo).
esSotaCaballoORey(rey).

sonNumerosDistintos(NumeroCarta1, NumeroCarta2, NumeroCarta3) :-
    NumeroCarta1 \= NumeroCarta2,
    NumeroCarta1 \= NumeroCarta3,
    NumeroCarta2 \= NumeroCarta3.

flor(NumeroCarta1, Palo, NumeroCarta2, Palo, NumeroCarta3, Palo) :-
    sonNumerosDistintos(NumeroCarta1, NumeroCarta2, NumeroCarta3).

envido(NumeroCarta1, Palo, NumeroCarta2, Palo, NumeroCarta3, Palo, Tanto) :-
    sonNumerosDistintos(NumeroCarta1, NumeroCarta2, NumeroCarta3),
    calcularTanto(NumeroCarta1, NumeroCarta2, NumeroCarta3, Tanto).

envido(NumeroCarta1, Palo, NumeroCarta2, Palo, _, PaloCarta3, Tanto) :-
    NumeroCarta1 \= NumeroCarta2,
    Palo \= PaloCarta3,
    calcularTanto(NumeroCarta1, NumeroCarta2, 0, Tanto).
        
envido(NumeroCarta1, Palo, _, PaloCarta2, NumeroCarta3, Palo, Tanto) :-
    NumeroCarta1 \= NumeroCarta3,
    Palo \= PaloCarta2,
    calcularTanto(NumeroCarta1, NumeroCarta3, 0, Tanto).

/* Si son 2 cartas y ninguno de los 2 es 10 11 12 */
calcularTanto(NumeroCarta1, NumeroCarta2, 0, Tanto) :-
    not(esSotaCaballoORey(NumeroCarta1)),
    not(esSotaCaballoORey(NumeroCarta2)),
    Tanto is (NumeroCarta1 + NumeroCarta2 + 20).

/* Si son 2 y uno es 10 11 o 12 */
calcularTanto(NumeroCarta1, NumeroCarta2, 0, Tanto) :-
    esSotaCaballoORey(NumeroCarta1),
    not(esSotaCaballoORey(NumeroCarta2)),
    Tanto is (20 + NumeroCarta2).

calcularTanto(NumeroCarta1, NumeroCarta2, 0, Tanto) :-
    not(esSotaCaballoORey(NumeroCarta1)),
    esSotaCaballoORey(NumeroCarta2),
    Tanto is (20 + NumeroCarta1).
/* */

/* Si son 2 o 3 10 11 o 12 */
calcularTanto(NumeroCarta1, NumeroCarta2, 0, Tanto) :-
    esSotaCaballoORey(NumeroCarta1),
    esSotaCaballoORey(NumeroCarta2),
    Tanto is 20.

calcularTanto(NumeroCarta1, NumeroCarta2, NumeroCarta3, Tanto) :-
    esSotaCaballoORey(NumeroCarta1),
    esSotaCaballoORey(NumeroCarta2),
    esSotaCaballoORey(NumeroCarta3),
    Tanto is 20.
/* */

/* Son 3 cartas, y no son las 3 sota caballo rey */
calcularTanto(NumeroCarta1, NumeroCarta2, NumeroCarta3, Tanto) :-
    obtener2CartasMasAltas(NumeroCarta1, NumeroCarta2, NumeroCarta3, CartaMasAlta1, CartaMasAlta2),
    calcularTanto(CartaMasAlta1, CartaMasAlta2, 0, Tanto).

obtener2CartasMasAltas(NumeroCarta1, NumeroCarta2, NumeroCarta3, NumeroCarta2, NumeroCarta3) :-
    esSotaCaballoORey(NumeroCarta1).

obtener2CartasMasAltas(NumeroCarta1, NumeroCarta2, NumeroCarta3, NumeroCarta1, NumeroCarta3) :-
    esSotaCaballoORey(NumeroCarta2).

obtener2CartasMasAltas(NumeroCarta1, NumeroCarta2, NumeroCarta3, NumeroCarta1, NumeroCarta2) :-
    esSotaCaballoORey(NumeroCarta3).

/* Ninguna carta es un rey */
obtener2CartasMasAltas(NumeroCarta1, NumeroCarta2, NumeroCarta3, NumeroCarta1, NumeroCarta2) :-
    not(esSotaCaballoORey(NumeroCarta1)),
    not(esSotaCaballoORey(NumeroCarta2)),
    not(esSotaCaballoORey(NumeroCarta3)),
    NumeroCarta1 > NumeroCarta3, 
    NumeroCarta2 > NumeroCarta3.

/* Ninguna carta es un rey */
obtener2CartasMasAltas(NumeroCarta1, NumeroCarta2, NumeroCarta3, NumeroCarta1, NumeroCarta3) :-
    not(esSotaCaballoORey(NumeroCarta1)),
    not(esSotaCaballoORey(NumeroCarta2)),
    not(esSotaCaballoORey(NumeroCarta3)),
    NumeroCarta1 > NumeroCarta2, 
    NumeroCarta3 > NumeroCarta2.

/* Ninguna carta es un rey */
obtener2CartasMasAltas(NumeroCarta1, NumeroCarta2, NumeroCarta3, NumeroCarta2, NumeroCarta3) :-
    not(esSotaCaballoORey(NumeroCarta1)),
    not(esSotaCaballoORey(NumeroCarta2)),
    not(esSotaCaballoORey(NumeroCarta3)),
    NumeroCarta2 > NumeroCarta1, 
    NumeroCarta2 > NumeroCarta1.


esCartaMala(sota).
esCartaMala(Numero) :-
    Numero \= sota,
    Numero \= caballo,
    Numero \= rey,
    Numero >= 4,
    Numero =< 6.

esCartaMalaOSieteFalso(7, basto).
esCartaMalaOSieteFalso(7, copa).
esCartaMalaOSieteFalso(Carta, _) :-
    esCartaMala(Carta).

meVoyAlMazo(NumeroCarta1, PaloCarta1, NumeroCarta2, PaloCarta2, NumeroCarta3, PaloCarta3) :-
    not(envido(NumeroCarta1, PaloCarta1, NumeroCarta2, PaloCarta2, NumeroCarta3, PaloCarta3, Tanto)),
    Tanto >= 20,
    esCartaMalaOSieteFalso(NumeroCarta1, PaloCarta1),
    esCartaMalaOSieteFalso(NumeroCarta2, PaloCarta2),
    esCartaMalaOSieteFalso(NumeroCarta3, PaloCarta3).