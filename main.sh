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


echo "Querying database"

# Task 3 - Buy nine tickets for the play "Størst av alt er kjærligheten" on the 3rd of February. The seats must not be already reserved. Returns the total price of the tickets. Must be done in both SQL and Python.
echo "The price of nine ordinary tickets for the play 'Størst av alt er kjærligheten' on the 3rd of February is: " > ./output/task3.txt
sqlite3 trondheim-teater.db < ./sql_retrieving_queries/task3.sql >> ./output/task3.txt # SQL version
(cd ./python && python task3.py) >> ./output/task3.txt # Python version

# Task4 - Takes a date as input, and returns the plays which are performed on that date, and the number of tickets sold for each play.
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "For which date would you like to see the plays? Write your answer in the format YYYY-MM-DD"
echo "Example: 2024-02-03"
(cd ./python && python task4.py) > ./output/task4.txt

# Task 5 - Find actor names and their character names in different plays.
sqlite3 trondheim-teater.db < ./sql_retrieving_queries/task5.sql > ./output/task5.txt

# Task 6 - Find name of play and number of tickets sold for each play.
sqlite3 trondheim-teater.db < ./sql_retrieving_queries/task6.sql > ./output/task6.txt

# Task 7
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "Which actor would you like to find other actors in the same act for? Please enter the response in this format: 'First Name Last Name'"
echo "Example: Arturo Scotti"
(cd ./python && python task7.py) > ./output/task7.txt

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "All tasks completed successfully! Check the output folder for the results."

