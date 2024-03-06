
CREATE TABLE if NOT EXISTS Kundeprofil (
    id INTEGER PRIMARY KEY, 
    Navn STRING, 
    Adresse STRING, 
    Telefonnummer INTEGER);


-- Some comments:
-- On delete cascade: If a row in the parent table is deleted, then the corresponding rows in the child table are also deleted.
-- On update cascade: If a row in the parent table is updated, then the corresponding rows in the child table are also updated to match the new value in the parent table.
-- https://www.sqlitetutorial.net/sqlite-foreign-key/

CREATE TABLE if NOT EXISTS Billettkjop 
    (id INTEGER PRIMARY KEY, 
    KundeID INTEGER NOT NULL, 
    Kjopstidspunkt TIMESTAMP, 
    FOREIGN KEY (KundeID) REFERENCES Kundeprofil(id)
    ON DELETE CASCADE 
    ON UPDATE CASCADE);




-- Add foreign key to Fremvisning at a later stage.

CREATE TABLE IF NOT EXISTS Teatersal (
    SalNummer INTEGER PRIMARY KEY, 
    AntallPlasser INTEGER);



CREATE TABLE IF NOT EXISTS Område(
    id INTEGER PRIMARY KEY, 
    OmrådeNavn TEXT);
    
)


CREATE TABLE IF NOT EXISTS Stol(
    RadNummer INTEGER,
    StolNummer INTEGER,
    SalNummer INTEGER,
    OmrådeID INTEGER,
    FOREIGN KEY (SalNummer) REFERENCES Teatersal(SalNummer) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (OmrådeID) REFERENCES Område(id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (RadNummer, StolNummer, SalNummer, OmrådeID));



CREATE TABLE if NOT EXISTS Ansettelse (
    AnsettelseID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Type         TEXT    NOT NULL
    );



CREATE TABLE if NOT EXISTS Person (
    PersonID        INTEGER PRIMARY KEY AUTOINCREMENT
                            UNIQUE
                            NOT NULL,
    Epost           TEXT    NOT NULL
                            UNIQUE,
    Navn            TEXT    NOT NULL,
    AnsettelsesForm INTEGER REFERENCES Ansettelse (AnsettelseID) 
                            NOT NULL
);


CREATE TABLE if NOT EXISTS Teaterstykke (
    TeaterstykkeID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Navn   TEXT    NOT NULL,
    Sesong TEXT    NOT NULL
);

CREATE TABLE if NOT EXISTS Akt (
    TeaterstykkeID INTEGER REFERENCES Teaterstykke (TeaterstykkeID) ON DELETE CASCADE ON UPDATE CASCADE,
    Aktnummer      INTEGER NOT NULL,
    Navn           TEXT,
    PRIMARY KEY (
        TeaterstykkeID,
        Aktnummer
    )
);


CREATE TABLE IF NOT EXISTS Roller (
    
    PersonID INTEGER NOT NULL,
    TeaterstykkeID INTEGER NOT NULL,
    AktNummer INTEGER NOT NULL,
    Rolle TEXT NOT NULL,
    
    PRIMARY KEY (PersonID, TeaterstykkeID, AktNummer),
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (TeaterstykkeID, AktNummer) REFERENCES Akt(TeaterstykkeID, Aktnummer) ON DELETE CASCADE ON UPDATE CASCADE
    );


CREATE TABLE if NOT EXISTS Ansvar (
    PersonID       INTEGER REFERENCES Person (PersonID),
    TeaterstykkeID INTEGER REFERENCES Teaterstykke (TeaterstykkeID),
    Oppgavenavn    TEXT    NOT NULL,
    PRIMARY KEY (
        PersonID,
        TeaterstykkeID,
        Oppgavenavn
    )
    );
 


CREATE TABLE IF NOT EXISTS Fremvisning (
    TeaterstykkeID INTEGER REFERENCES Teaterstykke (TeaterstykkeID) ON DELETE CASCADE ON UPDATE CASCADE,
    Dato TEXT NOT NULL,
    Tid TEXT NOT NULL,
    SalNummer INTEGER REFERENCES Teatersal (SalNummer) ON DELETE CASCADE ON UPDATE CASCADE,

    PRIMARY KEY (TeaterstykkeID, Dato, Tid)
    );
   

CREATE TABLE IF NOT EXISTS KundeGruppe (
    Navn TEXT PRIMARY KEY NOT NULL
    );



CREATE TABLE IF NOT EXISTS Prisklasse (
    TeaterstykkeID INTEGER REFERENCES Teaterstykke (TeaterstykkeID) ON DELETE CASCADE ON UPDATE CASCADE,
    KundeGruppeNavn TEXT REFERENCES KundeGruppe (Navn) ON DELETE CASCADE ON UPDATE CASCADE,
    Pris INTEGER NOT NULL,
    PRIMARY KEY (TeaterstykkeID, KundeGruppeNavn)
    );



-- No fucking way that this ever happens with Prisklasse, Fremvisning and Stol all being weak classes.
-- The amount of columns in this table will be beyond imagination.
-- Proposed solution: Give each  of the weak classes its own unique identifier.


--     CREATE TABLE if NOT EXISTS Billett 






