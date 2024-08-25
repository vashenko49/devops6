#!/bin/bash


#Exercise 3: Conditional Statements
#Write a script that checks if a file exists in the current directory.
# If it does, print a message saying it exists; otherwise, print a message saying it doesn't exist.


if [ -f $1 ]
then
    echo " file exists in the current directory"
else
    echo "file does not exist in the current directory"
fi


