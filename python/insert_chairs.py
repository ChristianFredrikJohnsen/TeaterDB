import sqlite3

# Global variables
omraade_id: int = -1
area_names: list[tuple[str, int]] = []
"""
Used to insert new areas into the database.
"""
stol_id: int = 0


def get_number_of_rows_in_areas(input_path: str, rows: list) -> None:
    """
    Finds the number of rows in each area.
    """
    for line in open(input_path):
        if (line.startswith("Dato")):
            continue
        if (not line[0].isdigit()):
            rows.append(0)
        elif (line != ""):
            rows[-1] += 1

def omraade_insert(c: sqlite3.Cursor, omraade_name: str, id: str) -> None:
    """
    Inserts a new area into the database, if it doesn't already exists.
    """
    global area_names
    new_omraade = True
    for omraade in area_names:
        if (omraade_name in omraade):
            omraade_id = omraade[1]
            new_omraade = False
    if (new_omraade):                        
        omraade_id = len(area_names) + 1
        area_names.append((omraade_name, omraade_id))
        c.execute("INSERT INTO Omraade (id, Navn) VALUES(?,?);", (omraade_id, omraade_name))
    return omraade_id


#Setter inn data for sal som fortsatter med samme teller over stolene over flere rader.
#Dvs. at den starter ikke med plassnummer 1 for hver rad.
#input_path: path til filen som inneholder salen
#antall_plasser: antall plasser i salen
#sal_nummer: salnummeret
#billettkjopID: billettkjopID
#fremvisningID: fremvisningID
#prisklasseID: prisklasseID
def load_hovedscenen(input_path: str, c: sqlite3.Cursor, antall_plasser: int, sal_nummer: int, billettkjopID: int, fremvisningID: int, prisklasseID: int) -> None:
    global omraade_id
    global area_names
    global stol_id
    rows: list[int] = []
    local_omraade_id = -1

    get_number_of_rows_in_areas(input_path, rows)

    #Itererer gjennom filen og setter inn data i databasen for hver stol
    for line in open(input_path):
        if (line.startswith("Dato")):
            continue
        slicedline = line.rstrip("\n")
        
        #Hvis linjen ikke starter med et tall og ikke er en rad med x-er, så er det et nytt område
        if (not slicedline[0].isdigit()):
            omraade_id = omraade_insert(c, slicedline, local_omraade_id)
            local_omraade_id += 1

        #Hvis linjen ikke er et område, så er det en rad med stoler
        else:
            slicedline = slicedline[::-1]
            for i in range(0, len(slicedline)):
                #Hvis det er en stol, så setter vi inn stol i databasen
                if (slicedline[i] != "x"):
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
def load_gamle_scene(input_path: str, c: sqlite3.Cursor, sal_nummer: int, billettkjopID: int, fremvisningID: int, prisklasseID: int) -> None:
    global omraade_id
    global area_names
    global stol_id
    rows: list[int] = []
    local_omraade_id = -1
    antall_plasser = 0
    plass_nummer = 0

    get_number_of_rows_in_areas(input_path, rows)
    
    #Itererer gjennom filen og setter inn data i databasen for hver stol
    for line in open(input_path):
        if (line.startswith("Dato")):
            continue
        plass_nummer = 0
        slicedline = line.rstrip("\n")
        #Hvis linjen ikke starter med et tall og ikke er en rad med x-er, så er det et nytt område
        
        if (not slicedline[0].isdigit()):
            omraade_id = omraade_insert(c, slicedline, local_omraade_id)
            local_omraade_id += 1
        
        #Hvis linjen ikke er et område, så er det en rad med stoler
        else:
            for i in range(0, len(slicedline)):
                #Hvis det er en stol, så setter vi inn stol i databasen
                if slicedline[i] != "x":
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


def main():
    """
    Creates a ticket purchase by admin, inserts all chairs into database and makes some purchases which are added to the admin purchase.
    """

    connection = sqlite3.connect('../trondheim-teater.db')
    c = connection.cursor()

    # Create a ticket purchase by admin.
    c.execute("INSERT INTO Billettkjop (kundeID, kjopstidspunkt) VALUES (1, '2024-02-03 12:00:03');")
    connection.commit()

    # Using the functions to insert into database.
    load_hovedscenen("./data/hovedscenen.txt", c, 524, 1, 1, 3, 1)
    load_gamle_scene("./data/gamle-scene.txt", c, 2, 1, 6, 6)
    connection.commit()

if __name__ == '__main__':
    main()



