import sqlite3
from icecream import ic
connection = sqlite3.connect('teater.db')
c = connection.cursor()

omraade_id = -1

c.execute("""
INSERT INTO Kundeprofil (Navn, Adresse, Telefonnummer)
VALUES ('Kari Nordmann', 'Osloveien8', '90015308');
""")

c.execute("""
INSERT INTO Teatersal (SalNummer, AntallPlasser)
VALUES (1, 50);
""")

c.execute("""
INSERT INTO Omraade (id, OmraadeNavn)
VALUES (1, 'Balkong');
""")

c.execute("""
INSERT INTO Stol (RadNummer, StolNummer, SalNummer, OmraadeID)
VALUES (1, 1, 1, 1);
""")

connection.commit()


ic(c.execute("""SELECT * FROM Kundeprofil;""").fetchall())

def load_hall(input_path, antall_plasser, sal_nummer):
    hall_name = input_path.split("/")[-1].split(".")[0]
    hall_part = ""
    rows = []
    local_omraade_id = -1

    c.execute("""INSERT INTO Teatersal (SalNummer, AntallPlasser)
                    VALUES (?, ?);
                    """, (sal_nummer, antall_plasser))
    
    
    for line in open(input_path):
        hall_parts = 0
        if (line[0].isalpha):
            rows.append(0)
            hall_parts += 1
        else:
            rows[hall_parts-1] += 1

    for line in open(input_path):
        linelenght = len(line)
        slicedline = line[linelenght::-1]
        if (slicedline[0].isalpha):
            global omraade_id
            omraade_id += 1
            c.execute("""
                      INSERT INTO Omraade (id, OmraadeNavn)
                        VALUES (?, ?);
                        """, (omraade_id, slicedline))
            local_omraade_id += 1
        else:
            linelenght = len(line)
            slicedline = line[linelenght::-1]
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

        

