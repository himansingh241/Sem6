o:-write('First Number: '),
    read(A),
    write('Second Number: '),
    read(B),
    max(A, B, M), nl,
    write('Max: '),
    write(M).

max(A, B, M):- A =< B , !, M = B.
max(A, _, A).
:-initialization(go).
