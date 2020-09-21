heuristic(StatoIniziale, H) :-
    findall(X, finale(X), StatiFinali),
    trovaMedia(StatoIniziale, StatiFinali, H).

trovaMedia(StatoIniziale, [Head | Tail], H) :-
    calcolaEuristica(StatoIniziale, Head, SommaParziale),
    trovaSomma(StatoIniziale, Tail, SommaParziale, Somma), 
    length([Head | Tail], X),
    H is Somma / X.

trovaSomma(_, [], SommaParziale, SommaParziale) :- !.
trovaSomma(StatiFinali, [Head | Tail], SommaParziale, Somma) :-
    calcolaEuristica(StatiFinali, Head, H),
    NuovaSomma is SommaParziale + H,
    trovaSomma(StatiFinali, Tail, NuovaSomma, Somma).



calcolaEuristica(pos(Riga, Colonna), pos(Riga1, Colonna1), H) :- 
    H is abs(Riga1 - Riga) + abs(Colonna1 - Colonna).


