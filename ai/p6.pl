go:-	
    write('Enter base :'),
	read(N),
	write('Enter power :'),
	read(P),
	pwr(N,P,R),nl,
	write('Result : '),
    write(R).

pwr(_,0,1):- !.
pwr(N,1,N):- !.
pwr(N,P,R) :-   N > 1,
			        P1 is P - 1,
				    pwr(N,P1,R1),
				    R is N*R1.
				

:-initialization(go).
