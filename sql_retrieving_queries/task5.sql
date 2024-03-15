--Oppgave 5. Vi ønsker å lage et query i SQL som finner hvilke (navn på) 
--skuespillere som  opptrer i de forskjellige teaterstykkene. 
--Skriv ut navn på teaterstykke, navn på  skuespiller og rolle. 
SELECT DISTINCT Teaterstykke.navn, skuespiller.navn, Rolle.RolleNavn 
    FROM Rolle 
    JOIN Person AS skuespiller ON Rolle.PersonEpost = skuespiller.Epost
    JOIN Teaterstykke  ON Rolle.TeaterstykkeID = Teaterstykke.id;
