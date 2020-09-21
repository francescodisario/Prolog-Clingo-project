from funzioniSupporto import *


# visualizza le ore assegnate ad ogni materia e le ore attese.
def controllaOreAssegnate(daAssegnare, lezioni):
    for materia in daAssegnare:
        nomeMateria = materia[1][0]
        oreDaAssegnare = materia[1][1]
        oreAssegnate = getOreMateria(lezioni, nomeMateria)
        print(nomeMateria, "=> ASSEGNATE:", oreAssegnate, " ATTESE:", oreDaAssegnare)


# un insegnante non può svolgere più di 4h di lezione in un giorno
def controllaVincoloUno(lezioni):
    for settimana in range(1, 24):
        lezioniSettimana = getLezioniBySettimana(lezioni, settimana)
        for giorno in giorniSettimana:
            lezioniGiorno = getLezioniByGiorno(lezioniSettimana, giorno)
            docentiTrovati = {}
            for lezione in lezioniGiorno:
                docente = lezione[1]
                if not (docente in docentiTrovati.keys()):
                    docentiTrovati[docente] = 1
                else:
                    docentiTrovati[docente] += 1
                    if docentiTrovati[docente] > 4:
                        return False
    return True


# una materia nello stesso giorno puo essere dalle 2 alle 4 ore
def controllaVincoloDue(lezioni):
    for settimana in range(1, 24):
        lezioniSettimana = getLezioniBySettimana(lezioni, settimana)
        for giorno in giorniSettimana:
            lezioniGiorno = getLezioniByGiorno(lezioniSettimana, giorno)
            materieTrovate = {}
            for lezione in lezioniGiorno:
                materia = lezione[0]
                if not (materia in materieTrovate.keys()):
                    materieTrovate[materia] = 1
                else:
                    materieTrovate[materia] += 1
            for m in materieTrovate:
                if materieTrovate[m] < 2 or materieTrovate[m] > 4:
                    return False

    return True


# le prime due ore del master sono dedicate alla presentazione
def controllaVincoloTre(lezioni):
    lezioniSettimana = getLezioniBySettimana(lezioni, 1)
    lezioniGiorno = getLezioniByGiorno(lezioniSettimana, 'venerdi')
    lezione1 = getLezioniByOra(lezioniGiorno, 1)
    lezione2 = getLezioniByOra(lezioniGiorno, 2)

    if lezione1[0][0] == "presentazione" and lezione2[0][0] == "presentazione":
        return True
    return False


# assegnare 2 blocchi da 2 ore di lezioni "libere".
def controllaVincoloQuattro(lezioni):
    blocchiLibero = 0
    for settimana in range(1, 24):
        lezioniSettimana = getLezioniBySettimana(lezioni, settimana)
        for giorno in giorniSettimana:
            lezioniGiorno = getLezioniByGiorno(lezioniSettimana, giorno)
            ora = 1
            while ora < 8:
                lezioneOra = getLezioniByOra(lezioniGiorno, ora)
                ora += 1
                lezioneOra2 = getLezioniByOra(lezioniGiorno, ora)
                if len(lezioneOra) > 0 and len(lezioneOra2) > 0 and lezioneOra[0][0] == "libero" and lezioneOra2[0][
                    0] == "libero":
                    blocchiLibero += 1
    return blocchiLibero >= 2


# project management deve concludersi entro la 7 settimana
def controllaVincoloCinque(lezioni):
    projectManagement = 0

    for settimana in range(1, 8):
        lezioniSettimana = getLezioniBySettimana(lezioni, settimana)
        for giorno in giorniSettimana:
            lezioniGiorno = getLezioniByGiorno(lezioniSettimana, giorno)
            for ora in range(1, 9):
                lezioniOra = getLezioniByOra(lezioniGiorno, ora)
                for lezione in lezioniOra:
                    if (lezione[0] == "projectManagement"):
                        projectManagement += 1
    return projectManagement == 14


def controllaVincoloSei(lezioni):
    linguaggiMarkup = 0

    for settimana in range(1, 24):
        lezioniSettimana = getLezioniBySettimana(lezioni, settimana)
        for giorno in giorniSettimana:
            lezioniGiorno = getLezioniByGiorno(lezioniSettimana, giorno)
            for ora in range(1, 9):
                lezioniOra = getLezioniByOra(lezioniGiorno, ora)
                for lezione in lezioniOra:
                    if (lezione[0] == "linguaggiDiMarkup"):
                        linguaggiMarkup += 1

                    if (lezione[0] == "accessibilitaeUsabilitaNellaProgettazioneMultimediale"):
                        return linguaggiMarkup < 20


def controllaVincoloSette(lezioni, modello):
    ordineSemestre = getPredicato(modello, "ordineSemestre")
    daAssegnare = getPredicato(modello, "daAssegnare")
    for semestre in ordineSemestre:
        materia1 = 0
        for settimana in range(1, 24):
            lezioniSettimana = getLezioniBySettimana(lezioni, settimana)
            for giorno in giorniSettimana:
                lezioniGiorno = getLezioniByGiorno(lezioniSettimana, giorno)
                for ora in range(1, 9):
                    lezioniOra = getLezioniByOra(lezioniGiorno, ora)
                    for lezione in lezioniOra:
                        if (lezione[0] == semestre[1][0]):
                            materia1 += 1
                        if (lezione[0] == semestre[1][1]):
                            oreDaAssegnare = getOraDaAssegnare(daAssegnare, semestre[1][0])
                            if materia1 != oreDaAssegnare:
                                return False
    return True


# VINCOLI AUSPICABILI -----------------------------

def controllaVincoloAuspicabileUno(lezioni, modello):
    lezioniDaControllare = getPredicato(modello, "daAssegnare")
    for lezioneGenerale in lezioniDaControllare:
        contatoreLezioneGenerale = 0
        inizioSettimana = 0
        for settimana in range(1, 24):
            lezioniSettimana = getLezioniBySettimana(lezioni, settimana)
            for giorno in giorniSettimana:
                lezioniGiorno = getLezioniByGiorno(lezioniSettimana, giorno)
                for ora in range(1, 9):
                    lezioniOra = getLezioniByOra(lezioniGiorno, ora)
                    for lezione in lezioniOra:
                        if lezione[0] == lezioneGenerale[1][0]:
                            if inizioSettimana == 0:
                                inizioSettimana = settimana
                            elif contatoreLezioneGenerale == lezioneGenerale[1][1] and (
                                    (settimana - inizioSettimana) > 6):
                                return False
                            contatoreLezioneGenerale += 1
    return True


def controllaVincoloAuspicabileDue(lezioni):
    lezioneCMASMTrovata = False
    lezioneISMMTrovata = False
    for settimana in range(1, 17):
        lezioniSettimana = getLezioniBySettimana(lezioni, settimana)
        for giorno in giorniSettimana:
            lezioniGiorno = getLezioniByGiorno(lezioniSettimana, giorno)
            for ora in range(1, 9):
                lezioniOra = getLezioniByOra(lezioniGiorno, ora)
                for lezione in lezioniOra:
                    if lezione[0] == "crossMediaArticolazioneDelleScrittureMultimediali":
                        if settimana == 16:
                            lezioneCMASMTrovata = True
                        elif (settimana < 16 or settimana > 16) and not lezioneCMASMTrovata:
                            return False
                    elif lezione[0] == "introduzioneAlSocialMediaManagement":
                        if settimana == 16:
                            lezioneISMMTrovata = True
                        elif (settimana < 16 or settimana > 16) and not lezioneISMMTrovata:
                            return False

    return lezioneISMMTrovata and lezioneCMASMTrovata


def controllaVincoloAuspicabileQuattro(lezioni):
    mobile = 0
    fineMobile = 0
    for settimana in range(1, 24):
        lezioniSettimana = getLezioniBySettimana(lezioni, settimana)
        for giorno in giorniSettimana:
            lezioniGiorno = getLezioniByGiorno(lezioniSettimana, giorno)
            for ora in range(1, 9):
                lezioniOra = getLezioniByOra(lezioniGiorno, ora)
                for lezione in lezioniOra:
                    if lezione[0] == "progettazioneESviluppoDiApplicazioniWebSuDispositiviMobileI":
                        if mobile < 9:
                            mobile += 1
                        else:
                            fineMobile = settimana
                    if lezione[0] == "progettazioneESviluppoDiApplicazioniWebSuDispositiviMobileII":
                        if (settimana - fineMobile) <= 2:
                            return True
                        else:
                            return False

def controllaVincoloAuspicabileTre(lezioni, modello):
    propedeucita = getPredicato(modello, "propedeucita")
    for materiaP in propedeucita:
        materia1 = 0
        for settimana in range(1, 24):
            lezioniSettimana = getLezioniBySettimana(lezioni, settimana)
            for giorno in giorniSettimana:
                lezioniGiorno = getLezioniByGiorno(lezioniSettimana, giorno)
                for ora in range(1, 9):
                    lezioniOra = getLezioniByOra(lezioniGiorno, ora)
                    for lezione in lezioniOra:
                        if (lezione[0] == materiaP[1][0]):
                            materia1 += 1
                        if (lezione[0] == materiaP[1][1]):
                            if materia1 < 4:
                                return False
    return True
