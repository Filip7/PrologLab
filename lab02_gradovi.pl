veza(opatija, lupoglav, 29).

veza(lupoglav, buzet, 15).
veza(lupoglav, pazin, 22).
veza(lupoglav, labin, 42).

veza(buzet, motovun, 18).

veza(pazin, motovun, 20).
veza(pazin, zminj, 17).
veza(pazin, baderna, 17).

veza(zminj, kanfanar, 6).

veza(motovun, groznjan, 18).

veza(groznjan, buje, 8).
veza(groznjan, visnjan, 19).

veza(buje, umag, 13).

veza(visnjan, baderna, 13).

veza(baderna, porec, 14).
veza(baderna, kanfanar, 19).

veza(kanfanar, rovinj, 18).
veza(kanfanar, vodnjan, 29).

veza(vodnjan, pula, 12).

veza(pula, medulin, 9).

veza(labin, barban, 15).

veza(barban, pula, 28).

povezan(Grad1, Grad2, Duljina) :-
    veza(Grad1, Grad2, Duljina);
    veza(Grad2, Grad1, Duljina).

put(Pocetni, Cilj, Put, Duljina) :-
       putuj(Pocetni, Cilj, [Pocetni], Q, Duljina), 
       reverse(Q, Put).

putuj(Pocetni, Cilj, Put,[Cilj|Put], Dulj) :- 
       povezan(Pocetni, Cilj, Dulj).
putuj(Pocetni,Cilj, Posjecen, Put, Duljina) :-
       povezan(Pocetni,C,Dulj),           
       C \== Cilj,
       \+member(C,Posjecen),
       putuj(C,Cilj,[C|Posjecen], Put,Duljina2),
       Duljina is Dulj+Duljina2.  
    

sve_veze_iznad_20_km :-
	forall(
		(put(Grad1, Grad2, Veza, Duljina), Duljina > 19),
		format("Duljina izmedu ~w i ~w je ~w~nPut:~w ~n", [Grad1, Grad2, Duljina, Veza])
    ).
    
sve_veze :-
	forall(
		put(Grad1, Grad2, Veza, Duljina),
		format("Duljina izmedu ~w i ~w je ~w~nPut:~w ~n", [Grad1, Grad2, Duljina, Veza])
    ).

sve_veze_izmedu_opatijePule_150km :-
	forall(
		(put(opatija, pula, Veza, Duljina), Duljina < 150),
		format("Duljina izmedu opatije i pule je ~w~nPut:~w ~n", [Duljina, Veza])
    ).

    
    
