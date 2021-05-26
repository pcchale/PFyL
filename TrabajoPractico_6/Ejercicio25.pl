tateti([Valor, Valor, Valor], _, _, Valor).

tateti(_, [Valor, Valor, Valor], _, Valor).

tateti(_, _, [Valor, Valor, Valor], Valor).

tateti([Valor, _, _], [Valor, _, _], [Valor, _, _], Valor).

tateti([_, Valor, _], [_, Valor, _], [_, Valor, _], Valor).

tateti([_, _, Valor], [_, _, Valor], [_, _, Valor], Valor).

tateti([Valor,_,_], [_,Valor,_], [_,_,Valor], Valor).

tateti([_,_,Valor], [_,Valor,_], [Valor,_,_], Valor).
