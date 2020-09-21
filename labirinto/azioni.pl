applicabile(est, pos(Riga,Colonna)) :-
    num_colonne(NC),
    Colonna < NC,
    ColonnaDestra is Colonna + 1,
    \+occupata(pos(Riga,ColonnaDestra)).

applicabile(ovest, pos(Riga,Colonna)) :-
    Colonna > 1,
    ColonnaSinistra is Colonna - 1,
    \+occupata(pos(Riga,ColonnaSinistra)).

applicabile(nord, pos(Riga, Colonna)) :-
    Riga > 1,
    RigaSopra is Riga - 1,
    \+occupata(pos(RigaSopra, Colonna)).

applicabile(sud, pos(Riga, Colonna)) :-
    num_righe(NR),
    Riga < NR,
    RigaSotto is Riga + 1,
    \+occupata(pos(RigaSotto, Colonna)).


%trasforma(Az, Stato, NuovoStato).

trasforma(est, pos(Riga,Colonna), pos(Riga, ColonnaDestra)) :- 
    ColonnaDestra is Colonna + 1.

trasforma(ovest, pos(Riga,Colonna), pos(Riga, ColonnaSinistra)) :- 
    ColonnaSinistra is Colonna -1.

trasforma(nord, pos(Riga,Colonna), pos(RigaSopra, Colonna)) :- 
    RigaSopra is Riga - 1.

trasforma(sud, pos(Riga,Colonna), pos(RigaSotto, Colonna)) :- 
    RigaSotto is Riga + 1.
