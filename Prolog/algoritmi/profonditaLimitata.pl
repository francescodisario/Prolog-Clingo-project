% Profondità con una profondità limitata
prova(Soluzione,Limite):-
    iniziale(S),
    ricerca_depth_limitata(S,[],Limite,Soluzione).

ricerca_depth_limitata(S,_,_,[]) :- finale(S),!.

ricerca_depth_limitata(S,Visitati,Limite,[Az|SequenzaAzioni]):-
    Limite>0,
    applicabile(Az,S),
    trasforma(Az,S,SNuovo),
    \+member(SNuovo,Visitati),
    NuovoLimite is Limite-1,
    ricerca_depth_limitata(SNuovo,[S|Visitati],NuovoLimite,SequenzaAzioni).
    