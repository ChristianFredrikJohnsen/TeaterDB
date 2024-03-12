DELETE FROM Person;
DELETE FROM Ansettelse;
DELETE FROM Ansvar;
DELETE FROM Rolle;

INSERT INTO Ansettelse (id, Type) VALUES
    (1, 'fast'),
    (2, 'midlertidig'), 
    (3, 'innleid'), 
    (4, 'statist/frivillig');

-- skuespillere kongsemnene 
INSERT INTO Person (epost, navn, ansettelsesId) VALUES
    ('arturo.scotti@trondelagteater.no', 'Arturo Scotti', 1),
    ('ingunn.oyen@trondelagteater.no', 'Ingunn Beate Steige Øyen', 2), 
    ('hans.nilsen@trondelagteater.no', 'Hans Petter Nilsen', 3),
    ('madeleine.nilsen@trondelagteater.no', 'Madelein Brantzæg Nilsen', 1),
    ('synnove.eriksen@trondelagteater.no', 'Synnøve Fossum Eriksen', 1),
    ('emma.caroline.deichmann@trondelagteater.no', 'Emma Caroline Deichmann', 1),
    ('thomas.jensen.takyi@trondelagteater.no', 'Thomas Jensen Takyi', 1),
    ('per.bogstad.gulliksen@trondelagteater.no', 'Per Bogstad Gulliksen', 1),
    ('isak.holmen.sorensen@trondelagteater.no', 'Isak Holmen Sørensen', 1),
    ('fabian.heidelberg.lunde@trondelagteater.no', 'Fabian Heidelberg Lunde', 1),
    ('emil.olafsson@trondelagteater.no', 'Emil Olafsson', 1),
    ('snorre.ryen.tondel@trondelagteater.no', 'Snorre Ryen Tøndel', 1)
    ON CONFLICT (epost) DO NOTHING;


-- Kunstnerisk lag
INSERT INTO Person (epost, navn, ansettelsesId) VALUES
    ('yury.butusov@trondelagteater.no', 'Yury Butusov', 1),
    ('aleksandr.shishkin-hokusai@trondelagteater.no', 'Aleksandr Shishkin-Hokusai', 1),
    ('eivind.myren@trondelagteater.no', 'Eivind Myren', 1),
    ('mina.rype.stokke@trondelagteater.no', 'Mina Rype Stokke', 1)
    ON CONFLICT (epost) DO NOTHING;

-- Kunstnerisk lag Ansvar
INSERT INTO Ansvar (PersonEpost, TeaterstykkeID, Oppgavenavn) VALUES
    ('yury.butusov@trondelagteater.no', 1, 'Kunstnerisk lag'),
    ('aleksandr.shishkin-hokusai@trondelagteater.no', 1, 'Kunstnerisk lag'),
    ('eivind.myren@trondelagteater.no', 1, 'Kunstnerisk lag'),
    ('mina.rype.stokke@trondelagteater.no', 1, 'Kunstnerisk lag');

-- Produksjonslaget insertions
INSERT INTO Person (epost, navn, ansettelsesId) VALUES
    ('randi.andersen.gafseth@trondelagteater.no', 'Randi Andersen Gafseth', 1),
    ('emily.luthentun@trondelagteater.no', 'Emily F. Luthentun', 1),
    ('ann.eli.aasgard@trondelagteater.no', 'Ann Eli Aasgård', 1),
    ('marianne.aunvik@trondelagteater.no', 'Marianne Aunvik', 1),
    ('martin.didrichsen@trondelagteater.no', 'Martin Didrichsen', 1),
    ('are.kvitnes@trondelagteater.no', 'Are Skarra Kvitnes', 1),
    ('roger.indgul@trondelagteater.no', 'Roger Indgul', 1),
    ('anders.schille@trondelagteater.no', 'Anders Schille', 1),
    ('oliver.loding@trondelagteater.no', 'Oliver Løding', 1),
    ('harald.soltvedt@trondelagteater.no', 'Harald Soltvedt', 1),
    ('karl-martin.hoddevik@trondelagteater.no', 'Karl-Martin Hoddevik', 1),
    ('geir.dyrdal@trondelagteater.no', 'Geir Dyrdal', 1),
    ('trine.bjorhusdal@trondelagteater.no', 'Trine Bjørhusdal', 1),
    ('renee.desmond@trondelagteater.no', 'Renee Desmond', 1),
    ('charlotta.winger@trondelagteater.no', 'Charlotta Winger', 1),
    ('egil.buseth@trondelagteater.no', 'Egil Buseth', 1),
    ('per.arne.johansen@trondelagteater.no', 'Per Arne Johansen', 1),
    ('toril.skipnes@trondelagteater.no', 'Toril Skipnes', 1), 
    ('anita.gundersen@trondelagteater.no', 'Anita Gundersen', 1)
    ON CONFLICT (epost) DO NOTHING;

-- Produsksjonlag ansvar
INSERT INTO Ansvar (PersonEpost, TeaterstykkeID, Oppgavenavn) VALUES
    ('randi.andersen.gafseth@trondelagteater.no', 1, 'Produksjonslaget'),
    ('emily.luthentun@trondelagteater.no', 1, 'Produksjonslaget'),
    ('ann.eli.aasgard@trondelagteater.no', 1, 'Produksjonslaget'),
    ('marianne.aunvik@trondelagteater.no', 1, 'Produksjonslaget'),
    ('martin.didrichsen@trondelagteater.no', 1, 'Produksjonslaget'),
    ('are.kvitnes@trondelagteater.no', 1, 'Produksjonslaget'),
    ('roger.indgul@trondelagteater.no', 1, 'Produksjonslaget'),
    ('anders.schille@trondelagteater.no', 1, 'Produksjonslaget'),
    ('oliver.loding@trondelagteater.no', 1, 'Produksjonslaget'),
    ('harald.soltvedt@trondelagteater.no', 1, 'Produksjonslaget'),
    ('karl-martin.hoddevik@trondelagteater.no', 1, 'Produksjonslaget'),
    ('geir.dyrdal@trondelagteater.no', 1, 'Produksjonslaget'),
    ('trine.bjorhusdal@trondelagteater.no', 1, 'Produksjonslaget'),
    ('renee.desmond@trondelagteater.no', 1, 'Produksjonslaget'),
    ('charlotta.winger@trondelagteater.no', 1, 'Produksjonslaget'),
    ('egil.buseth@trondelagteater.no', 1, 'Produksjonslaget'),
    ('per.arne.johansen@trondelagteater.no', 1, 'Produksjonslaget'),
    ('toril.skipnes@trondelagteater.no', 1, 'Produksjonslaget'),
    ('anita.gundersen@trondelagteater.no', 1, 'Produksjonslaget');

-- skuespillere kongsemnene
INSERT INTO Person (epost, navn, ansettelsesId) VALUES
    ('sunniva.nordal@trondelageater.no', 'Sunniva Du Mond Nordal', 1),
    ('jo.saberniak@trondelagteater.no', 'Jo Saberniak', 1),
    ('marte.steinholt@trondelagteater.no', 'Marte M. Steinholt', 1),
    ('tor.hagen@trondelagteater.no', 'Tor Ivar Hagen', 2),
    ('trond.skrodal@trondelagteater.no', 'Trond-Ove Skrødal', 3),
    ('natalie.tangen@trondelagteater.no', 'Natalie Grøndal Tangen', 4),
    ('åsmund.flaten@trondelagteater.no', 'Åsmund Flaten', 4)
    ON CONFLICT (epost) DO NOTHING;

-- kunstnerisk lag
INSERT INTO Person (epost, navn, ansettelsesId) VALUES
    ('jonas.c.petersen@trondelagteater.no', 'Jonas Corell Petersen', 3),
    ('david.gehrt@trondelagteater.no', 'David Gehrt', 4),
    ('gaute.tønder@trondelagteater.no', 'Gaute Tønder', 2),
    ('magnus.mikaelsen@trondelagteater.no', 'Magnus Mikaelsen', 3),
    ('kristoffer.spender@trondelagteater.no', 'Kristoffer Spender', 1)
    ON CONFLICT (epost) DO NOTHING;

-- ansvar, kunstnerisk lag, kjærligheten
INSERT INTO Ansvar (PersonEpost, TeaterstykkeID, Oppgavenavn) VALUES
    ('jonas.c.petersen@trondelagteater.no', 2, 'Regi'),
    ('david.gehrt@trondelagteater.no', 2, 'Scenografi og kostymer'),
    ('gaute.tønder@trondelagteater.no', 2, 'Musikalsk ansvarlig'),
    ('magnus.mikaelsen@trondelagteater.no', 2, 'Lysdesign'),
    ('kristoffer.spender@trondelagteater.no', 2, 'Dramaturg');


-- produksjonslag
INSERT INTO Person (epost, navn, ansettelsesId) VALUES
    ('line.amli@trondelagteater.no', 'Line Åmli', 2),
    ('lars.m.k.utne@trondelagteater.no', 'Lars Magnus Krogh Utne', 1),
    ('livinger.diesen@trondelagteater.no', 'Liv Inger Ferner Diesen', 2),
    ('espen.høyem@trondelagteater.no', 'Espen Høyem', 3),
    ('kjerti.eckhoff@trondelagteater.no', 'Kjersti Eckhoff', 4),
    ('ida.m.brønstad@trondelagteater.no', 'Ida Marie Brønstad', 3),
    ('jan.m.høynes@trondelagteater.no', 'Jan Magne Høynes', 2),
    ('siri.g.gare@trondelagteater.no', 'Siri Gaare', 1),
    ('stein.j.øien@trondelagteater.no', 'Stein Jørgen Øien', 2),
    ('steffen.telstad@trondelagteater.no', 'Steffen Telstad', 2),
    ('erik.chan@trondelagteater.no', 'Erik Chan', 2),
    ('olav.rui@trondelagteater.no', 'Olav Rui', 2)
    ON CONFLICT (epost) DO NOTHING;

-- ansvar produksjonslag, kjærligheten
INSERT INTO Ansvar (PersonEpost, TeaterstykkeID, Oppgavenavn) VALUES
    ('line.amli@trondelagteater.no', 2, 'Inspisient'),
    ('lars.m.krogh.utne@trondelagteater.no', 2, 'Sufflør'),
    ('livinger.diesen@trondelagteater.no', 2, 'Maskeansvarlig'),
    ('espen.høyem@trondelagteater.no', 2, 'Stykkeansvarlig rekvisitt'),
    ('kjersti.eckhoff@trondelagteater.no', 2, 'Stykkeansvarlig kostyme'),
    ('ida.m.brønstad@trondelagteater.no', 2, 'Stykkeansvarlig påkledere'),
    ('jan.m.høynes@trondelagteater.no', 2, 'Lyddesign'),
    ('siri.g.gare@trondelagteater.no', 2, 'Lyddesign'),
    ('stein.j.øien@trondelagteater.no', 2, 'Videodesign'),
    ('steffen.telstad@trondelagteater.no', 2, 'Lysbordoperatør'),
    ('erik.chan@trondelagteater.no', 2, 'Sceneansvarlig'),
    ('olav.rui@trondelagteater.no', 2, 'Snekker'),
    ('per.arne.johansen@trondelagteater.no', 2, 'Metallarbeider'),
    ('toril.skipnes@trondelagteater.no', 2, 'Malersal'),
    ('anita.gundersen@trondelagteater.no', 2, 'Malersal');



-- roller kongsemnet
INSERT INTO Rolle (PersonEpost, TeaterstykkeID, AktNummer, RolleNavn) VALUES
    ('arturo.scotti@trondelagteater.no', 1, 1, 'Haakon Haakonssønn'),
    ('arturo.scotti@trondelagteater.no', 1, 2, 'Haakon Haakonssønn'),
    ('arturo.scotti@trondelagteater.no', 1, 3, 'Haakon Haakonssønn'),
    ('arturo.scotti@trondelagteater.no', 1, 4, 'Haakon Haakonssønn'),
    ('arturo.scotti@trondelagteater.no', 1, 5, 'Haakon Haakonssønn'),
    ('ingunn.oyen@trondelagteater.no', 1, 1, 'Inga frå Vartejg (Haakons mor)'),
    ('ingunn.oyen@trondelagteater.no', 1, 3, 'Inga frå Vartejg (Haakons mor)'),
    ('hans.nilsen@trondelagteater.no', 1, 1, 'Skule jarl'),
    ('hans.nilsen@trondelagteater.no', 1, 2, 'Skule jarl'),
    ('hans.nilsen@trondelagteater.no', 1, 3, 'Skule jarl'),
    ('hans.nilsen@trondelagteater.no', 1, 4, 'Skule jarl'),
    ('hans.nilsen@trondelagteater.no', 1, 5, 'Skule jarl'),
    ('madeleine.nilsen@trondelagteater.no', 1, 1, 'Fru Ragnhild (Skules hustru)'),
    ('madeleine.nilsen@trondelagteater.no', 1, 5, 'Fru Ragnhild (Skules hustru)'),
    ('synnove.eriksen@trondelagteater.no', 1, 1, 'Margrete (Skules datter)'),
    ('synnove.eriksen@trondelagteater.no', 1, 2, 'Margrete (Skules datter)'),
    ('synnove.eriksen@trondelagteater.no', 1, 3, 'Margrete (Skules datter)'),
    ('synnove.eriksen@trondelagteater.no', 1, 4, 'Margrete (Skules datter)'),
    ('synnove.eriksen@trondelagteater.no', 1, 5, 'Margrete (Skules datter)'),
    ('emma.caroline.deichmann@trondelagteater.no', 1, 1, 'Sigrid (Skules søster) / Ingebjørg'),
    ('emma.caroline.deichmann@trondelagteater.no', 1, 2, 'Sigrid (Skules søster) / Ingebjørg'),
    ('emma.caroline.deichmann@trondelagteater.no', 1, 5, 'Sigrid (Skules søster) / Ingebjørg'),
    ('thomas.jensen.takyi@trondelagteater.no', 1, 1, 'Biskop Nikolas'),
    ('thomas.jensen.takyi@trondelagteater.no', 1, 2, 'Biskop Nikolas'),
    ('thomas.jensen.takyi@trondelagteater.no', 1, 3, 'Biskop Nikolas'),
    ('per.bogstad.gulliksen@trondelagteater.no', 1, 1, 'Gregorius Jonssønn'),
    ('per.bogstad.gulliksen@trondelagteater.no', 1, 2, 'Gregorius Jonssønn'),
    ('per.bogstad.gulliksen@trondelagteater.no', 1, 3, 'Gregorius Jonssønn'),
    ('per.bogstad.gulliksen@trondelagteater.no', 1, 4, 'Gregorius Jonssønn'),
    ('per.bogstad.gulliksen@trondelagteater.no', 1, 5, 'Gregorius Jonssønn'),
    ('isak.holmen.sorensen@trondelagteater.no', 1, 1, 'Paal Flida / Trønder'),
    ('isak.holmen.sorensen@trondelagteater.no', 1, 2, 'Paal Flida / Trønder'),
    ('isak.holmen.sorensen@trondelagteater.no', 1, 3, 'Paal Flida / Trønder'),
    ('isak.holmen.sorensen@trondelagteater.no', 1, 4, 'Paal Flida / Trønder'),
    ('isak.holmen.sorensen@trondelagteater.no', 1, 5, 'Paal Flida / Trønder'),
    ('fabian.heidelberg.lunde@trondelagteater.no', 1, 1, 'Baard Bratte / Trønder'), --Ingen data... Alle akter?
    ('emil.olafsson@trondelagteater.no', 1, 4, 'Jatgeir Skald / Dagfinn Bonde'),
    ('snorre.ryen.tondel@trondelagteater.no', 1, 3, 'Peter (prest og Ingebjørgs sønn)'),
    ('snorre.ryen.tondel@trondelagteater.no', 1, 4, 'Peter (prest og Ingebjørgs sønn)'),
    ('snorre.ryen.tondel@trondelagteater.no', 1, 5, 'Peter (prest og Ingebjørgs sønn)');
    
-- roller kjærligheten
INSERT INTO Rolle (PersonEpost, TeaterstykkeID, AktNummer, RolleNavn) VALUES
    ('sunniva.nordal@trondelageater.no', 2, 1, 'Sunniva Du Mond Nordal'),
    ('jo.saberniak@trondelagteater.no', 2, 1, 'Jo Saberniak'),
    ('marte.steinholt@trondelagteater.no', 2, 1, 'Marte M. Steinholt'),
    ('tor.hagen@trondelagteater.no', 2, 1, 'Tor Ivar Hagen'),
    ('trond.skrodal@trondelagteater.no', 2, 1, 'Trond-Ove Skrødal'),
    ('natalie.tangen@trondelagteater.no', 2, 1, 'Natalie Grøndal Tangen'),
    ('åsmund.flaten@trondelagteater.no', 2, 1, 'Åsmund Flaten');