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
