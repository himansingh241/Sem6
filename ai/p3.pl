go:-write('Enter a number: '),
    read(A),
    fact(A, R),
    write('Factorial: '),
    write(R).

fact(0, R) :- !
fact(A, R):- A > 0,
    A1 is A - 1,
    fact(A1, R1),
    R is A * R1.

:-initialization(go).