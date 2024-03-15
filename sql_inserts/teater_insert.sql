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