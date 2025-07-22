#!/bin/bash

# Directory containing the images
# IMAGE_DIR="/path/to/your/images"
IMAGE_DIR=$PWD


# Change to the specified directory
# cd "$IMAGE_DIR" || { echo "Directory not found!"; exit 1; }

# Loop through all JPEG files
for img in *.jpeg; do
    # Check if the file exists
    [ -e "$img" ] || continue

    # Get the date taken using exiftool
    date_taken=$(exiftool -d "%Y-%m-%d_%H-%M-%S" -s -s -s -DateTimeOriginal "$img")

    # Check if the date was found
    if [[ -z "$date_taken" ]]; then
        echo "No date found for $img"
        continue
    fi

    # Create a new filename
    new_filename="${date_taken}-$img"

    # Rename the file
    mv "$img" "$new_filename" && echo "Renamed $img to $new_filename"
done
