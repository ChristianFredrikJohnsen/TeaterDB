import sqlite3
from icecream import ic

connection = sqlite3.connect('teater.db')
c = connection.cursor()

c.execute("""
CREATE TABLE if NOT EXISTS Kundeprofil
(id INTEGER PRIMARY KEY, Navn STRING, Adresse STRING, Telefonnummer STRING);
""")

# Add foreign key to Fremvisning at a later stage.
c.execute("""
CREATE TABLE IF NOT EXISTS Teatersal
    (SalNummer INTEGER PRIMARY KEY, AntallPlasser INTEGER);
""")


c.execute("""
    CREATE TABLE IF NOT EXISTS Område
        (id INTEGER PRIMARY KEY, OmrådeNavn TEXT);
""")

c.execute("""
CREATE TABLE IF NOT EXISTS Stol
    (RadNummer INTEGER, StolNummer INTEGER, SalNummer INTEGER, OmrådeID INTEGER,
    FOREIGN KEY (SalNummer) REFERENCES Teatersal(SalNummer)
    FOREIGN KEY (OmrådeID) REFERENCES Område(id),
    PRIMARY KEY (RadNummer, StolNummer, SalNummer, OmrådeID));
""")



def cleanup():
    c.execute("DROP TABLE Kundeprofil;")
    c.execute("DROP TABLE Teatersal;")
    c.execute("DROP TABLE Område;")
    c.execute("DROP TABLE Stol;")
    connection.close()

connection.commit()
# cleanup()
