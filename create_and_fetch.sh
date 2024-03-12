#!/bin/bash

if [ -f trondheim-teater.db ]; then
    echo "Deleting old file..."
    rm trondheim-teater.db
else
    echo "No existing file to delete. Proceeding..."
fi

echo "Initialising database and creating tables"
sqlite3 trondheim-teater.db < create_database.sql

echo "Inserting data into database"
sqlite3 trondheim-teater.db < ./sql_inserts/teater_insert.sql
sqlite3 trondheim-teater.db < ./sql_inserts/ansettelse_person_insert.sql
sqlite3 trondheim-teater.db < ./sql_inserts/customer_insert.sql

python ./insert_chairs.py



