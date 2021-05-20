/*
En un negocio se desea armar una oferta para fin de año combinando un artículo 
de bazar, uno de perfumería y uno de juguetería, con la condición de que la 
oferta no supere un cierto precio máximo. Para ello contamos con la siguiente 
base de datos:
*/

bazar(fuentes).
bazar(vasos).
bazar(juego_de_cafe).
perfumeria(jabones).
perfumeria(crema).
perfumeria(perfume).
jugueteria(autito).
jugueteria(munieca).
jugueteria(oso).
precio(fuentes, 15).
precio(vasos, 12).
precio(juego_de_cafe, 20).
precio(jabones, 10).
precio(crema, 15).
precio(perfume, 25).
precio(autito, 10).
precio(munieca, 15).
precio(oso, 20).

/*
Escribir una regla "oferta" que relacione tres artículos, 
uno de cada rubro, con el precio máximo, y que sea verdadero 
cuando la oferta no supere el precio máximo.
Hacer una consulta para encontrar todas las ofertas de menos de $50.
*/

oferta(Articulo1, Articulo2, Articulo3, PrecioMaximo) :-
    bazar(Articulo1),
    jugueteria(Articulo2),
    perfumeria(Articulo3),
    precio(Articulo1, PrecioArticulo1),
    precio(Articulo2, PrecioArticulo2),
    precio(Articulo3, PrecioArticulo3),
    (PrecioArticulo1 + PrecioArticulo2 + PrecioArticulo3) < PrecioMaximo.

algunoEsBazar(Articulo1, _, _) :-
    bazar(Articulo1).

algunoEsBazar(_, Articulo2, _) :-
    bazar(Articulo2).

algunoEsBazar(_, _, Articulo3) :-
    bazar(Articulo3).

algunoEsPerfumeria(Articulo1, _, _) :-
    perfumeria(Articulo1).

algunoEsPerfumeria(_, Articulo2, _) :-
    perfumeria(Articulo2).

algunoEsPerfumeria(_, _, Articulo3) :-
    perfumeria(Articulo3).

algunoEsJugueteria(Articulo1, _, _) :-
    jugueteria(Articulo1).

algunoEsJugueteria(_, Articulo2, _) :-
    jugueteria(Articulo2).

algunoEsJugueteria(_, _, Articulo3) :-
    jugueteria(Articulo3).