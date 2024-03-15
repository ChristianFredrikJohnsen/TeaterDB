
import sqlite3
from icecream import ic

# Du skal lage et Pythonprogram (og SQL) som tar et 
# skuespillernavn og finner  hvilke skuespilllere 
# de har spilt med i samme akt. Skriv ut navn på 
# begge og  hvilket skuespill det skjedde. 

def get_actors_in_same_act(actor_name, c):
    c.execute('''
    SELECT DISTINCT p1.Navn AS skuespiller1, p2.Navn AS skuespiller2, Teaterstykke.Navn AS skuespill
    FROM Rolle r1 JOIN Person p1 ON r1.PersonEpost = p1.Epost
    JOIN Rolle r2 JOIN Person p2 ON r2.PersonEpost = p2.Epost
    JOIN Teaterstykke ON r1.TeaterstykkeID = Teaterstykke.id 
    WHERE r1.TeaterstykkeID = r2.TeaterstykkeID AND
    r1.AktNummer = r2.AktNummer AND
              p1.Navn = ? AND
              p1.Epost != p2.Epost;
    ''', (actor_name, ))

    return c.fetchall()

def __main__():
    connection = sqlite3.connect('../trondheim-teater.db')
    c = connection.cursor()

    actor_name = "Arturo Scotti"
    actors_in_same_act = get_actors_in_same_act(actor_name, c)


    print(actors_in_same_act)

if __name__ == "__main__":
    __main__()