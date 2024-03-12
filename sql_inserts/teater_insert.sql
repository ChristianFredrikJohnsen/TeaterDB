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
