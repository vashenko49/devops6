#!/bin/bash
SRC_FILE=$1
DST_FILE=$2

# Check if the source file exists
if [ ! -f "$SRC_FILE" ]; then
    echo "Error: Source file '$SRC_FILE' does not exist."
    exit 1
fi

cp "$SRC_FILE" "$DST_FILE"