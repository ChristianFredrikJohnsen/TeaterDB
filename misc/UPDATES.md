# Updates

The `navn` column in the `omraade` table was set to be unique, to avoid adding multiple areas with the same name.

We added a name field to `teatersal`. This was to give the `teatersal`s names, making it easier to distinguish between them.

`Rolle` has a foreign key to `Akt`. Earlier by mistake, only `Aktnummer` was used as part of the primary key, but the primary key for `Akt` must contain both `TeaterstykkeID` and `Aktnummer`. The primary key of `Rolle` was changed to correctly be: `PRIMARY KEY (PersonEpost, TeaterstykkeID, AktNummer)`

We added an `ID` column to the `chair` class. We had accidentally forgotten to add it.

## Note

We don't know which act the character `Baard Bratte` in Kongsemnene is in, so we have put him in act 1 only.
