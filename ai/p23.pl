go:-	
	write('Enter ordered List1 :'),nl,
	createList(L1),
    write(L1),nl,nl,
    write('Enter ordered list2 :'),nl,
	createList(L2),
    write(L2),nl,nl,
    merge(L1, L2, L),
    write('List: '),
    write(L).

    merge([],L2,L2):-   !.
    merge(L1,[],L1):-   !.

    merge([X1|T1],[X2|T2],[X3|T3]) :-   X1 < X2,
                                        X3 is X1,
                                        merge(T1,[X2|T2],T3);
                                        X3 is X2,
                                        merge([X1|T1],T2,T3).

    enterEl(X) :-   write('Enter Element :'),
                    read(X).

    createList(L) :-enterEl(X), 
                    createList(X, L).
    
    createList(-1, []) :-   !.

    createList(X, [X|T]) :- enterEl(X1),
                            createList(X1, T).


:-initialization(go).
