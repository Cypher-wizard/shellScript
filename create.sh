#!/bin/bash

# Specify the directory where you want to create the files
target_dir="/path/to/your/directory"

# Go to the target directory
cd "$target_dir" || exit

# Create 200 files
for ((i=1; i<=200; i++)); do
    touch "file$i.txt"
done

echo "Files created successfully."
