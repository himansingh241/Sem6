go:-	
	write('Enter List:'),nl,
	createList(L),
    sum_of_list(L, R), 
    write(R).

sum_of_list([], 0) :- !.

sum_of_list([H|T], R):- sum_of_list(T, R1),
                        R is R1 + H.

enterEl(X) :-   write('Enter Element :'),
                read(X).

createList(L) :-enterEl(X), 
                createList(X, L).

createList(-1, []) :-   !.

createList(X, [X|T]) :- enterEl(X1),
                        createList(X1, T).


:-initialization(go).