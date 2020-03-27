go:-    
    write('Enter value of N(index of fibonacci series) :'),
    read(N),
    fib(N,R),nl,
    write(N),
    write('th term in fibonacci series: '),
    write(R).

fib(0,0):- !.
fib(1,1):- !.
fib(2,1):- !.
fib(N,R):-  N > 2,
            N1 is N - 1,
            N2 is N - 2,
            fib(N1,R1),
            fib(N2,R2),
            R is R1+R2.

:-initialization(go).
