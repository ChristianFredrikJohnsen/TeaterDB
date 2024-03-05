import sqlite3
from icecream import ic

connection = sqlite3.connect("teater.db")
c = connection.cursor()


### Bilett avdelingen kommer her ###
c.execute(
    """
    CREATE TABLE if NOT EXISTS Kundeprofil (
    id INTEGER PRIMARY KEY, 
    Navn STRING, 
    Adresse STRING, 
    Telefonnummer INTEGER);
    """
)
c.execute(
    """
    CREATE TABLE if NOT EXISTS Billettkjop 
        (id INTEGER PRIMARY KEY, 
        KundeID INTEGER NOT NULL, 
        Kjopstidspunkt TIMESTAMP, 
        FOREIGN KEY (KundeID) REFERENCES Kundeprofil(id))
        ON DELETE CASCADE ON UPDATE CASCADE;
    """
)

c.execute(
    """
    CREATE TABLE if NOT EXISTS Billett 
        (
    """
)

#### Insert some rows of data ####
c.execute(
    """INSERT INTO Kundeprofil (Navn, Adresse, Telefonnummer) VALUES ('Ola Nordmann', 'Nordveien 1', 12345678);"""
)
c.execute(
    """
    CREATE TABLE IF NOT EXISTS Område
        (id INTEGER PRIMARY KEY, OmrådeNavn TEXT);
"""
)

c.execute(
    """
CREATE TABLE IF NOT EXISTS Stol
    (RadNummer INTEGER, StolNummer INTEGER, SalNummer INTEGER, OmrådeID INTEGER,
    FOREIGN KEY (SalNummer) REFERENCES Teatersal(SalNummer)
    FOREIGN KEY (OmrådeID) REFERENCES Område(id),
    PRIMARY KEY (RadNummer, StolNummer, SalNummer, OmrådeID));
"""
)


def cleanup():
    c.execute("DROP TABLE Kundeprofil;")
    c.execute("DROP TABLE Billettkjop;")
    c.execute("DROP TABLE Teatersal;")
    c.execute("DROP TABLE Område;")
    c.execute("DROP TABLE Stol;")
    connection.close()


connection.commit()
# # cleanup()
