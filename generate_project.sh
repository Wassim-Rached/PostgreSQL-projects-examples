#!/bin/bash

# get project name
read -p "Enter the project name: " projectName

# define project directories
baseDirectory="projects"
mainFolder="$baseDirectory/$projectName"

# create project directories
Folders=("src" "tests")
for folder in "${Folders[@]}"; do
  mkdir -p "$mainFolder/$folder"
done

# Create README.md
touch "$mainFolder/README.md"

# show project structure
echo "project generated successfully!"
echo "project structure:"
echo "$projectName"
echo "├── src"
echo "├── tests"
echo "└── README.md"