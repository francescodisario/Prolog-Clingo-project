:- dynamic(iterations/1).
:- dynamic(iterations/1).


iterations(0).

prova(Soluzione) :-
    iniziale(S),
    calcolaLimiteMassimo(LimiteMassimo),
    ricerca_iterative_deeping(S, 1, LimiteMassimo, Soluzione),
    iterations(N),
    write(N).


ricerca_iterative_deeping(S, Limite, _, Soluzione) :-
    ricerca_depth_limitata(S, [], Limite, Soluzione), !.
    

ricerca_iterative_deeping(S, Limite, LimiteMassimo, Soluzione) :- 
    NuovoLimite is Limite + 1,
    NuovoLimite =< LimiteMassimo,
    ricerca_iterative_deeping(S, NuovoLimite, LimiteMassimo, Soluzione).



ricerca_depth_limitata(S, _, _, []) :- 
    finale(S),!.

ricerca_depth_limitata(S, Visitati, Limite, [Az|SequenzaAzioni]):-
    Limite > 0,
    applicabile(Az, S),
    trasforma(Az, S, SNuovo),
    \+member(SNuovo, Visitati),
    iterations(N),
    retractall(iterations(_)),
    NewN is N + 1,
    assert(iterations(NewN)),
    NuovoLimite is Limite-1,
    ricerca_depth_limitata(SNuovo, [S|Visitati], NuovoLimite, SequenzaAzioni).


calcolaLimiteMassimo(LimiteMassimo) :-
    num_righe(NR),
    num_colonne(NC),
    findall(X, occupata(X), Risultato),
    length(Risultato, PosizioniOccupate),
    LimiteMassimo is (NR * NC - 1) - PosizioniOccupate.

