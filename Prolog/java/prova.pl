prova(Soluzione) :-
    iniziale(S),
    heuristic(S, H),
    aggiungiAListaAperta(nodo(S,[], H, 0), [], CodaNodiAperti),
    ricerca(CodaNodiAperti, [], Soluzione),
    write(Soluzione). 

ricerca([nodo(S, AzioniPerS, _, _)|_], _, AzioniPerS) :-
    finale(S) , !.

ricerca([nodo(S, AzioniPerS, F, G) | CodaNodiAperti], ClosedList , Soluzione) :-
    aggiungiAListaChiusa(nodo(S, AzioniPerS, F, G), ClosedList, NuovaListaChiusa),
    findall(Az, applicabile(Az, S), AzioniApplicabili),
    espandiNodo(nodo(S, AzioniPerS, F, G), CodaNodiAperti, NuovaListaChiusa, AzioniApplicabili, NuovaCodaNodiAperti),
    ricerca(NuovaCodaNodiAperti, NuovaListaChiusa, Soluzione).

espandiNodo(_, Coda, _, [], Coda) :- !.

espandiNodo(nodo(S, Azioni, F, G), NodiAperti, NodiChiusi, [Az | AltreAzioni], NuovaCodaNodiAperti) :-
   
    generaFiglio(nodo(S, Azioni, F, G), Az, nodo(SNuovo, Azioni1, F1, G1)),
    valutaNodo(nodo(SNuovo, Azioni1, F1, G1), NodiAperti, NodiChiusi, NuovaCodaAperti, NuovaCodaChiusi), !,
    espandiNodo(nodo(S, Azioni, F, G), NuovaCodaAperti, NuovaCodaChiusi, AltreAzioni, NuovaCodaNodiAperti).

espandiNodo(nodo(S, Azioni, F, G), CodaNodiAperti, NodiChiusi, [_ | AltreAzioni], NuovaCodaNodiAperti) :-
    espandiNodo(nodo(S, Azioni, F, G), CodaNodiAperti, NodiChiusi, AltreAzioni, NuovaCodaNodiAperti).

% Il nodo è un nodo nuovo
valutaNodo(nodo(S, Azioni, F, G), NodiAperti, NodiChiusi, NuovaCodaAperti, NodiChiusi) :-
    \+member(nodo(S, _, _, _), NodiAperti),
    \+member(nodo(S, _, _, _), NodiChiusi),
    !,
    aggiungiAListaAperta(nodo(S, Azioni, F, G), NodiAperti, NuovaCodaAperti).

% Il nodo è stato già visitato ed è in aperti
valutaNodo(Nodo, NodiAperti, NodiChiusi, NuovaCodaAperti, NodiChiusi) :-
    controllaNodo(Nodo, NodiAperti, NuovaCoda), !,
    aggiungiAListaAperta(Nodo, NuovaCoda, NuovaCodaAperti).


% Il nodo è stato chiuso
valutaNodo(Nodo, NodiAperti, NodiChiusi, NuovaCodaAperti, NuovaCoda) :-
    controllaNodo(Nodo, NodiChiusi, NuovaCoda),
    aggiungiAListaAperta(Nodo, NodiAperti, NuovaCodaAperti).

controllaNodo(nodo(S, _, F, _), [nodo(S1, _, F1, _) | T], T) :-
    S == S1, !,
    F < F1.
controllaNodo(Nodo, [H | T], [H | Risultato]) :-
    controllaNodo(Nodo, T, Risultato).

generaFiglio(nodo(S, Azioni, _, G), Az, nodo(SNuovo, [Az | Azioni], F1, G1)) :-
    trasforma(Az, S, SNuovo),
    heuristic(SNuovo, H1),
    G1 is G + 1,
    F1 is G1 + H1.

aggiungiAListaChiusa(Nodo, Lista, [Nodo | Lista]).

aggiungiAListaAperta(X, [], [X]) :- !. 
aggiungiAListaAperta(nodo(S,AzioniPerS,F1,G), [nodo(S2,Azioni2,F2,G2)|Rest], [nodo(S,AzioniPerS,F1,G),nodo(S2,Azioni2,F2,G2)|Rest]) :-
    F1 =< F2, !.
aggiungiAListaAperta(nodo(S,AzioniPerS,F1,G), [nodo(S2,Azioni2,F2,G2)|Rest0], [nodo(S2,Azioni2,F2,G2)|Rest]) :-
    aggiungiAListaAperta(nodo(S,AzioniPerS,F1,G), Rest0, Rest).


