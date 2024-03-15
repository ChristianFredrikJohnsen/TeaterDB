import sqlite3

connection = sqlite3.connect('../trondheim-teater.db')
c = connection.cursor()

c.execute('''
    INSERT INTO Billettkjop (KundeID, Kjopstidspunkt) VALUES
    (3, '2024-02-03 18:23:30');
''')

c.execute('''
    INSERT INTO Billett (BillettkjopID, FremvisningID, PrisklasseID, StolID) VALUES
    (3, 6, 6, 517),
    (3, 6, 6, 518),
    (3, 6, 6, 519),
    (3, 6, 6, 520),
    (3, 6, 6, 521),
    (3, 6, 6, 522),
    (3, 6, 6, 523),
    (3, 6, 6, 524),
    (3, 6, 6, 525);
''')

connection.commit()

total_price = c.execute('''
    SELECT SUM(Pris) FROM 
    Billett JOIN Prisklasse ON Billett.PrisklasseID = Prisklasse.id 
    WHERE BillettkjopID = 3;
''').fetchone()[0]
print("\nPython implementation of Task 3:")
print(f"The total price for purchasing 9 ordinary tickets is:\n{total_price}")