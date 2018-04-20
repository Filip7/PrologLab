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
    
   
%TODO OVO DOVRSITI
teta(Teta, Necak).
	
/* Naredbe za zadatke	

otac(Otac, Dijete).
majka(Majka, Dijete).
roditelj(Roditelj, Dijete).
predak(Predak, Rod).
dijete(Dijete, Roditelj).
sin(Sin, Roditelj).
kcer(Kcer, Roditelj).
baka(Baka, Unuk).
djed(Djed, Unuk).
prabaka(Prabaka, Praunuk).
pradjed(Pradjed, Praunuk).

%Dodati ujne n shit

spol(Zensko, z);

spol(Musko, m);

godina(Osoba, Godine), Godine > 1940, Godine < 1970.

*/


