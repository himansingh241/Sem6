go:-write('Enter a list: '),
    read(L), nl,
    write('Number to search: '),
    read(E),nl,
    memb(L, E),write('Yes');write('No').

memb([H|_], H) :- !.
memb([_|T], E) :-
    memb(T, E).

:-initialization(go).
