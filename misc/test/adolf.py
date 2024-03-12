import sqlite3
from icecream import ic

connection = sqlite3.connect("n00b.db")
c = connection.cursor()


c.execute(
    """
    CREATE TABLE if NOT EXISTS n00b (
    name STRING PRIMARY KEY,  
    Telefonnummer INTEGER);
    """
)

ic(c.execute(
    """
    INSERT INTO n00b (name, Telefonnummer) VALUES 
    (NULL, 69420),
    (NULL, 3301),
    ('Christian', 1234);
    """
))

ic(connection.commit())