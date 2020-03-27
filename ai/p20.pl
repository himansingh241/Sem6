go:-
    write('Enter a list'),nl,
    createList(L1),
    write('The list is:'),nl,
    printList(L1),nl,nl,
    write('Enter a list to check for sublist :'),nl,
    createList(L2),
    write('The list is:'),nl,
    printList(L2),nl,nl,
    mysublist(L1,L2),write('List is sublist'),nl;
    write('List is not a sublist'),nl.
mysublist(L1,L2):-
    mysublist(L1,L2,L2).
mysublist([],[],L2).
mysublist([X1|T1],[],L2).
mysublist([X1|T1],[X1|T2],L2):-
    mysublist(T1,T2,L2).
mysublist([X1|T1],L3,L2):-
    mysublist(T1,L2,L2).
enter(X):-
    write('Enter element:'),
    read(X).
createList(L):-
    enter(X),createList(X,L).
createList(-1,[]):-!.
createList(X,[X|T]):-
    enter(X1),createList(X1,T).
printList([]):-!.
printList([H|T]):-
    write(' '),write(H),printList(T).
:-initialization(go).

