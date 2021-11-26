% displays available command for each menu

helpmsg:-
	write('Command tidak tersdia! Ketik \'help.\' untuk daftar command'),!.

help:-
	menu_status(game_not_started),
	write('---------------- Command List ----------------'),nl,
	write('| start.      :- loads game                  |'),nl,
	write('----------------------------------------------'),nl,!.

help:-
	menu_status(title_screen),
	write('---------------- Command List ----------------'),nl,
	write('| new.        :- starts a new game           |'),nl,
	write('----------------------------------------------'),nl,!.

help:-
	menu_status(outside),
	write('---------------- Command List ----------------'),nl,
	write('| w.          :- moves up                    |'),nl,
	write('| a.          :- moves left                  |'),nl,
	write('| s.          :- moves down                  |'),nl,
	write('| d.          :- moves right                 |'),nl,
	write('| map.        :- displays map                |'),nl,
	write('| legends.    :- displays map legends        |'),nl,
	write('| dig.        :- digs soil                   |'),nl,
	write('| plant.      :- plants seed                 |'),nl,
	write('| harvest.    :- harvests crops              |'),nl,
	write('| market.     :- enters market               |'),nl,
	write('| house.      :- enters house                |'),nl,
	write('| quest.      :- gets quest                  |'),nl,
	write('| alchemist.  :- ?                           |'),nl,
	write('| potion.     :- ??                          |'),nl,
	write('----------------------------------------------'),nl,!.