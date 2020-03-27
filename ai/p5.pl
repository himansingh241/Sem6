go:-write('Enter first number: '),
    read(A), nl,
    write('Enter second number: '),
    read(B),nl,
    gcd(A, B, R),
    write('GCD: '),
    write(R).

gcd(A, 0, A):- !.
gcd(A, B, R):- N is mod(A, B),
               gcd(B, N, R).

:-initialization(go).
