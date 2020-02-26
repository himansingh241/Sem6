go:-	
	write('Enter List:'),nl,
	createList(L1),
    write(L1),nl,
    rev(L, R),
    write('Reversed List : '),
    write(R).

rev(L, R):- mrev(L, [], R).
mrev([], L, L):- !.
mrev([H|T], A, R):- mrev(T, [H|A], R).

enterEl(X) :-   write('Enter Element :'),
                read(X).

createList(L) :-enterEl(X), 
                createList(X, L).

createList(-1, []) :-   !.

createList(X, [X|T]) :- enterEl(X1),
                        createList(X1, T).


:-initialization(go).