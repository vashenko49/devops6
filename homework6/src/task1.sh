#!/bin/bash

random_number=$(( RANDOM % 100 + 1 ))

attempts=0
max_attempts=5

echo "Guess the number (between 1 and 100):"

while [ $attempts -lt $max_attempts ]; do
    attempts=$((attempts + 1))

    read -p "Attempt $attempts: " guess

    if [ "$guess" -eq "$random_number" ]; then
        echo "Congratulations! You guessed the right number $random_number."
        exit 0
    elif [ "$guess" -lt "$random_number" ]; then
        echo "Too low."
    else
        echo "Too high."
    fi
done

echo "Sorry, you've run out of attempts. The correct number was $random_number."