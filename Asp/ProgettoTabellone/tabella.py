from clyngor import ASP, solve
from vincoli import *

# MAIN:
answers = solve('progetto-rigidi.pl', nb_model=1)
i = 1
for modello in answers:
    print("\nModello ", i, " -----------------------------------")
    i += 1
    lezioni = getPredicato(modello, "lezione")

    for settimana in range(1, 25):
        lezioniSettimana = getLezioniBySettimana(lezioni, settimana)
        print()
        print("settimana ", settimana, ": ")
        for giorno in giorniSettimana:
            lezioniGiorno = getLezioniByGiorno(lezioniSettimana, giorno)
            print()
            print("\t", giorno, ": ")
            for ora in range(1, 9):
                lezioniOra = getLezioniByOra(lezioniGiorno, ora)
                for lezione in lezioniOra:
                    print("\t\t", ora, ": ", lezione[0], "  ", lezione[1])

    daAssegnare = getPredicato(modello, "daAssegnare")
    print()
    controllaOreAssegnate(daAssegnare, lezioni)

