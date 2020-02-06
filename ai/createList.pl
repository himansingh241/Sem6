go1:-write('Enter a list'),nl,
    createList(L),
    write('The list is:'),nl,
    printList(L).

enter(X):- write('Enter element:'),nl,
            read(X).

createList(L):- enter(X),createList(X,L).
createList(-1,[]):-!.
createList(X,[X|T]):- enter(X1),createList(X1,T).
printList([]).
printList([H|T]):-write(' '),write(H),printList(T).
:-initialization(go1).