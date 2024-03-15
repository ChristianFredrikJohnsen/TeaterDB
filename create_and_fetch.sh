#!/bin/bash

if [ -f trondheim-teater.db ]; then
    echo "Deleting old file..."
    rm trondheim-teater.db
else
    echo "No existing file to delete. Proceeding..."
fi

echo "Initialising database and creating tables"
sqlite3 trondheim-teater.db < ./sql_inserts/create_database.sql

# Task1 - Insert theater data into databse.
echo "Inserting data into database"
sqlite3 trondheim-teater.db < ./sql_inserts/teater_insert.sql
sqlite3 trondheim-teater.db < ./sql_inserts/roles_and_responsibilities_insert.sql
sqlite3 trondheim-teater.db < ./sql_inserts/customer_insert.sql

# Task (1 + 2) - Insert the chairs, and the reservations for the plays on the 3rd of February.
(cd ./python && python insert_chairs.py )

# Task 3 - Buy nine tickets for the play "Størst av alt er kjærligheten" on the 3rd of February.
# The seats must not be already reserved.
sqlite3 trondheim-teater.db < ./sql_inserts/task3.sql

echo "Querying database"

# Task4 - Takes a date as input, and returns the plays which are performed on that date, and the number of tickets sold for each play.
# (cd ./python && python task4.py)

# Task 5 - Find actor names and their character names in different plays.
sqlite3 trondheim-teater.db < ./sql_retrieving_queries/task5.sql

# Task 6 - Find name of play and number of tickets sold for each play.
sqlite3 trondheim-teater.db < ./sql_retrieving_queries/task6.sql

# Task 7
(cd ./python && python task7.py)

