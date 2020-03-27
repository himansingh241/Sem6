go:-
    write('Enter first number :'),
    read(N1),
    write('Enter second number :'),
    read(N2),
    multi(N1, N2, R),nl,
    write('Result: '),
    write(R).

multi(_, 0, 0):- !.
multi(0, _, 0):- !.
multi(N1, N2, R):-  N1 > 0,
                    N2 > 0,
                    N3 is N2-1,     
                    multi(N1, N3, R1),
                    R is R1 + N1.

:-initialization(go).
