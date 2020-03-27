go:-	
	write('Enter a List :'),nl,
	createList(L),
    write(L),nl,nl,
	write('Enter element to be delete:'),
	read(N),nl,nl,
    delAll(N, L, R),
    write('Resultant List: '),
    write(R).


    delAll(_, [], []):- !.
    delAll(N, [N|T], R):-   delAll(N, T, R), !.
    delAll(N, [H|T], [H|R]):-   delAll(N, T, R).

    enterEl(X) :-   write('Enter Element :'),
                    read(X).

    createList(L) :-enterEl(X), 
                    createList(X, L).
    
    createList(-1, []) :-   !.

    createList(X, [X|T]) :- enterEl(X1),
                            createList(X1, T).


:-initialization(go).
