giorniSettimana = ['lunedi', 'martedi', 'mercoledi', 'giovedi', 'venerdi', 'sabato']

onlySabato = ['sabato']

def getPredicato(modello, nomePredicato):
    listaPredicati = list()
    for predicato in modello:
        if predicato[0] == nomePredicato:
            listaPredicati.append(predicato)
    return listaPredicati


def getLezioniBySettimana(lezioni, settimana):
    listaLezione = list()
    for lezione in lezioni:
        contenuto = lezione[1]
        if int(contenuto[2]) == settimana:
            listaLezione.append(contenuto)
    return listaLezione


def getLezioniByGiorno(lezioni, giorno):
    giorni = {'lunedi': 1, 'martedi': 2, 'mercoledi': 3, 'giovedi': 4, 'venerdi': 5, 'sabato': 6}
    listaGiorno = list()
    for lezione in lezioni:
        if lezione[3] == giorni[giorno]:
            listaGiorno.append(lezione)
    return listaGiorno

def getOraDaAssegnare(daAssegnare, materia):
    for assegnare in daAssegnare:
        if assegnare[1][0] == materia:
            return assegnare[1][1]



def getLezioniByOra(lezioniGiorno, ora):
    listaOre = list()
    for oraCorrente in lezioniGiorno:
        if int(oraCorrente[4]) == ora:
            listaOre.append(oraCorrente)
    return listaOre


def getOreMateria(lezioni, materia):
    somma = 0
    for lezione in lezioni:
        contenuto = lezione[1]
        if contenuto[0] == materia:
            somma = somma + 1
    return somma