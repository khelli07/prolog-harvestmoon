/* Requres map.pl and main.pl */

move(_,_):-
	\+menu_status(outside),!,
	write('Anda tidak sedang berada di luar'),
	nl,fail.

move(P,Q):-
	isPagar(P,Q),!,
	write('Anda menabrak tembok!'),
	nl,fail.

move(P,Q):-
	isAir(P,Q),!,
	write('Anda terjatuh ke kolam!'),
	nl,fail.

move(P,Q):-
	retract(locPlayer(_,_)),
	asserta(locPlayer(P,Q)), map,!.

w:-
	locPlayer(A,B),!,
	C is B-1,
	move(A,C),!.
	
a:- 
	locPlayer(A,B),!,
	C is A-1,
	move(C,B),!.

s:- 
	locPlayer(A,B),!,
	C is B+1,
	move(A,C),!.

d:-
	locPlayer(A,B),!,
	C is A+1,
	move(C,B),!.
