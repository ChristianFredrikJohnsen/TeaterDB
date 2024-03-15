-- Nine tickets for adults for the play "Størst av alt er kjærligheten" on the 3rd of february 2024.
-- The chairs must be next to each other on the same row.

INSERT INTO Billettkjop (KundeID, Kjopstidspunkt) VALUES
    (2, '2024-02-03 18:20:00');

INSERT INTO Billett (BillettkjopID, FremvisningID, PrisklasseID, StolID) VALUES
    (2, 6, 6, 658),
    (2, 6, 6, 659),
    (2, 6, 6, 660),
    (2, 6, 6, 661),
    (2, 6, 6, 662),
    (2, 6, 6, 663),
    (2, 6, 6, 664),
    (2, 6, 6, 665),
    (2, 6, 6, 666);

-- We used the following query to find the stolID of the first chair:

-- SELECT * FROM Stol WHERE
--     omraadeid = 3 AND
--     radnummer = 1 AND
--     stolnummer = 8;

-- TODO: Find the total price of the purchase.

