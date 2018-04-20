majka(ivana, luka).
majka(marica, ana).
majka(marica, ivana).
majka(marija, stipe).
majka(marija, ruza).
majka(marija, ante).

otac(franjo, joza).
otac(franjo, marica).
otac(stipe, ana).
otac(stipe, ivana).
otac(ivan, stipe).
otac(ivan, ruza).
otac(ivan, ante).

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

roditelj(Roditelj, Dijete) :- 
    majka(Roditelj, Dijete);
    otac(Roditelj, Dijete).

predak(X, Y) :-
    roditelj(Z, Y),
    roditelj(X, Z).
    
% Tu treba popraviti nesto, pojavljuju se duplikati
dijete(X) :- 
    roditelj(_, X).
    
sin(X) :-
    dijete(X),
    spol(X, m).
    
kcer(X) :-
    dijete(X),
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
    roditelj(Z, Y),
    otac(X, Z).
    
prabaka(X, Y) :-
    roditelj(Z, Y),
    majka(X, Z).
    
teta() :-
    







