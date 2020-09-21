giorno(lunedi; martedi; mercoledi; giovedi; venerdi; sabato).
numeroSettimana(1..2).
oraNormale(1..5).
oraNormaleMinima(1..4).
oraFull(1..8).
insegna(projectManagement, muzzetto, 14).
insegna(ict, pozzato, 14).
insegna(linguaggiDiNullafacenza, gena, 20).
insegna(laGestioneDellaQualita, tomatis, 10).
insegna(linguaggiClientSide, micalizio, 20). % 78 ore (39 normali + 40 = 79).

%lezioni normali, il sabato (4/5 ore) e il venerdi(8 ore).
%6{lezione(Materia, Insegnante, Giorno, Settimana) : insegna(Materia, Insegnante, _), giorno(Giorno)}6 :- numeroSettimana(Settimana).

1{ settimana(NumeroSettimana, giornata(Materia, Insegnante, Giorno, Ora)) : oraNormale(Ora), insegna(Materia, Insegnante, _)} 1 :- 
        giorno(Giorno),numeroSettimana(NumeroSettimana).

4 {giornata(Materia,Insegnante,Giorno,Ora): oraNormale(Ora), insegna(Materia, Insegnante, _)} 5 :- giorno(Giorno), Giorno == sabato.
1 {giornata(Materia,Insegnante,Giorno,Ora): insegna(Materia, Insegnante, _)} 1 :- giorno(Giorno),oraFull(Ora), Giorno != sabato.

% per ogni ora di una giornata di lezioni, ci puo essere una e una sola ora

:- oraNormaleMinima(Ora), {giornata(Materia, Insegnante, sabato, Ora)} != 1.

% non ci possono essere sovrapposizioni di materie in un unica ora.

%:- insegna(Insegnante,Materia,_) , oraFull(Ora), giorno(Giorno) {giornata(Materia,Insegnante,Giorno,Ora)} > 1.
% :- giorno(Giorno), orario(Ora), { giornata(Materia, Insegnante, Giorno, Ora)} > 1.

% per ogni giorno,
% 2 {giornata(Materia,Insegnante,Giorno) : insegna(Materia, Insegnante, _)} 2 :- giorno(Giorno), Giorno != sabato.
% 1 {giornata(Materia,Insegnante,Giorno) : insegna(Materia, Insegnante, _)} 1 :- giorno(Giorno), Giorno == sabato.

%#show lezione/4.
#show settimana/2.