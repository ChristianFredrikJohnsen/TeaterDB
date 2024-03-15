INSERT INTO Teatersal (SalNummer, Navn, AntallPlasser) VALUES 
    (1, 'Hovedscenen', 516),
    (2, 'Gamle Scene', 332),
    (3, 'Studioscenen', 150),
    (4, 'Teaterkjelleren', 60),
    (5, 'Teaterkafeen', 100);

INSERT INTO Teaterstykke (id, Navn, Sesong) VALUES
    (1, 'Kongsemnene', 'Vår 2024'), 
    (2, 'Størst av alt er kjærligheten', 'Vår 2024'); 

INSERT INTO Akt (TeaterstykkeID, Aktnummer, Navn) VALUES
    (1, 1, NULL),
    (1, 2, NULL),
    (1, 3, NULL),
    (1, 4, NULL),
    (1, 5, NULL),
    (2, 1, NULL);

INSERT INTO Fremvisning (TeaterstykkeID, SalNummer, Tidspunkt) VALUES
    -- Kongsemnene, Hovedscenen
    (1, 1, '2024-02-01 19:00:00'),
    (1, 1, '2024-02-02 19:00:00'),
    (1, 1, '2024-02-03 19:00:00'),
    (1, 1, '2024-02-05 19:00:00'),
    (1, 1, '2024-02-06 19:00:00'),

    -- Kjærligheten, Gamle Scene
    (2, 2, '2024-02-03 18:30:00'),
    (2, 2, '2024-02-06 18:30:00'),
    (2, 2, '2024-02-07 18:30:00'),
    (2, 2, '2024-02-12 18:30:00'),
    (2, 2, '2024-02-13 18:30:00'),
    (2, 2, '2024-02-14 18:30:00');

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