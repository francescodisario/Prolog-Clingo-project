from clyngor import ASP, solve
from vincoli import *


answers = solve('progetto-rigidi.pl', nb_model=10000)

print(" True = vincolo rispettato, False = vincolo non rispettato \n")
i = 0
for modello in answers:
    lezioni = getPredicato(modello, "lezione")
    if not controllaVincoloUno(lezioni):
        print("vincolo 1 non ha funzionato")
        break
    if not controllaVincoloDue(lezioni):
        print("vincolo 2 non ha funzionato")
        break
    if not controllaVincoloTre(lezioni):
        print("vincolo 3 non ha funzionato")
        break
    if not controllaVincoloQuattro(lezioni):
        print("vincolo 4 non ha funzionato")
        break
    if not controllaVincoloCinque(lezioni):
        print("vincolo 5 non ha funzionato")
        break
    if not controllaVincoloSei(lezioni):
        print("vincolo 6 non ha funzionato")
        break
    if not controllaVincoloSette(lezioni, modello):
        print("vincolo 7 non ha funzionato")
        break
    if not controllaVincoloAuspicabileUno(lezioni,modello):
        print("vincolo auspicabile 1 non ha funzionato")
        break
    if not controllaVincoloAuspicabileDue(lezioni):
        print("vincolo auspicabile 2 non ha funzionato")
        break
    if not controllaVincoloAuspicabileTre(lezioni, modello):
        print("vincolo auspicabile 3 non ha funzionato")
        break
    if not controllaVincoloAuspicabileQuattro(lezioni):
        print("vincolo auspicabile 4 non ha funzionato")
        break
    i += 1
    print(i)
print (" ----------- FINE ----------------")