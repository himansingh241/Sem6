go:-write('Enter first list: '),
    read(L1), nl,
    write('Enter second list: '),
    read(L2),nl,
    conc(L1, L2, L3),
    write(L3).

conc()
:-initialization(go).