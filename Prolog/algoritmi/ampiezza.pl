:- dynamic(passi/1).

passi(0).

provaAmpiezza(Soluzione) :-
    iniziale(S),
    bfs([nodo(S,[])], [], Soluzione).
% bfs(coda di nodi, coda di stati visitati, soluzione)
% dove nodo (S,AzioniPerS), soluzione = AzioniPerStatoFinale.

bfs([nodo(S,AzioniPerS)|_], _, AzioniPerS) :- 
    contaPassi,
    finale(S),!.

bfs([nodo(S,AzioniPerS)|CodaStati], Visitati, Soluzione) :-
    findall(Az, applicabile(Az, S), AzioniApplicabili),
    generaStatiFigli(nodo(S, AzioniPerS), [S|Visitati], AzioniApplicabili, StatiFigli),
    append(CodaStati, StatiFigli, NuovaCoda),
    bfs(NuovaCoda, [S|Visitati], Soluzione).

generaStatiFigli(_, _, [], []) :- !.

generaStatiFigli(nodo(S,AzioniPerS), Visitati, [Az|AltreAzioni], [nodo(FiglioS, [Az|AzioniPerS])|AltriFigli]) :-
    trasforma(Az, S, FiglioS),
    \+member(FiglioS, Visitati),
    write(FiglioS),
    !,
    generaStatiFigli(nodo(S,AzioniPerS), Visitati, AltreAzioni, AltriFigli).


generaStatiFigli(nodo(S,AzioniPerS), Visitati, [_|AltreAzioni], AltriFigli) :- % se FiglioS si trova già negli stati visitati allora non lo aggiungo agli StatiFigli
    generaStatiFigli(nodo(S,AzioniPerS), Visitati, AltreAzioni, AltriFigli).

contaPassi :- 
    passi(X),
    retractall(passi(_)),
    X1 is X + 1,
    write(X1),
    write('\n'),
    assert(passi(X1)).