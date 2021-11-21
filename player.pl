:- dynamic(player/1).
:- dynamic(money/1).

:- dynamic(expplayer/1).
:- dynamic(expfarming/1).
:- dynamic(expfishing/1).
:- dynamic(expranching/1).
:- dynamic(levelplayer/1).
:- dynamic(levelfarming/1).
:- dynamic(levelfishing/1).
:- dynamic(levelranching/1).

:- dynamic(nextlevelexp/1).
:- dynamic(nextlevelexpfarming/1).
:- dynamic(nextlevelexpfishing/1).
:- dynamic(nextlevelexpranching/1).

:- dynamic(hoelevel/1).
:- dynamic(fishingrodlevel/1).

createPlayer(Name) :-
    assertz(player(Name)),
    assertz(money(0)),
    assertz(expplayer(0)),
    assertz(expfarming(0)),
    assertz(expfishing(0)),
    assertz(expranching(0)),
    assertz(levelplayer(1)),
    assertz(levelfarming(1)),
    assertz(levelfishing(1)),
    assertz(levelranching(1)),
    assertz(nextlevelexp(50)),
    assertz(nextlevelexpfarming(50)),
    assertz(nextlevelexpfishing(50)),
    assertz(nextlevelexpranching(50)).

createFarmer(Name) :-
    createPlayer(Name),
    assertz(specialty(farmer)).

createFisherman(Name) :-
    createPlayer(Name),
    assertz(specialty(fisherman)).

createRancher(Name) :-
    createPlayer(Name),
    assertz(specialty(rancher)).

status :-   write('Your status:'), nl,
            write('Job: '), specialty(A), write(A), nl,
            write('Level: '), levelplayer(B), write(B), nl,
            write('Exp: '), expplayer(C), write(C), nl,
            write('Money: '), money(Money), write(Money), write(' gold'), nl, nl,
            write('Level farming: '), levelfarming(D), write(D), nl,
            write('Exp farming: '), expfarming(E), write(E), nl,
            write('Level fishing: '), levelfishing(F), write(F), nl,
            write('Exp fishing: '), expfishing(G), write(G), nl,
            write('Level ranching: '), levelranching(H), write(H), nl,
            write('Exp ranching: '), expranching(I), write(I), nl.

/* Untuk semua peredikat change berlaku penambahan, jadi Change adalah perubahan, bukan nilai baru yang menggantikan nilai lama */
/* Mengubah banyak uang, gunakan negatif untuk mengurangi */
changeMoney(Change) :-
    money(Old),
    New is Old + Change,
    retract(money(Old)),
    assertz(money(New)).

/* Mengubah experience dan level keseluruhan player */
changeExpPlayer(Change) :-
    expplayer(Old),
    NewExp is Old + Change,
    retract(expplayer(Old)),
    assertz(expplayer(NewExp)),
    nextlevelexp(NextLevelExp),
    ( NewExp >= NextLevelExp -> changeLevelPlayer(1),
                                NewNextLevelExp is NextLevelExp + 50,
                                retract(nextlevelexp(NextLevelExp)),
                                assertz(nextlevelexp(NewNextLevelExp)) ).

changeLevelPlayer(Change) :-
    levelplayer(Old),
    New is Old + Change,
    retract(levelplayer(Old)),
    assertz(levelplayer(New)).

/* Mengubah experience dan level tiap skill */
changeExpFarming(Change) :-
    expfarming(Old),
    NewExp is Old + Change,
    retract(expfarming(Old)),
    assertz(expfarming(NewExp)),
    nextlevelexpfarming(NextLevelExp),
    ( NewExp >= NextLevelExp -> changeLevelFarming(1),
                                NewNextLevelExp is NextLevelExp + 50,
                                retract(nextlevelexpfarming(NextLevelExp)),
                                assertz(nextlevelexpfarming(NewNextLevelExp)) ).

changeLevelFarming(Change) :-
    levelfarming(Old),
    New is Old + Change,
    retract(levelfarming(Old)),
    assertz(levelfarming(New)).

changeExpFishing(Change) :-
    expfishing(Old),
    NewExp is Old + Change,
    retract(expfishing(Old)),
    assertz(expfishing(NewExp)),
    nextlevelexpfishing(NextLevelExp),
    ( NewExp >= NextLevelExp -> changeLevelFishing(1),
                                NewNextLevelExp is NextLevelExp + 50,
                                retract(nextlevelexpfishing(NextLevelExp)),
                                assertz(nextlevelexpfishing(NewNextLevelExp)) ).

changeLevelFishing(Change) :-
    levelfishing(Old),
    New is Old + Change,
    retract(levelfishing(Old)),
    assertz(levelfishing(New)).

changeExpRanching(Change) :-
    expranching(Old),
    NewExp is Old + Change,
    retract(expranching(Old)),
    assertz(expranching(NewExp)),
    nextlevelexpranching(NextLevelExp),
    ( NewExp >= NextLevelExp -> changeLevelRanching(1),
                                NewNextLevelExp is NextLevelExp + 50,
                                retract(nextlevelexpranching(NextLevelExp)),
                                assertz(nextlevelexpranching(NewNextLevelExp)) ).

changeLevelRanching(Change) :-
    levelranching(Old),
    New is Old + Change,
    retract(levelranching(Old)),
    assertz(levelranching(New)).