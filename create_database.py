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


c.execute("""CREATE TABLE Person (
    PersonID        INTEGER PRIMARY KEY AUTOINCREMENT
                            UNIQUE
                            NOT NULL,
    Email           TEXT    NOT NULL
                            UNIQUE,
    Name            TEXT    NOT NULL,
    AnsettelsesForm INTEGER REFERENCES Ansettelse (AnsettelseID) 
                            NOT NULL
);""")


c.execute("""CREATE TABLE Ansettelse (
    AnsettelseID INTEGER UNIQUE
                         NOT NULL
                         PRIMARY KEY AUTOINCREMENT,
    Type                 UNIQUE
                         NOT NULL
);""")


c.execute("""CREATE TABLE Akt (
    Aktnummer      INTEGER PRIMARY KEY
                           UNIQUE
                           NOT NULL,
    Navn           TEXT,
    TeaterstykkeID INTEGER REFERENCES Teaterstykke (TeaterstykkeID) 
                           NOT NULL
);""")


c.execute("""CREATE TABLE Teaterstykke (
    TeaterstykkeID     INTEGER PRIMARY KEY AUTOINCREMENT
                   UNIQUE
                   NOT NULL,
    Navn   TEXT    NOT NULL,
    Sesong TEXT    NOT NULL
);""")

c.execute("""CREATE TABLE Ansvar (
    PersonID       INTEGER REFERENCES Person (PersonID) 
                           NOT NULL,
    TeaterstykkeID INTEGER REFERENCES Teaterstykke (TeaterstykkeID) 
                           NOT NULL,
    Ansvarsområde  TEXT    NOT NULL,
    PRIMARY KEY (
        PersonID,
        TeaterstykkeID,
        Ansvarsområde
    )
);""")

c.execute("""CREATE TABLE Roller (
    PersonID  INTEGER REFERENCES Person (PersonID) 
                      NOT NULL,
    AktNummer INTEGER NOT NULL
                      REFERENCES Akt (Aktnummer),
    Rollenavn         UNIQUE
                      NOT NULL,
    PRIMARY KEY (
        PersonID,
        AktNummer,
        Rollenavn
    )
);""")


ic(c.execute("""SELECT * FROM Kundeprofil;""").fetchall())

connection.commit()


def cleanup():
    c.execute("DROP TABLE Kundeprofil;")
    connection.close()


cleanup()
