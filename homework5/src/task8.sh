#!/bin/bash

#Exercise 8: Arrays
#Write a script that uses an array to store a list of fruits. Loop through the array and print each fruit on a separate line.


fruits=(apple orange pear)


for key in "${!fruits[@]}"
do
  echo "${fruits[$key]}"
done
