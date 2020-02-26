go:-	
	write('Enter List:'),nl,
	createList(L1),
    write(L1),nl,
    remove_dup(L1, R),
    write('List of  : '),
    write(R).
 
remove_dup([],[H|R]):-!.
% remove_dup([H|T],[]):- remove_dup(T,[H]).
remove_dup([H|T], R):- memb(R, H),!,
                        remove_dup(T, R).
remove_dup([H|T], [H|R]):-remove_dup(T, R).


enterEl(X) :-   write('Enter Element :'),
                read(X).

createList(L) :-enterEl(X), 
                createList(X, L).

createList(-1, []) :-   !.

createList(X, [X|T]) :- enterEl(X1),
                        createList(X1, T).

memb([H|_], H) :- !.
memb([_|T], E) :-
    memb(T, E).

:-initialization(go).









