%base di dati -------
giorno(1..6).
numeroSettimana(1..24).
numeroSettimanaNormale(1..6; 8..15; 17..24).
numeroSettimanaFullTime(7; 16).

oraNormaleMinima(1..4).
oraSabato(1..5).
oraFull(1..8).

%materie
insegna(projectManagement, muzzetto).
insegna(fondamentiDiIctEParadigmiDiProgrammazione, pozzato).
insegna(linguaggiDiMarkup, gena).
insegna(laGestionDellaQualita, tomatis).
insegna(ambientiDiSviluppoELinguaggiClientSidePerIlWeb, micalizio).
insegna(progettazioneGraficaEDesignDiInterfacce, terranova).
insegna(progettazioneDiBaseiDiDati, mazzei).
insegna(strumentiEMetodiDiInterazioneNeiSocialMedia, giordani).
insegna(acquisizioneEdElaborazioneDiImagginiStaticheGrafica, zanchetta).
insegna(accessibilitaeUsabilitaNellaProgettazioneMultimediale, gena).
insegna(marketingDigitale, muzzetto).
insegna(elementiDiFotografiaDigitale, vargiu).
insegna(risorseDigitaliPerIlProgettoCollaborazioneeDocumentazione, boniolo).
insegna(tecnologieServerSidePerIlWeb, damiano).
insegna(tecnicheeStrumentiDiMarketingDigitale, zanchetta).
insegna(introduzioneAlSocialMediaManagement, suppini).
insegna(acquisizioneedElaborazioneDelSuono, valle).
insegna(acquisizioneEdElaborazioneDiSequenzaDiImmaginiDigitali, ghidelli).
insegna(comunicazionePubblicitariaEComunicazionePubblica, gabardi).
insegna(semiologiaEMultimedialita, santangelo).
insegna(crossMediaArticolazioneDelleScrittureMultimediali, taddeo).
insegna(grafica3D, pozzato).
insegna(progettazioneESviluppoDiApplicazioniWebSuDispositiviMobileI, pozzato).
insegna(progettazioneESviluppoDiApplicazioniWebSuDispositiviMobileII, schifanella).
insegna(laGestioneDelleRisorseUmane, lombardo).
insegna(iVincoliGiuridiciDelProgettoDirittoDeiMedia, travostino).
insegna(libero, nessuno).
insegna(presentazione, presentatore).

daAssegnare(projectManagement, 14).
daAssegnare(fondamentiDiIctEParadigmiDiProgrammazione, 14).
daAssegnare(linguaggiDiMarkup, 20).
daAssegnare(laGestionDellaQualita, 10).
daAssegnare(ambientiDiSviluppoELinguaggiClientSidePerIlWeb, 20).
daAssegnare(progettazioneGraficaEDesignDiInterfacce, 10).
daAssegnare(progettazioneDiBaseiDiDati, 20).
daAssegnare(strumentiEMetodiDiInterazioneNeiSocialMedia, 14).
daAssegnare(acquisizioneEdElaborazioneDiImagginiStaticheGrafica, 14).
daAssegnare(accessibilitaeUsabilitaNellaProgettazioneMultimediale, 14).
daAssegnare(marketingDigitale, 10).
daAssegnare(elementiDiFotografiaDigitale, 10).
daAssegnare(risorseDigitaliPerIlProgettoCollaborazioneeDocumentazione, 10).
daAssegnare(tecnologieServerSidePerIlWeb, 20).
daAssegnare(tecnicheeStrumentiDiMarketingDigitale, 10).
daAssegnare(introduzioneAlSocialMediaManagement, 14).
daAssegnare(acquisizioneedElaborazioneDelSuono, 10).
daAssegnare(acquisizioneEdElaborazioneDiSequenzaDiImmaginiDigitali, 20).
daAssegnare(comunicazionePubblicitariaEComunicazionePubblica, 14).
daAssegnare(semiologiaEMultimedialita, 10).
daAssegnare(crossMediaArticolazioneDelleScrittureMultimediali, 20).
daAssegnare(grafica3D, 20).
daAssegnare(progettazioneESviluppoDiApplicazioniWebSuDispositiviMobileI, 10).
daAssegnare(progettazioneESviluppoDiApplicazioniWebSuDispositiviMobileII, 10).
daAssegnare(laGestioneDelleRisorseUmane, 10).
daAssegnare(iVincoliGiuridiciDelProgettoDirittoDeiMedia, 10).
daAssegnare(libero, 4).
daAssegnare(presentazione, 2).
%base di dati -------

%ordine semestre -----
ordineSemestre(fondamentiDiIctEParadigmiDiProgrammazione, ambientiDiSviluppoELinguaggiClientSidePerIlWeb).
ordineSemestre(ambientiDiSviluppoELinguaggiClientSidePerIlWeb, progettazioneESviluppoDiApplicazioniWebSuDispositiviMobileI).
ordineSemestre(progettazioneESviluppoDiApplicazioniWebSuDispositiviMobileI, progettazioneESviluppoDiApplicazioniWebSuDispositiviMobileII).
ordineSemestre(progettazioneDiBaseiDiDati, tecnologieServerSidePerIlWeb).
ordineSemestre(linguaggiDiMarkup, ambientiDiSviluppoELinguaggiClientSidePerIlWeb).
ordineSemestre(projectManagement, marketingDigitale).
ordineSemestre(marketingDigitale, tecnicheeStrumentiDiMarketingDigitale).
ordineSemestre(projectManagement, strumentiEMetodiDiInterazioneNeiSocialMedia).
ordineSemestre(projectManagement, progettazioneGraficaEDesignDiInterfacce).
ordineSemestre(acquisizioneEdElaborazioneDiImagginiStaticheGrafica, elementiDiFotografiaDigitale).
ordineSemestre(elementiDiFotografiaDigitale, acquisizioneEdElaborazioneDiSequenzaDiImmaginiDigitali).
ordineSemestre(acquisizioneEdElaborazioneDiImagginiStaticheGrafica, grafica3D).

%ordini di vincolo.
propedeucita(fondamentiDiIctEParadigmiDiProgrammazione,progettazioneDiBaseiDiDati).
propedeucita(tecnicheeStrumentiDiMarketingDigitale,introduzioneAlSocialMediaManagement).
propedeucita(comunicazionePubblicitariaEComunicazionePubblica,laGestioneDelleRisorseUmane).
propedeucita(tecnologieServerSidePerIlWeb,progettazioneESviluppoDiApplicazioniWebSuDispositiviMobileI).

% Sabato 4 o 5 ore, DEFINITIVO
1 { giornata(Giorno, Ora) } 1 :- oraSabato(Ora), Giorno == 6.

% lun - ven giornata da 8 ore
1 { giornata(Giorno, Ora)} 1 :- oraFull(Ora), giorno(Giorno), Giorno != 6.

% come funziona:
% 1. Per ogni settimana (4) creo un sabato composto da 4 o 5 ore
% 2. Per ogni settimana normale (3) creo un venerdì composto da 8 ore
% 3. Per ogni settimana piena (1) creo 5 giorni (lun - ven) composti da 8 ore

% lezione del sabato (4-5 ore)
4 {lezione(Materia, Insegnante, Settimana, Giorno, Ora) : insegna(Materia, Insegnante), giornata(Giorno, Ora)} 5
    :- numeroSettimana(Settimana), Giorno = 6.

% lezione del venerdì ordinario (8 ore)
1 {lezione(Materia, Insegnante, Settimana, Giorno, Ora) : insegna(Materia, Insegnante)} 1 :-
    numeroSettimanaNormale(Settimana),giornata(Giorno, Ora), Giorno = 5.

% lun - ven 8 ore (settimane full)
1 {lezione(Materia, Insegnante, Settimana, Giorno, Ora) : insegna(Materia, Insegnante)} 1 :-
    numeroSettimanaFullTime(Settimana), giornata(Giorno, Ora), Giorno != 6.

% impone alle lezioni del sabato di non avere ore libere (o 4 ore di fila o tutte e 5)
:- numeroSettimana(Settimana), oraNormaleMinima(Ora), {lezione(_, _, Settimana, 6, Ora)} != 1.

% vincoli di ore
:- daAssegnare(Materia, OreRichieste), {lezione(Materia, _, _, _, _)} != OreRichieste.

% vincolo 1 : un insegnante non può svolgere più di 4h di lezione
 :- lezione(Materia, Insegnante, Settimana, Giorno, Ora), {lezione(_, Insegnante, Settimana, Giorno, _)} > 4.

% vincolo 2 : una materia se presente in un giorno, deve comparire un minimo di 2h ed un massimo di 4h.
% -------------------------------------------------------------------------------------------------
 :- lezione(Materia, Insegnante, Settimana, Giorno, Ora), {lezione(Materia, _, Settimana, Giorno, _)} < 2.
 :- lezione(Materia, Insegnante, Settimana, Giorno, Ora), {lezione(Materia, _, Settimana, Giorno, _)} > 4.
% ------------------------------------------------------------------------------------------------------------

% vincolo 3 : le prime due ore di tutto il calendario devono contenere una presentazione.
%------------------------------------------------------
lezione(presentazione, presentatore, 1, 5, 1).
lezione(presentazione, presentatore, 1, 5, 2).
%------------------------------------------------------

% vincolo 4 : assegnare 2 blocchi da 2 ore di lezioni "libere".
% -----------------------------------------------------------------
:- lezione(libero, nessuno, Settimana, Giorno, Ora), lezione(libero, nessuno, Settimana, Giorno, Ora1), |Ora1 - Ora| > 1.

% vincolo 5: project management deve concludersi entro la settimana 7.
:- lezione(projectManagement, _, Settimana, _, _), Settimana > 7.

% vincolo 6: il corso di accessibilita deve iniziare prima della fine del corso di linguaggi di markup
:-  SettimanaMax = #max{S : lezione(linguaggiDiMarkup, _,  S, _, _)},
    GiornoMax = #max{G : lezione(linguaggiDiMarkup, _, SettimanaMax, G, _)},
    OraMax = #max{O : lezione(linguaggiDiMarkup, _, SettimanaMax, GiornoMax, O)},
    { lezione(accessibilitaeUsabilitaNellaProgettazioneMultimediale, _, Settimana, Giorno, Ora) :
                                                            Settimana * 100 + Giorno * 10 + Ora <=
                                                            SettimanaMax * 100 + GiornoMax * 10 + OraMax } < 1.
% vincolo 7
%ordineSemestre(projectManagement, marketingDigitale). we figa non serve nessuno dei due.
% che per ogni Materia2 di ordineSemestre(Materia1,Materia2) tutte le lezione(....) devono avere settimana,giorno,ora > rispetto a materia1
:- ordineSemestre(Materia1, Materia2), lezione(Materia1, _, Settimana1, Giorno1, Ora1), lezione(Materia2, _, Settimana2, Giorno2, Ora2),
            Settimana2 * 100 + Giorno2 * 10 + Ora2 <= Settimana1 * 100 + Giorno1 * 10 + Ora1.

%#show giornata/2.
#show lezione/5.
#show daAssegnare/2.
#show ordineSemestre/2.