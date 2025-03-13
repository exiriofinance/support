#!/bin/bash
# Loop through all .md.html files
find . -type f -name "*.md.html" | while read file; do
  # Get the new filename by removing .md
  newfile="${file%.md.html}.html"
  # Rename the file
  mv "$file" "$newfile"
  echo "Renamed: $file → $newfile"
done
echo "All files renamed successfully!"
