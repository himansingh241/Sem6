go:-	
	write('Enter List:'),nl,
	createList(L),
    even(L),
    write('Even Length List');
    odd(L),
    write('Odd Length List').

even([]) :- !.
even([_|T]):- odd(T).
odd([_]):-!.
odd([_|T]) :- even(T).

enterEl(X) :-   write('Enter Element :'),
                read(X).

createList(L) :-enterEl(X), 
                createList(X, L).

createList(-1, []) :-   !.

createList(X, [X|T]) :- enterEl(X1),
                        createList(X1, T).


:-initialization(go).