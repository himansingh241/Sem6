go:-	
	write('Enter List:'),nl,
	createList(L),
    check_palindrome(L), 
    write('Yes');
    write('No').

rev(L, R):- mrev(L, [], R).
mrev([], L, L):- !.
mrev([H|T], A, R):- mrev(T, [H|A], R).

check_palindrome(L):- rev(L, L).

enterEl(X) :-   write('Enter Element :'),
                read(X).

createList(L) :-enterEl(X), 
                createList(X, L).

createList(-1, []) :-   !.

createList(X, [X|T]) :- enterEl(X1),
                        createList(X1, T).


:-initialization(go).