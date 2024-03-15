#!/bin/bash

# Remove database if it exists
if [ -f trondheim-teater.db ]; then
    echo "Deleting old database file..."
    rm trondheim-teater.db
else
    echo "No existing database file to delete. Proceeding..."
fi

# Remove output folder if it exists
if [ -d output ]; then
    echo "Deleting old output folder..."
    rm -r output
else
    echo "No existing output folder to delete. Proceeding..."
fi

#############################################################
#############################################################

echo "Initialising database and creating tables"
sqlite3 trondheim-teater.db < ./sql_inserts/create_database.sql
mkdir output

echo "Inserting data into database"

# Task1 - Insert theater data into databse.
sqlite3 trondheim-teater.db < ./sql_inserts/theater_insert.sql
sqlite3 trondheim-teater.db < ./sql_inserts/roles_and_responsibilities_insert.sql
sqlite3 trondheim-teater.db < ./sql_inserts/customer_insert.sql

# Task (1 + 2) - Insert chairs into the database, and add the reservations for the plays on the 3rd of February.
(cd ./python && python insert_chairs.py )