go:-	
	write('Enter a List :'),nl,
	createList(L),
    write(L),nl,
    write('Enter Elements :'),
    read(I),nl,
	write('Enter position :'),
	read(N),nl,nl,
    length_of(L,X),
    N > 0,
    X+1 >= N,
    insertEle(I, N, L, R),
    write('Requred List: '),
    write(R);
    write('Invalid').

    length_of(L,X):-    len(L, 0, X).
    len([], A, A):- !.
    len([_|T], A, X):-  K is A+1,
                        len(T, K, X).

    
    insertEle(I, 1, L, [I|L]):- !.
    insertEle(I, N, [H|T], [H|R]):- N1 is N-1,
                                insertEle(I, N1, T, R).


    enterEl(X) :-   write('Enter Element :'),
                    read(X).

    createList(L) :-enterEl(X), 
                    createList(X, L).
    
    createList(-1, []) :-   !.

    createList(X, [X|T]) :- enterEl(X1),
                            createList(X1, T).


:-initialization(go).
