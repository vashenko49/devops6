#!/bin/bash

#Exercise 6: String Manipulation
#Build a script that takes a user's input as a sentence and then reverses the sentence word by word (e.g., "Hello World" becomes "World Hello").

str='one two three four five'
echo "$str" | tr ' ' '\n' | tac | xargs