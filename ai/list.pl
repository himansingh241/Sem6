go:-createList(L1),
    printList(L1).

enterEle(X):-write('Enter an element: '),
             read(X).

createList(-1, []):-!.
createList(L1):-enterEle(X),
                createList(X, L1).
createList(X, [X|L1]):-enterEle(X1), createList(X, L1).

printEle(X):- write(X), write('').
printList(L1):- printEle(X), printList(X, L1).
printList(X, [X|L1]):-printEle(X), printList(X, L1).
:-initialization(go).