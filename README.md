## Progetto di Prolog (Labirinto)
  Il progetto di prolog è così strutturato:
  * Algoritmi: contenente gli algoritmi Iterative Deepening, Ida*, A*, BFS, DFS, e Ricerca a profondità limitata;
  * Euristiche: contenente le euristiche utilizzate per gli algoritmi informati;
  * Azioni: contenente le azioni dell'agente;
  * dominio: contenente i labirinti;
  * java: contenente un tool in javaFx per la creazione di labirinti e l'esecuzione di A*.
### Editor di Labirinti (labirinto.jar)
Per eseguire il codice è necessario avere almeno le sdk 1.8. 
È allegato anche il codice sorgente da aprire con Intellij.

#### Avvio ed esecuzione
Per generare il labirinto, inserire delle dimensioni (di default è settato a 10x10) e la posizione iniziale del robot (casella blu) e cliccare su genera. 
Per inserire delle uscite, cliccare col tasto destro del mouse sulla cella corrispondente (la cella assumerà il colore verde).
Per inserire degli ostacoli, cliccare una volta col tasto sinistro e si entrerà in modalità "assegna ostacoli". Successivamente, scorrere sulle celle desiderate (le celle diventeranno di colore rosso). Per uscire dalla modalità, cliccare nuovamente il tasto sinistro. 
Infine, per eliminare ostacoli/uscite, cliccare semplicemente sulla cella colorata e ritornerà vuota (colore bianco).
Cliccando il pulsante Salva, verrà salvato il file labirinto.pl corrispondente al labirinto disegnato. 
Cliccando sul pulsante Simula, è possibile eseguire l'algoritmo A* direttamente dal tool java. 

#### Importante!
Per funzionare, il file jar deve essere nella stessa cartella dei seguenti file: 
* esegui.pl (per effettuare le varie consult)
* prova.pl (contenente la strategia di ricerca -- di default è A*)
* euristica.pl
* azioni.pl
* labirinto.pl

È possibile sostituire il file euristica.pl e prova.pl con altri file, in modo da provare con altre eurisitiche/strategie. L'importante è mantenere lo stesso filename. 

## Progetto di Asp (Calendario)
Todo