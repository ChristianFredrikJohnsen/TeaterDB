CREATE TABLE if NOT EXISTS Kundeprofil (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
    Navn STRING, 
    Adresse STRING, 
    Telefonnummer INTEGER
);


-- Some comments:
-- On delete cascade: If a row in the parent table is deleted, then the corresponding rows in the child table are also deleted.
-- On update cascade: If a row in the parent table is updated, then the corresponding rows in the child table are also updated to match the new value in the parent table.
-- https://www.sqlitetutorial.net/sqlite-foreign-key/

CREATE TABLE IF NOT EXISTS Billettkjop (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
    KundeID INTEGER REFERENCES Kundeprofil(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    Kjopstidspunkt TIMESTAMP NOT NULL
);


-- Add foreign key to Fremvisning at a later stage.

CREATE TABLE IF NOT EXISTS Teatersal (
    SalNummer INTEGER PRIMARY KEY, 
    AntallPlasser INTEGER
);



CREATE TABLE IF NOT EXISTS Omraade(
    id INTEGER PRIMARY KEY, 
    Navn TEXT NOT NULL
);


CREATE TABLE IF NOT EXISTS Stol(
    RadNummer INTEGER NOT NULL,
    StolNummer INTEGER NOT NULL,
    SalNummer INTEGER REFERENCES Teatersal(SalNummer) ON DELETE CASCADE ON UPDATE CASCADE,
    OmraadeID INTEGER REFERENCES Omraade(id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (RadNummer, StolNummer, SalNummer, OmraadeID)
);



CREATE TABLE if NOT EXISTS Ansettelse (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Type TEXT NOT NULL
);



CREATE TABLE if NOT EXISTS Person (
    Epost TEXT PRIMARY KEY NOT NULL,
    Navn TEXT NOT NULL,
    AnsettelsesFormId INTEGER REFERENCES Ansettelse (id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE if NOT EXISTS Teaterstykke (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Navn TEXT NOT NULL,
    Sesong TEXT NOT NULL
);

CREATE TABLE if NOT EXISTS Akt (
    TeaterstykkeID INTEGER REFERENCES Teaterstykke (id) ON DELETE CASCADE ON UPDATE CASCADE,
    Aktnummer INTEGER NOT NULL,
    Navn TEXT, -- An act doesn't necessarily have a name.
    PRIMARY KEY (TeaterstykkeID, Aktnummer)
);


CREATE TABLE IF NOT EXISTS Roller (
    PersonEpost INTEGER REFERENCES Person(Epost) ON DELETE CASCADE ON UPDATE CASCADE,
    TeaterstykkeID INTEGER REFERENCES Akt(TeaterstykkeID) ON DELETE CASCADE ON UPDATE CASCADE,
    AktNummer INTEGER REFERENCES Akt(Aktnummer) ON DELETE CASCADE ON UPDATE CASCADE,
    Rolle TEXT NOT NULL,

    PRIMARY KEY (PersonEpost, TeaterstykkeID, AktNummer)
);


CREATE TABLE if NOT EXISTS Ansvar (
    PersonEpost INTEGER REFERENCES Person (Epost) ON DELETE CASCADE ON UPDATE CASCADE,
    TeaterstykkeID INTEGER REFERENCES Teaterstykke (id) ON DELETE CASCADE ON UPDATE CASCADE,
    Oppgavenavn TEXT NOT NULL,
    PRIMARY KEY (PersonEpost, TeaterstykkeID, Oppgavenavn)
);
 


CREATE TABLE IF NOT EXISTS Fremvisning (
    TeaterstykkeID INTEGER REFERENCES Teaterstykke (id) ON DELETE CASCADE ON UPDATE CASCADE,
    Dato TEXT NOT NULL,
    Tid TEXT NOT NULL,
    SalNummer INTEGER REFERENCES Teatersal (SalNummer) ON DELETE CASCADE ON UPDATE CASCADE,

    PRIMARY KEY (TeaterstykkeID, Dato, Tid)
);
   

CREATE TABLE IF NOT EXISTS KundeGruppe (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Navn TEXT NOT NULL
);



CREATE TABLE IF NOT EXISTS Prisklasse (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    TeaterstykkeID INTEGER REFERENCES Teaterstykke (id) ON DELETE CASCADE ON UPDATE CASCADE,
    KundegruppeID INTEGER REFERENCES KundeGruppe (id) ON DELETE CASCADE ON UPDATE CASCADE,
    Pris INTEGER NOT NULL CHECK (Pris >= 0)
);


CREATE TABLE IF NOT EXISTS Billett(
    BillettkjopId INTEGER REFERENCES Billettkjop(id) ON DELETE CASCADE ON UPDATE CASCADE,
    StolId INTEGER REFERENCES Stol (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FremvisningId INTEGER REFERENCES Fremvisning (id) ON DELETE CASCADE ON UPDATE CASCADE,
    PrisklasseId INTEGER REFERENCES Prisklasse (id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (StolId, FremvisningId)
);






