tateti([X, X, X], _, _, X) :-
  X \= v.

tateti(_, [X, X, X], _, X) :-
 X \= v.

tateti(_, _, [X, X, X], X) :-
  X \= v.

tateti([X,_,_], [X,_,_], [X,_,_], X) :-
  X \= v.

tateti([_,X,_], [_,X,_], [_,X,_], X) :-
  X \= v.

tateti([_,_,X], [_,_,X], [_,_,X], X) :-
  X \= v.

tateti([X, _, _], [_, X, _], [_, _, X], X) :-
  X \= v.


tateti([_, _, X], [_, X, _], [X, _, _], X) :-
  X \= v.