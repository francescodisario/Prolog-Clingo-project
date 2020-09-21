load(Labirinto, Algoritmo, Euristica) :- 
   atom_concat('dominio/', Labirinto, PathLabirinto),
   atom_concat('algoritmi/', Algoritmo, PathAlgoritmo),
   atom_concat('algoritmi/euristiche/', Euristica, PathEuristica),
   consult(PathLabirinto),
   consult(PathEuristica),
   consult(PathAlgoritmo),
   consult('azioni/azioni.pl').

   
load(Labirinto, Algoritmo) :- 
    atom_concat('dominio/', Labirinto, PathLabirinto),
    atom_concat('algoritmi/', Algoritmo, PathAlgoritmo),
    consult(PathLabirinto),
    consult(PathAlgoritmo),
    consult('azioni/azioni.pl').

