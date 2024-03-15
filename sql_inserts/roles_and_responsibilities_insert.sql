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

-- roller kongsemnet, one role for each act
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
    ('fabian.heidelberg.lunde@trondelagteater.no', 1, 1, 'Baard Bratte / Trønder'),
    ('emil.olafsson@trondelagteater.no', 1, 4, 'Jatgeir Skald / Dagfinn Bonde'),
    ('snorre.ryen.tondel@trondelagteater.no', 1, 3, 'Peter (prest og Ingebjørgs sønn)'),
    ('snorre.ryen.tondel@trondelagteater.no', 1, 4, 'Peter (prest og Ingebjørgs sønn)'),
    ('snorre.ryen.tondel@trondelagteater.no', 1, 5, 'Peter (prest og Ingebjørgs sønn)');

-- Kunstnerisk lag
INSERT INTO Person (epost, navn, ansettelsesId) VALUES
    ('yury.butusov@trondelagteater.no', 'Yury Butusov', 1),
    ('aleksandr.shishkin-hokusai@trondelagteater.no', 'Aleksandr Shishkin-Hokusai', 1),
    ('eivind.myren@trondelagteater.no', 'Eivind Myren', 1),
    ('mina.rype.stokke@trondelagteater.no', 'Mina Rype Stokke', 1)
    ON CONFLICT (epost) DO NOTHING;

-- Kunstnerisk lag Ansvar
INSERT INTO Ansvar (PersonEpost, TeaterstykkeID, Oppgavenavn) VALUES
    ('yury.butusov@trondelagteater.no', 1, 'Regi og musikkutgivelse'),
    ('aleksandr.shishkin-hokusai@trondelagteater.no', 1, 'Scenografi og kostymer'),
    ('eivind.myren@trondelagteater.no', 1, 'Lysdesign'),
    ('mina.rype.stokke@trondelagteater.no', 1, 'Dramaturg');

-- skuespillere kjærligheten
INSERT INTO Person (epost, navn, ansettelsesId) VALUES
    ('sunniva.nordal@trondelageater.no', 'Sunniva Du Mond Nordal', 1),
    ('jo.saberniak@trondelagteater.no', 'Jo Saberniak', 1),
    ('marte.steinholt@trondelagteater.no', 'Marte M. Steinholt', 1),
    ('tor.hagen@trondelagteater.no', 'Tor Ivar Hagen', 2),
    ('trond.skrodal@trondelagteater.no', 'Trond-Ove Skrødal', 3),
    ('natalie.tangen@trondelagteater.no', 'Natalie Grøndal Tangen', 4),
    ('åsmund.flaten@trondelagteater.no', 'Åsmund Flaten', 4)
    ON CONFLICT (epost) DO NOTHING;
    
-- roller kjærligheten
INSERT INTO Rolle (PersonEpost, TeaterstykkeID, AktNummer, RolleNavn) VALUES
    ('sunniva.nordal@trondelageater.no', 2, 1, 'Sunniva Du Mond Nordal'),
    ('jo.saberniak@trondelagteater.no', 2, 1, 'Jo Saberniak'),
    ('marte.steinholt@trondelagteater.no', 2, 1, 'Marte M. Steinholt'),
    ('tor.hagen@trondelagteater.no', 2, 1, 'Tor Ivar Hagen'),
    ('trond.skrodal@trondelagteater.no', 2, 1, 'Trond-Ove Skrødal'),
    ('natalie.tangen@trondelagteater.no', 2, 1, 'Natalie Grøndal Tangen'),
    ('åsmund.flaten@trondelagteater.no', 2, 1, 'Åsmund Flaten');

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

