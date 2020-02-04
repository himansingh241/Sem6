go:-write('Enter first number: '),
    read(A),
    write('Enter second number: '),
    read(B),
    sum(A, B, R), nl,
    write('Sum: '),
    write(R).

sum(A, B, R):- R is A+B.
:-initialization(go).

