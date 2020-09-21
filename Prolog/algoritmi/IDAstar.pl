:- dynamic(boundMinimo/1).

boundMinimo(-1).

prova(Soluzione) :-
    iniziale(Si),
    heuristic(Si, H),
    ricerca_ida(Si, H, Soluzione).


ricerca_ida(S, Limite, Soluzione) :-
    ricerca_depth_limitata(S, [], Limite, 1, Limite, Soluzione), !.
    
ricerca_ida(S, Limite, Soluzione) :-
    boundMinimo(NuovoLimite),
    Limite < NuovoLimite,
    retractall(boundMinimo(_)),
    assert(boundMinimo(-1)),
    ricerca_ida(S, NuovoLimite, Soluzione).

ricerca_depth_limitata(S, _, _, _, _, []) :- 
    finale(S),!.

ricerca_depth_limitata(S, Visitati, Limite, LivelloAttuale, Bound, [Az|SequenzaAzioni]):-
    Limite > 0,
    applicabile(Az, S),
    trasforma(Az, S, SNuovo),
    \+member(SNuovo, Visitati),
    controllaBound(SNuovo, LivelloAttuale, Bound),
    NuovoLimite is Limite - 1,
    NuovoLivello is LivelloAttuale + 1,
    ricerca_depth_limitata(SNuovo, [S|Visitati], NuovoLimite, NuovoLivello, Bound, SequenzaAzioni).


controllaBound(S, LivelloAttuale, Bound) :-
    heuristic(S, H),
    F is LivelloAttuale + H,
    F =< Bound,!.

controllaBound(S, LivelloAttuale, Bound) :-
    heuristic(S, H),
    F is LivelloAttuale + H,
    boundMinimo(FN),
    minimo(F, FN, Min),
    retractall(boundMinimo(_)),
    assert(boundMinimo(Min)),
    F =< Bound.
        
% regole AUSILIARIE ----------------------

minimo(A, B, Risultato) :-
    A = -1,
    Risultato is B,!.

minimo(A, B, Risultato) :-
    B = -1,
    Risultato is A,!.

minimo(A,B,Risultato):-
    Risultato is min(A, B).

