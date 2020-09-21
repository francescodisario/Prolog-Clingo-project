heuristic(pos(Riga, Colonna), H) :- 
    finale(pos(Riga1, Colonna1)),
    H is abs(Riga1 - Riga) + abs(Colonna1 - Colonna).