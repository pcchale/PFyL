separaMayMen(Lista, Limite, [ListaMenores,ListaMayores]) :-
    men(Lista, Limite, ListaMenores),
    may(Lista, Limite, ListaMayores).
    

men([], _, []).

men([PrimerElemento|RestoElementos], Limite, [PrimerElemento|RestoListaResultado]) :-
    PrimerElemento < Limite,
    men(RestoElementos, Limite, RestoListaResultado).


men([PrimerElemento|RestoElementos], Limite, RestoListaResultado) :-
    PrimerElemento >= Limite,
    men(RestoElementos, Limite, RestoListaResultado).

may([], _, []).

may([PrimerElemento|RestoElementos], Limite, [PrimerElemento|RestoListaResultado]) :-
    PrimerElemento > Limite,
    may(RestoElementos, Limite, RestoListaResultado).


may([PrimerElemento|RestoElementos], Limite, RestoListaResultado) :-
    PrimerElemento =< Limite,
    may(RestoElementos, Limite, RestoListaResultado).