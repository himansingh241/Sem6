go:-
    write('Enter number of Disks : '),
    read(N),
    toh(N, 'A', 'B', 'C').

inform(D, X, Y):-   write('Move Disk '),
                    write(D),
                    write(' From '),
                    write(X),
                    write(' To '),
                    write(Y), nl.

toh(1, From, To, Aux):- inform(1, From, To), !.

toh(N, From, To, Aux):- N1 is N - 1,
                        toh(N1, From, Aux, To),
                        inform(N, From, To),
                        toh(N1, Aux, To, From).



:- initialization(go).
