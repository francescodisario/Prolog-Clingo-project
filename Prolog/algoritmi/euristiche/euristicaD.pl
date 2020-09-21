heuristic(pos(Riga, Colonna), H) :-
    finale(pos(Riga1, Colonna1)),
    sqrt(((abs(Riga1 - Riga)**2) + (abs(Colonna1 - Colonna)**2)), RadiceQuadrata),
    H is truncate(RadiceQuadrata).