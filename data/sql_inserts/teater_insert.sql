INSERT INTO Teaterstykke (Navn, Sesong) VALUES
    ('Kongsemnene', 'Vår 2024'),
    ('Størst av alt er kjærligheten', 'Vår 2024');

INSERT INTO Akt (TeaterstykkeID, Aktnummer, Navn) VALUES
    (1, 'Akt 1'),
    (2, 'Akt 2'),
    (3, 'Akt 3');




CREATE TABLE if NOT EXISTS Teaterstykke (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Navn TEXT NOT NULL,
    Sesong TEXT NOT NULL
);