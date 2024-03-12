#!/bin/bash
echo "Initialising database and fetching tables"
sqlite3 trondheim-teater.db < create_database.sql
echo "Inserting data into database"
python fetch_data.py


