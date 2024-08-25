#!/bin/bash

WATCH_DIR=~/watch

mkdir -p "$WATCH_DIR"

inotifywait -m "$WATCH_DIR" -e create |
while read -r directory events filename; do
    full_path="$directory$filename"

    if [ -f "$full_path" ]; then
        echo "New file detected: $filename"
        cat "$full_path"

        mv "$full_path" "${full_path}.back"
        echo "File renamed to: ${filename}.back"
    fi
done