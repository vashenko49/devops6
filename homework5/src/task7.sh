#!/bin/bash

#Exercise 7: Command Line Arguments
#Develop a script that accepts a filename as a command line argument and prints the number of lines in that file.

COUNT=$(wc -l < $1)

COUNT=$(($COUNT + 1))

echo "Number of lines in $1 $COUNT"