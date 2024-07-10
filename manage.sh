#!/bin/bash

# Function to delete files without warning
delete_files_no_warning() {
    read -p "Enter the directory where the files to delete are located: " delete_dir
    read -p "Enter the starting number of the files to delete: " start_num
    read -p "Enter the ending number of the files to delete: " end_num

    if [ ! -d "$delete_dir" ]; then
        echo "The specified directory does not exist. Exiting."
        exit 1
    fi

    cd "$delete_dir" || exit

    for ((i=start_num; i<=end_num; i++)); do
        if [ -f "file$i.txt" ]; then
            rm "file$i.txt"
        fi
    done
    echo "Files $start_num to $end_num deleted without warning from $delete_dir."
}

# Function to delete files with a warning
delete_files_with_warning() {
    read -p "Enter the directory where the files to delete are located: " delete_dir
    read -p "Enter the starting number of the files to delete: " start_num
    read -p "Enter the ending number of the files to delete: " end_num

    if [ ! -d "$delete_dir" ]; then
        echo "The specified directory does not exist. Exiting."
        exit 1
    fi

    cd "$delete_dir" || exit

    for ((i=start_num; i<=end_num; i++)); do
        if [ -f "file$i.txt" ]; then
            read -p "Are you sure you want to delete file$i.txt? (y/n): " confirm
            if [ "$confirm" == "y" ]; then
                rm "file$i.txt"
                echo "file$i.txt deleted."
            else
                echo "file$i.txt not deleted."
            fi
        fi
    done
}

# Function to move remaining files to a user-defined directory
move_remaining_files() {
    read -p "Enter the directory where the files to move are located: " source_dir
    read -p "Enter the target directory to move remaining files: " target_dir

    if [ ! -d "$source_dir" ]; then
        echo "The specified source directory does not exist. Exiting."
        exit 1
    fi

    if [ ! -d "$target_dir" ]; then
        echo "The specified target directory does not exist. Creating directory."
        mkdir -p "$target_dir"
    fi

    cd "$source_dir" || exit

    for file in file*.txt; do
        if [ -f "$file" ]; then
            mv "$file" "$target_dir/"
        fi
    done
    echo "Remaining files moved from $source_dir to $target_dir."
}

# Main script execution
echo "Choose an option:"
echo "1. Delete files without warning"
echo "2. Delete files with warning"
echo "3. Move remaining files to a directory"

read -p "Enter your choice (1/2/3): " choice

case $choice in
    1)
        delete_files_no_warning
        ;;
    2)
        delete_files_with_warning
        ;;
    3)
        move_remaining_files
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

echo "File management script completed."

