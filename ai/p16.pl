go:-	
	write('Enter List:'),nl,
	createList(L),
    write('Enter n: '),
    read(N),
    nth_element(N, L, X),
    write(X).

nth_element(1, [H|_], H) :- !.
nth_element(N, [_|T], X) :- N1 is N - 1,
                        nth_element(N1, T, X).


enterEl(X) :-   write('Enter Element :'),
                read(X).

createList(L) :-enterEl(X), 
                createList(X, L).

createList(-1, []) :-   !.

createList(X, [X|T]) :- enterEl(X1),
                        createList(X1, T).


:-initialization(go).