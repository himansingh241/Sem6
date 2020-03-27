go:-	
	write('Enter a List :'),nl,
	createList(L),
    write(L),nl,
	write('Enter position of element to be delete:'),
	read(N),nl,nl,
    length_of(L,X),
    N > 0,
    X >= N,
    delElement(N, L, R),
    write('List: '),
    write(R);
    write('Enter Valid Arguments').

    length_of(L,X):-    len(L, 0, X).
    len([], A, A):- !.
    len([_|T], A, X):-  K is A+1,
                        len(T, K, X).

    conc([], L, L):-!.
    conc(L, [], L):-!.
    conc([H|T1], L2, [H|T2]):-  conc(T1, L2, T2).

    delElement(1, [_|T], T) :- !.
    delElement(N, [H|T], R) :-  N1 is N-1,
                                delElement(N1, T, R1),
                                conc([H], R1, R).

    enterEl(X) :-   write('Enter Element :'),
                    read(X).

    createList(L) :-enterEl(X), 
                    createList(X, L).
    
    createList(-1, []) :-   !.

    createList(X, [X|T]) :- enterEl(X1),
                            createList(X1, T).


:-initialization(go).
