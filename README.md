# Teater Database

## Table of contents 📚

- [Teater Database](#teater-database)
  - [Table of contents 📚](#table-of-contents-)
  - [Group Members 💯](#group-members-)
  - [Setup 🚀](#setup-)
    - [Requirements 🛠️](#requirements-️)
    - [How to run ⚡](#how-to-run-)
  - [View the results 👀](#view-the-results-)
  - [View the source code 🔎](#view-the-source-code-)
    - [SQL 💾](#sql-)
    - [Python 🐍](#python-)
  - [Run the dynamic python functions 📽️](#run-the-dynamic-python-functions-️)
    - [Task4 4️⃣](#task4-4️⃣)
    - [Task7 7️⃣](#task7-7️⃣)
  - [Miscellaneous 📌](#miscellaneous-)
    - [Updates of database ❕](#updates-of-database-)
    - [View the EER-diagram 🖼️](#view-the-eer-diagram-️)
    - [A note on the use of NOT NULL ⚠️](#a-note-on-the-use-of-not-null-️)

## Group Members 💯

Group290:

- Christian Fredrik Johnsen
- Kacper Pawlowksi
- Oskar Emil Wavold

## Setup 🚀

### Requirements 🛠️

1. Python 3.9 or higher
2. SQLite3
3. gitbash, linux terminal or mac-terminal (to run shell-script)

### How to run ⚡

1. Open a terminal which fits the requirements and navigate to `TEATERDB` - folder
2. Run `sh main.sh` to create the database, insert data, and make queries. The shellscript will prompt you to provide two inputs:
   - A date in the format `YYYY-MM-DD`
   - A name in the format `Firstname Lastname`

- Alternatively, to run in gitbash, open gitbash in the TeaterDB folder
  type `chmod +x main.sh` to create an executable and type `./main.sh` to create the database, insert data, and make queries.

## View the results 👀

All of the outputs from the different queries will be stored in the `output` folder.

A new database file named `trondheim-teater.db` will be created in the root folder.
The contents of the database can be loaded into sqlite3 by running the following command in the terminal:

```bash
sqlite3 trondheim-teater.db
```

## View the source code 🔎

This section are for those who want to see the queries/python scripts used to generate the results in the `output` folder.

### SQL 💾

The SQL code used for creating the database and inserting data can be found in the `sql_inserts` folder.
`sql_inserts` contains all code for `task1`.

SQL code for tasks `3`, `5` and `6` can be found in the `sql_retrieving_queries` folder.

### Python 🐍

All of the python code is located in the `python` folder.
The file for `task 2` is named `insert_chairs.py`, and the other files are named according to their task number.
Contains code for tasks `2`, `3`, `4` and `7`.

## Run the dynamic python functions 📽️

Tasks `4` and `7` asked us to implement dynamic queries with python.
We decided that these functions do not return anything, but instead print the results to the terminal.

If you want to run the python functions without going through the shellscript, you start by
opening a terminal which fits the requirements and navigating to the `python` folder.

```bash:
cd python
```

### Task4 4️⃣

To run the Python function for Task 4, use the following command, replacing <input_date> with the date you want to query (in YYYY-MM-DD format):

```bash
python3 task4.py <input_date>
```

Example:

```bash
python3 task4.py 2024-02-06
```

Sample output:
  
```bash
The name of the play(s) and the number of sold tickets on 2024-02-06 is:
Kongsemnene: 0 tickets sold
Størst av alt er kjærligheten: 0 tickets sold
```

### Task7 7️⃣

To run the Python function for Task 7, use the following command, replacing <actor_name> with the name of the actor:

```bash
python3 task7.py <actor_name>
```

Example:

```bash
python3 task7.py 'Fabian Heidelberg Lunde'
```

Sample output:

```bash
('Fabian Heidelberg Lunde', 'Arturo Scotti', 'Kongsemnene')
('Fabian Heidelberg Lunde', 'Ingunn Beate Steige Øyen', 'Kongsemnene')
('Fabian Heidelberg Lunde', 'Hans Petter Nilsen', 'Kongsemnene')
('Fabian Heidelberg Lunde', 'Madelein Brantzæg Nilsen', 'Kongsemnene')
('Fabian Heidelberg Lunde', 'Synnøve Fossum Eriksen', 'Kongsemnene')
('Fabian Heidelberg Lunde', 'Emma Caroline Deichmann', 'Kongsemnene')
('Fabian Heidelberg Lunde', 'Thomas Jensen Takyi', 'Kongsemnene')
('Fabian Heidelberg Lunde', 'Per Bogstad Gulliksen', 'Kongsemnene')
('Fabian Heidelberg Lunde', 'Isak Holmen Sørensen', 'Kongsemnene')
```

## Miscellaneous 📌

### Updates of database ❕

We found some small errors in our database creation SQL, and we have therefore made some small updates.
All of the updates can be found in the [UPDATES.md](misc/UPDATES.md) file.

### View the EER-diagram 🖼️

The EER-diagram is stored as a picture in the `misc` folder. Click [here](./misc/EER-diagram.png) to view it.

### A note on the use of NOT NULL ⚠️

In our SQL schema definitions, we have made a deliberate choice to explicitly include NOT NULL constraints for single columns defined as primary key for a table. Typically, in SQL, a primary key constraint inherently implies that the column is NOT NULL because a primary key must uniquely identify each row in a table, and a NULL value, which represents the absence of any value, cannot serve as a unique identifier.

However, we've observed that SQLite, unlike most other DBMSs, allows NULL values to be inserted into columns defined solely with the PRIMARY KEY constraint, unless NOT NULL is explicitly specified. This behavior is unique to SQLite and is not in line with the broader SQL standard, where a primary key column is automatically treated as NOT NULL.

TL;DR:
While it is generally understood that a PRIMARY KEY constraint implies NOT NULL, SQLite's unique handling of primary key columns allows for the insertion of NULL values unless explicitly prohibited. To ensure consistency and data integrity across our database schema, we have chosen to explicitly include NOT NULL constraints on primary key columns in our SQLite-based project.
