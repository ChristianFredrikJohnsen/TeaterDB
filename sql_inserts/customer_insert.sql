INSERT INTO Kundeprofil (Navn, Adresse, Telefonnummer) VALUES
    ('Admin', 'Adminveien 1', '12345678'),
    ('Ola Nordmann', 'Kongens gate 1', '90109080'),
    ('Kari Nordmann', 'Dronningens gate 2', '90209080'),
    ('Per Hansen', 'Storgata 3', '90309080'),
    ('Randi Hansen', 'Storgata 3', '90409080');

INSERT INTO KundeGruppe (Navn) VALUES
    ('Ordinær'),
    ('Honnør'),
    ('Student'),
    ('Barn'),
    ('Gruppe 10'),
    ('Gruppe honnør 10');

INSERT INTO Prisklasse (teaterstykkeID, kundegruppeID, Pris) VALUES
    -- Kongsemnene
    (1, 1, 450), -- Ordinær
    (1, 2, 380), -- Honnør
    (1, 3, 280), -- Student
    (1, 5, 420), -- Gruppe 10
    (1, 6, 360), -- Gruppe honnør 10
    
    -- Størst av alt er kjærligheten
    (2, 1, 350), -- Ordinær
    (2, 2, 300), -- Honnør
    (2, 3, 220), -- Student
    (2, 4, 220), -- Barn
    (2, 5, 320), -- Gruppe 10
    (2, 6, 270); -- Gruppe honnør 10