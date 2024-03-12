#!/bin/bash
echo "Initialising database and fetching tables"
python create_database.py
echo "Inserting data into database"
python fetch_data.py


