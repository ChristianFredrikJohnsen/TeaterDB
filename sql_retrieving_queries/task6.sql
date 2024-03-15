--Oppgave 6: Vi ønsker å lage et query i SQL som finner hvilke forestillinger 
--som har solgt  best. Skriv ut navn på forestilling og dato og 
--antall solgte plasser sortert på  antall plasser i synkende rekkefølge. 


SELECT Teaterstykke.navn, Fremvisning.Tidspunkt, COUNT(Billett.StolId) AS antallSolgtePlasser
    FROM Billett RIGHT JOIN Fremvisning ON Billett.fremvisningId = Fremvisning.id
    JOIN Teaterstykke ON Fremvisning.teaterstykkeId = Teaterstykke.id
    GROUP BY Fremvisning.id
    ORDER BY antallSolgtePlasser DESC;
