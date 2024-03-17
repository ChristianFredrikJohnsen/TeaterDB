import sqlite3
import sys

def get_shows(dato: str, c: sqlite3.Cursor) -> list[tuple]:
    """
    Retrieves shows and the number of sold tickets for a given date.
    """
    c.execute("""SELECT Teaterstykke.Navn, count(Billett.BillettkjopId) as 'Antall Solgte Biletter' FROM Fremvisning 
              JOIN Teaterstykke on Fremvisning.TeaterstykkeId = Teaterstykke.Id 
              LEFT JOIN Billett on Fremvisning.id = Billett.FremvisningId  
              WHERE date(Fremvisning.Tidspunkt) = ?
              GROUP BY Fremvisning.id
              Order by count(Billett.BillettkjopId) DESC 
              """, (dato,))
    shows = c.fetchall()
    return shows

def main(dato: str) -> None:
    """
    Retrieves shows and the number of sold tickets for a given date.
    The input is a date in the format 'YYYY-MM-DD'.
    """
    connection = sqlite3.connect('../trondheim-teater.db')
    c = connection.cursor()
    
    shows = get_shows(dato, c)
    print(f"The name of the play(s) and the number of sold tickets on {dato} is:")
    for show in shows:
        print(f"{show[0]}: {show[1]} tickets sold")

    c.close()
    connection.close()

if __name__ == '__main__':
    if len(sys.argv) > 1: # Run manually
        main(sys.argv[1])
    else: # Used by shell script
        dato = input()
        main(dato)