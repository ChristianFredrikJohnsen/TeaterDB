import sqlite3

# Koble til databasen
connection = sqlite3.connect('../trondheim-teater.db')
c = connection.cursor()

# Funksjon for å hente dato fra bruker
def get_date():
    dato = input("Hvilken dato vil du vise fremvisningene for? Skriv svaret på dette formatet yyyy-mm-dd\n")
    return dato

# Funksjon for å hente fremvisninger og antall solgte billetter for en gitt dato
def get_shows(dato):
    c.execute("""SELECT Teaterstykke.Navn, count(Billett.BillettkjopId) as 'Antall Solgte Biletter' FROM Fremvisning 
              JOIN Teaterstykke on Fremvisning.TeaterstykkeId = Teaterstykke.Id 
              JOIN Billett on Fremvisning.id = Billett.FremvisningId  
              WHERE date(Fremvisning.Tidspunkt) = ?
              GROUP BY Fremvisning.id
              Order by count(Billett.BillettkjopId) DESC 
              """, (dato,))
    shows = c.fetchall()
    return shows
    

dato = get_date()
shows = get_shows(dato)

# Lukk databasen
c.close()
connection.close()

# Skriv ut resultatet
print("\nNavnet på teaterstykket og antall solgte billetter for fremvisningene på", dato, "er:\n")
for show in shows:
    print(show[0]+":", show[1], "billetter")
