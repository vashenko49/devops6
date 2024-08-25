#!/bin/bash

filename=$1

if [ -f "$filename" ]; then
    echo "Contents of '$filename':"
    cat "$filename"
else
    echo "Error: File '$filename' does not exist."
    exit 1
fi