#!/bin/bash

SOURCE="/SYNOLOGY/WEB"
DEST="/NFS/WEB"

# Ensure source exists
if [ ! -d "$SOURCE" ]; then
    echo "Source directory $SOURCE does not exist."
    exit 1
fi

# Ensure destination exists
if [ ! -d "$DEST" ]; then
    echo "Destination directory $DEST does not exist."
    exit 1
fi

# Copy files recursively if they do not exist in destination
find "$SOURCE" -type f | while read -r src_file; do
    # Get the relative path from source
    rel_path="${src_file#$SOURCE/}"
    dest_file="$DEST/$rel_path"

    # Create destination directory if it doesn't exist
    dest_dir=$(dirname "$dest_file")
    if [ ! -d "$dest_dir" ]; then
        mkdir -p "$dest_dir"
    fi

    # Copy only if file does not exist in destination
    if [ ! -f "$dest_file" ]; then
        cp "$src_file" "$dest_file"
        echo "Copied: $rel_path"
    else
        echo "Skipped (already exists): $rel_path"
    fi
done
del-files
