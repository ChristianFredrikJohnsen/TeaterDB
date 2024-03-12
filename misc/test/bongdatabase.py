import sqlite3
from icecream import ic

connection = sqlite3.connect("cascade.db")
c = connection.cursor()
c.execute("PRAGMA foreign_keys = ON;")

### Bilett avdelingen kommer her ###
c.execute(
    """
    CREATE TABLE if NOT EXISTS Person (
    Epost STRING PRIMARY KEY, 
    Adresse STRING, 
    Telefonnummer INTEGER);
    """
)


c.execute(
    """
    CREATE TABLE IF NOT EXISTS Rolle (
    epost STRING REFERENCES Person(Epost) ON DELETE CASCADE ON UPDATE CASCADE,
    RolleNavn STRING,
    PRIMARY KEY (epost, RolleNavn));
    """
    )

# Insert a person into the Person table
c.execute(
    """
    INSERT INTO Person (Epost, Adresse, Telefonnummer)
    VALUES ('john@example.com', '123 Main St', 1234567890);
    """
)

# Insert a row into the Rolle table
c.execute(
    """
    INSERT INTO Rolle (epost, RolleNavn)
    VALUES ('john@example.com', 'Actor');
    """
)

connection.commit()
ic(c.execute("""SELECT * FROM Person;""").fetchall())
ic(c.execute("""SELECT * FROM Rolle;""").fetchall())


# Update the email of John
c.execute(
    """
    UPDATE Person
    SET Epost = 'new_email@example.com'
    WHERE Epost = 'john@example.com';
    """
)
connection.commit()

ic(c.execute("""SELECT * FROM Person;""").fetchall())
ic(c.execute("""SELECT * FROM Rolle;""").fetchall())

