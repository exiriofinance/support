#!/bin/bash

# Directories containing the files to update
DIRECTORIES=(
    "general"
    "graphs"
    "connections"
    "instructions"
    "data_&_documents"
    "currencies"
    "getting_started_with_exirio"
    "glossary"
)

# Function to process a file
process_file() {
    local file="$1"
    
    # Skip if not an HTML file
    if [[ ! "$file" == *.html ]]; then
        return
    fi
    
    # Get the filename without path
    filename=$(basename "$file")
    
    # Extract the title from the filename (replace underscores with spaces and remove extension)
    title=$(echo "$filename" | sed 's/\.md\.html$//' | sed 's/\.html$//' | sed 's/_/ /g' | sed 's/-/ /g')
    
    # Capitalize the first letter of each word in the title
    title=$(echo "$title" | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)} 1')
    
    # Get the content of the file (everything between <body> and </body> tags if they exist, otherwise the whole file)
    content=$(grep -v "<!DOCTYPE html>" "$file" | grep -v "<html" | grep -v "</html>" | grep -v "<head>" | grep -v "</head>" | grep -v "<body>" | grep -v "</body>" | grep -v "<style>" | grep -v "</style>" | grep -v "<meta" | grep -v "<title>" | grep -v "<link")
    
    # Create the new file content with our template
    cat > "$file.new" << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$title - Exirio Support</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #1a237e;
            --secondary-color: #0d47a1;
            --text-color: #212121;
            --background-color: #f5f5f5;
            --border-color: #e0e0e0;
            --container-width: 1200px;
            --section-spacing: 2rem;
            --subsection-spacing: 1.5rem;
            --item-spacing: 0.75rem;
            --accent-color: #2196f3;
            --hover-color: #1565c0;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Source Sans 3', sans-serif;
        }

        body {
            font-family: 'Source Sans 3', sans-serif;
            line-height: 1.4;
            color: var(--text-color);
            background-color: white;
            padding: 2rem;
        }

        h1 {
            color: var(--primary-color);
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid var(--border-color);
        }

        h2 {
            color: var(--primary-color);
            font-size: 1.75rem;
            font-weight: 700;
            margin-bottom: 1rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid var(--border-color);
        }

        h3 {
            color: var(--secondary-color);
            font-size: 1.25rem;
            font-weight: 600;
            margin: 1rem 0 0.75rem;
        }

        p {
            margin-bottom: 1rem;
            line-height: 1.6;
        }

        ul {
            list-style: disc;
            margin-left: 1.5rem;
            margin-bottom: 1rem;
        }

        ol {
            list-style: decimal;
            margin-left: 1.5rem;
            margin-bottom: 1rem;
        }

        li {
            margin-bottom: 0.5rem;
        }

        a {
            color: var(--accent-color);
            text-decoration: none;
            transition: color 0.2s ease;
        }

        a:hover {
            color: var(--hover-color);
            text-decoration: underline;
        }

        code {
            font-family: monospace;
            background-color: #f5f5f5;
            padding: 0.2rem 0.4rem;
            border-radius: 3px;
            font-size: 0.9em;
        }

        pre {
            background-color: #f5f5f5;
            padding: 1rem;
            border-radius: 5px;
            overflow-x: auto;
            margin-bottom: 1rem;
        }

        blockquote {
            border-left: 4px solid var(--border-color);
            padding-left: 1rem;
            margin-left: 0;
            margin-bottom: 1rem;
            color: #555;
        }

        img {
            max-width: 100%;
            height: auto;
            margin: 1rem 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 1rem;
        }

        th, td {
            padding: 0.75rem;
            text-align: left;
            border-bottom: 1px solid var(--border-color);
        }

        th {
            background-color: var(--primary-color);
            color: white;
        }
    </style>
</head>
<body>
$content
</body>
</html>
EOF

    # Replace the original file with the new one
    mv "$file.new" "$file"
    
    echo "Updated: $file"
}

# Function to process a directory recursively
process_directory() {
    local dir="$1"
    
    # Check if directory exists
    if [ ! -d "$dir" ]; then
        echo "Directory not found: $dir"
        return
    fi
    
    echo "Processing directory: $dir"
    
    # Find all HTML files in the directory and its subdirectories
    find "$dir" -type f -name "*.html" | while read -r file; do
        process_file "$file"
    done
}

# Process each directory
for dir in "${DIRECTORIES[@]}"; do
    process_directory "$dir"
done

echo "All files have been updated with the new CSS formatting." 