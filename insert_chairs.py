import sqlite3
from icecream import ic
connection = sqlite3.connect('trondheim-teater.db')
c = connection.cursor()

omraade_id = -1
hall_parts = []


def load_hall_no_sep(input_path, antall_plasser, sal_nummer):
    global omraade_id
    global hall_parts
    rows = []
    local_omraade_id = -1

    
    
    for line in open(input_path):
        if (line.startswith("Dato")):
            continue
        local_hall_parts = 0
        if (not line[0].isdigit() and line[0] != "x"):
            rows.append(0)
            local_hall_parts += 1
        elif (line != ""):
            rows[local_hall_parts-1] += 1

    for line in open(input_path):
        if (line.startswith("Dato")):
            continue
        slicedline = line.rstrip("\n")
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

        else:
            slicedline = slicedline[::-1]
            for i in range(0, len(slicedline)):
                if (slicedline[i] == "x"):
                    antall_plasser -= 1
                    continue
                else:
                    c.execute("""
                    INSERT INTO Stol (RadNummer, StolNummer, SalNummer, OmraadeID)
                    VALUES (?, ?, ?, ?);
                    """, (rows[local_omraade_id], antall_plasser, sal_nummer, omraade_id))
                    antall_plasser -= 1
            rows[local_omraade_id] -= 1
        
def load_hall_with_sep(input_path, sal_nummer):
    global omraade_id
    global hall_parts
    rows = []
    local_omraade_id = -1
    antall_plasser = 0
    plass_nummer = 0


    
    for line in open(input_path):
        if (line.startswith("Dato")):
            continue
        number_hall_parts = 0
        if (not line[0].isdigit() and line[0] != "x"):
            rows.append(0)
            number_hall_parts += 1
        elif (line != ""):
            rows[number_hall_parts-1] += 1

    for line in open(input_path):
        if (line.startswith("Dato")):
            continue
        plass_nummer = 0
        slicedline = line.rstrip("\n")
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
            
        else:
            slicedline = slicedline[::-1]
            for i in range(0, len(slicedline)):
                if (slicedline[i] == "x"):
                    continue
                else:
                    plass_nummer += 1
                    antall_plasser += 1
                    c.execute("""
                    INSERT INTO Stol (RadNummer, StolNummer, SalNummer, OmraadeID)
                    VALUES (?, ?, ?, ?);
                    """, (rows[local_omraade_id], plass_nummer, sal_nummer, omraade_id))

            rows[local_omraade_id] -= 1
    


load_hall_no_sep("data/hovedscenen.txt", 524, 1)
load_hall_with_sep("data/gamle-scene.txt", 2)

connection.commit()



