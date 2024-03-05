import sqlite3
from icecream import ic
connection = sqlite3.connect('teater.db')
c = connection.cursor()

c.execute("""
CREATE TABLE if NOT EXISTS Kundeprofil
(id INTEGER PRIMARY KEY, Navn STRING, Adresse STRING, Telefonnummer STRING);
""")

c.execute("""
INSERT INTO Kundeprofil (Navn, Adresse, Telefonnummer)
VALUES ('Kari Nordmann', 'Osloveien8', '90015308');
""")

ic(c.execute("""SELECT * FROM Kundeprofil;""").fetchall())



def cleanup():
    c.execute("DROP TABLE Kundeprofil;")
    connection.close()


cleanup()
