import sqlite3
from icecream import ic
connection = sqlite3.connect('teater.db')
c = connection.cursor()

c.execute("""
INSERT INTO Kundeprofil (Navn, Adresse, Telefonnummer)
VALUES ('Kari Nordmann', 'Osloveien8', '90015308');
""")

c.execute("""
INSERT INTO Teatersal (SalNummer, AntallPlasser)
VALUES (1, 50);
""")

c.execute("""
INSERT INTO Område (id, OmrådeNavn)
VALUES (1, 'Balkong');
""")

c.execute("""
INSERT INTO Stol (RadNummer, StolNummer, SalNummer, OmrådeID)
VALUES (1, 1, 1, 1);
""")

connection.commit()


ic(c.execute("""SELECT * FROM Kundeprofil;""").fetchall())