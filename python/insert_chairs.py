import sqlite3
# Kobling til databasen
connection = sqlite3.connect('../trondheim-teater.db')
c = connection.cursor()

#Globale variabler
omraade_id = -1
hall_parts = []
stol_id = 0

#Setter inn data for sal som fortsatter med samme teller over stolene over flere rader.
#Dvs. at den starter ikke med plassnummer 1 for hver rad.
#input_path: path til filen som inneholder salen
#antall_plasser: antall plasser i salen
#sal_nummer: salnummeret
#billettkjopID: billettkjopID
#fremvisningID: fremvisningID
#prisklasseID: prisklasseID
def load_hall_no_sep(input_path, antall_plasser, sal_nummer, billettkjopID, fremvisningID, prisklasseID):
    global omraade_id
    global hall_parts
    global stol_id
    rows = []
    local_omraade_id = -1

    
    #Finner antall plasser i hver rad slik at vi kan sette inn riktig radnummer i databasen
    for line in open(input_path):
        if (line.startswith("Dato")):
            continue
        local_hall_parts = 0
        if (not line[0].isdigit() and line[0] != "x"):
            rows.append(0)
            local_hall_parts += 1
        elif (line != ""):
            rows[local_hall_parts-1] += 1

    #Itererer gjennom filen og setter inn data i databasen for hver stol
    for line in open(input_path):
        if (line.startswith("Dato")):
            continue
        slicedline = line.rstrip("\n")
        #Hvis linjen ikke starter med et tall og ikke er en rad med x-er, så er det et nytt område
        if (not slicedline[0].isdigit() and slicedline != "x"):
            new_omraade = True
            for omraade in hall_parts:
                if (slicedline in omraade):
                    omraade_id = omraade[1]
                    new_omraade = False
            if (new_omraade):                        
                omraade_id = len(hall_parts) + 1
                hall_parts.append((slicedline, omraade_id))
                c.execute("""
                          INSERT INTO Omraade (id, Navn)
                          VALUES(?,?);""", (omraade_id, slicedline))
            local_omraade_id += 1

        #Hvis linjen ikke er et område, så er det en rad med stoler
        else:
            slicedline = slicedline[::-1]
            for i in range(0, len(slicedline)):
                #Hvis det er en x, så er det ikke en stol
                if (slicedline[i] == "x"):
                    antall_plasser -= 1
                    continue
                #Hvis det er en stol, så setter vi inn stol i databasen
                else:
                    stol_id += 1
                    c.execute("""
                    INSERT INTO Stol (Id, RadNummer, StolNummer, SalNummer, OmraadeID)
                    VALUES (?, ?, ?, ?, ?);
                    """, (stol_id, rows[local_omraade_id], antall_plasser, sal_nummer, omraade_id))
                    if (slicedline[i] == "1"):
                        c.execute("""
                        INSERT INTO Billett (BillettkjopID, StolId, FremvisningId, PrisklasseId)
                        VALUES (?, ?, ?, ?);
                        """, (billettkjopID, stol_id, fremvisningID, prisklasseID))
                    antall_plasser -= 1
            rows[local_omraade_id] -= 1


#Setter inn data for sal som har forskjellige tellere over stolene over flere rader.
#Dvs. at den starter med plassnummer 1 for hver rad.
#input_path: path til filen som inneholder salen
#sal_nummer: salnummeret
#billettkjopID: billettkjopID
#fremvisningID: fremvisningID
#prisklasseID: prisklasseID    
def load_hall_with_sep(input_path, sal_nummer, billettkjopID, fremvisningID, prisklasseID):
    global omraade_id
    global hall_parts
    global stol_id
    rows = []
    local_omraade_id = -1
    antall_plasser = 0
    plass_nummer = 0
    show_date = ""


    #Finner antall plasser i hver rad slik at vi kan sette inn riktig radnummer i databasen
    for line in open(input_path):
        if (line.startswith("Dato")):
            show_date = line.rstrip("\n")
            continue
        number_hall_parts = 0
        if (not line[0].isdigit() and line[0] != "x"):
            rows.append(0)
            number_hall_parts += 1
        elif (line != ""):
            rows[number_hall_parts-1] += 1

    #Itererer gjennom filen og setter inn data i databasen for hver stol
    for line in open(input_path):
        if (line.startswith("Dato")):
            continue
        plass_nummer = 0
        slicedline = line.rstrip("\n")
        #Hvis linjen ikke starter med et tall og ikke er en rad med x-er, så er det et nytt område
        if (not slicedline[0].isdigit() and slicedline != "x"):
            new_omraade = True
            for omraade in hall_parts:
                if (slicedline in omraade):
                    omraade_id = omraade[1]
                    new_omraade = False
            if (new_omraade):                        
                omraade_id = len(hall_parts) + 1
                hall_parts.append((slicedline, omraade_id))
                c.execute("""
                          INSERT INTO Omraade (id, Navn)
                          VALUES(?,?);""", (omraade_id, slicedline))
                
            local_omraade_id += 1
        #Hvis linjen ikke er et område, så er det en rad med stoler
        else:
            for i in range(0, len(slicedline)):
                #Hvis det er en x, så er det ikke en stol
                if (slicedline[i] == "x"):
                    continue
                #Hvis det er en stol, så setter vi inn stol i databasen
                else:
                    plass_nummer += 1
                    antall_plasser += 1
                    stol_id += 1
                    c.execute("""
                    INSERT INTO Stol (Id, RadNummer, StolNummer, SalNummer, OmraadeID)
                    VALUES (?, ?, ?, ?, ?);
                    """, (stol_id, rows[local_omraade_id], plass_nummer, sal_nummer, omraade_id))

                    if (slicedline[i] == "1"):
                        c.execute("""
                        INSERT INTO Billett (BillettkjopID, StolId, FremvisningId, PrisklasseId)
                        VALUES (?, ?, ?, ?);
                        """, (billettkjopID, stol_id, fremvisningID, prisklasseID))

            rows[local_omraade_id] -= 1

#Setter inn Billettkjop til en adminbruker. 
c.execute("""
INSERT INTO Billettkjop (kundeID, kjopstidspunkt) VALUES
    (1, "2024-02-03 12:00:03");
          """)
connection.commit()

#Bruker funkjsonene for å sette inn data i databasen
load_hall_no_sep("./data/hovedscenen.txt", 524, 1, 1, 3, 1)
load_hall_with_sep("./data/gamle-scene.txt", 2, 1, 6, 6)
connection.commit()



