go :- write('Enter a number: '),
    read(N),
    sum_of_n(N, X),
    write('Ans: '),
    write(X).

sum_of_n(1, 1) :- !.
sum_of_n(N, X) :- 
    N1 is N - 1,
    sum_of_n(N1, X1),
    X is X1 + N.

:-initialization(go).