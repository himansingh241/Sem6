go:-	
	write('Enter List :'),nl,
	createList(L),
    write(L),nl,nl,
    length_of(L,X),
    X > 0,
    maxList(L, R),
    write('Maximum: '),
    write(R);
    write('Enter number not found').
    length_of(L,X):-    len(L, 0, X).
    len([], A, A):- !.
    len([_|T], A, X):-  K is A+1,
                        len(T, K, X).
    max(X,Y,Z) :- X =< Y , ! , Z = Y.
    max(X,Y,X).
    maxList([H], H):-!.
    maxList([X1,X2|T], R):- max(X1, X2, X),
                            maxList([X|T], R). 
    enterEl(X) :-   write('Enter Element :'),
                    read(X).
    createList(L) :-enterEl(X), 
                    createList(X, L).
    createList(-1, []) :-   !.
    createList(X, [X|T]) :- enterEl(X1),
                            createList(X1, T).


:-initialization(go).
