roditelj(ivana, luka).
roditelj(marica, ana).
roditelj(marica, ivana).
roditelj(marija, stipe).
roditelj(marija, ruza).
roditelj(marija, ante).

roditelj(franjo, joza).
roditelj(franjo, marica).
roditelj(stipe, ana).
roditelj(stipe, ivana).
roditelj(ivan, stipe).
roditelj(ivan, ruza).
roditelj(ivan, ante).

spol(marija, z).
spol(ruza, z).
spol(marica, z).
spol(ana, z).
spol(ivana, z).
spol(ivan, m).
spol(franjo, m).
spol(joza, m).
spol(stipe, m).
spol(ante, m).
spol(luka, m).

godina(marija, 1945).
godina(ruza, 1969).
godina(marica, 1973).
godina(ana, 1995).
godina(ivana, 1991).
godina(ivan, 1941).
godina(franjo, 1950).
godina(joza, 1971).
godina(stipe, 1967).
godina(ante, 1971).
godina(luka, 2017).

majka(X, Y) :- 
	spol(X, z), 
	roditelj(X, Y).

otac(X, Y) :- 
	spol(X, m), 
	roditelj(X, Y).

predak(X, Y) :-
    roditelj(Z, Y),
    roditelj(X, Z).
    
dijete(X, Y) :- 
    roditelj(Y, X).
    
sin(X, Y) :-
    dijete(X, Y),
    spol(X, m).
    
kcer(X, Y) :-
    dijete(X, Y),
    spol(X, z).
    
djed(X, Y) :-
    spol(X, m),
    roditelj(Z, Y),
    roditelj(X, Z).

baka(X, Y) :-
    spol(X, z),
    roditelj(Z, Y),
    roditelj(X, Z).
    
pradjed(X, Y) :-
    (djed(Z, Y); baka(Z, Y)),
    otac(X, Z).
    
prabaka(X, Y) :-
    (djed(Z, Y); baka(Z, Y)),
    majka(X, Z).

teta_po_majci(Teta, Necak) :-
    spol(Teta, z),
    majka(Mama, Necak),
    roditelj(Z, Teta),
    roditelj(Z, Mama),
    Mama \= Teta.
    
teta_po_ocu(Teta, Necak) :-
    spol(Teta, z),
    otac(Tata, Necak),
    roditelj(Z, Teta),
    roditelj(Z, Tata),
    Tata \= Teta.
	
ujak(Ujak, Necak) :-
    spol(Ujak, m),
    majka(Mama, Necak),
    roditelj(Z, Ujak),
    roditelj(Z, Mama),
    Mama \= Ujak.
    
stric(Stric, Necak) :-
    spol(Stric, m),
    otac(Tata, Necak),
    roditelj(Z, Stric),
    roditelj(Z, Tata),
    Tata \= Stric.
    
ispisi_oceve :-
    forall(
        otac(Otac, Dijete),
        format(`~w je otac od ~w~n`, [Otac, Dijete])
    ).
    
ispisi_majke :-
    forall(
        majka(Majka, Dijete),
        format(`~w je majka od ~w~n`, [Majka, Dijete])
    ).
    
ispisi_roditelje :-
    forall(
        roditelj(Roditelj, Dijete),
        format(`~w je roditelj od ~w~n`, [Roditelj, Dijete])
    ).
    
ispisi_predke :-
    forall(
        predak(Predak, Rod),
        format(`~w je predak od ~w~n`, [Predak, Rod])
    ).
    
ispisi_djecu :-
    forall(
        dijete(Dijete, Roditelj),
        format(`~w je dijete od ~w~n`, [Dijete, Roditelj])
    ).
    
ispisi_sinove :-
    forall(
        sin(Sin, Roditelj),
        format(`~w je sin od ~w~n`, [Sin, Roditelj])
    ).
    
ispisi_kceri :-
    forall(
        kcer(Kcer, Roditelj),
        format(`~w je kcer od ~w~n`, [Kcer, Roditelj])
    ).
    
ispisi_bake :-
    forall(
        baka(Baka, Unuk),
        format(`~w je baka od ~w~n`, [Baka, Unuk])
    ).
    
ispisi_djedove :-
    forall(
        djed(Djed, Unuk),
        format(`~w je djed od ~w~n`, [Djed, Unuk])
    ).
    
ispisi_prabake :-
    forall(
        prabaka(PraBaka, Unuk),
        format(`~w je prabaka od ~w~n`, [PraBaka, Unuk])
    ).
    
ispisi_pradjedove :-
    forall(
        djed(PraDjed, Unuk),
        format(`~w je pradjed od ~w~n`, [PraDjed, Unuk])
    ).
    
ispisi_tete_po_majci :-
    forall(
        teta_po_majci(Teta, Necak),
        format(`~w je teta od ~w~n`, [Teta, Necak])
    ).

ispisi_tete_po_ocu :-
    forall(
        teta_po_ocu(Teta, Necak),
        format(`~w je teta od ~w~n`, [Teta, Necak])
    ).
    
ispisi_ujake :-
    forall(
        ujak(Ujak, Necak),
        format(`~w je ujak od ~w~n`, [Ujak, Necak])
    ).
    
ispisi_striceve :-
    forall(
        stric(Stric, Necak),
        format(`~w je stric od ~w~n`, [Stric, Necak])
    ).

ispisi_zene :-
    writeln("Zene su:"),
    forall(
        spol(Zena, z),
        writeln(Zena)
    ).
    
ispisi_muske :-
    writeln("Muski su:"),
    forall(
        spol(Musko, m),
        writeln(Musko)
    ).
    
ispisi_osobe_odredene_starosti :-
    writeln("Osobe rodene izmedu 1940 i 1970 godine su:"),
    forall(
        (godina(Osoba, Godine), Godine > 1940, Godine < 1970),
        writeln(Osoba)
    ).

ispisi_osobe_rodene_izmedu_datuma :-
    write("Unesite prvu godinu: "),
    read(God1),
    write("Unesite drugu godinu: "),
    read(God2),
    format(`Osobe rodene izmedu ~w i ~w godine su:~n`, [God1, God2]),
    forall(
        (godina(Osoba, Godine), Godine > God1, Godine < God2),
        writeln(Osoba)
    ).
