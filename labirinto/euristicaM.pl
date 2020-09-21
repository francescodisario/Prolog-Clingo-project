heuristic(StatoIniziale, H) :-
        findall(X, finale(X), StatiFinali),
        trovaMinimo(StatoIniziale, StatiFinali, H).

trovaMinimo(StatoIniziale, [Head | Tail], H) :-
        calcolaEuristica(StatoIniziale, Head, MinimoParziale),
        trovaAux(StatoIniziale, Tail, MinimoParziale, H).

trovaAux(_, [], Min, Min) :- !.
trovaAux(StatoIniziale, [Head | Tail], MinimoParziale, Risultato) :-
        calcolaEuristica(StatoIniziale, Head, Valore),
        NuovoMinimo is min(Valore, MinimoParziale),
        trovaAux(StatoIniziale, Tail, NuovoMinimo, Risultato).

calcolaEuristica(pos(Riga, Colonna), pos(Riga1, Colonna1), H) :-
        H is abs(Riga1 - Riga) + abs(Colonna1 - Colonna).
