import os

def generate_index_html(repo_path, output_file="index.html"):
    """Generates an index.html file with links to all .md files in the repository."""

    html_content = """
    <!DOCTYPE html>
    <html>
    <head>
        <title>Repository Articles</title>
    </head>
    <body>
        <h1>Repository Articles</h1>
        <ul>
    """

    for root, _, files in os.walk(repo_path):
        for file in files:
            if file.endswith(".md"):
                # Construct the relative path
                relative_path = os.path.relpath(os.path.join(root, file), repo_path)
                # Create the link text (remove .md extension and replace underscores with spaces)
                link_text = file[:-3].replace("_", " ").title()
                # Create the HTML link
                html_content += f'<li><a href="{relative_path}">{link_text}</a></li>\n'

    html_content += """
        </ul>
    </body>
    </html>
    """

    with open(output_file, "w") as f:
        f.write(html_content)

if __name__ == "__main__":
    repo_path = "."  # Current directory (adjust if needed)
    generate_index_html(repo_path)
    print(f"index.html generated in {os.path.abspath('.')}")