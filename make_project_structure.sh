#!/bin/bash

#
# This script is intended to set up a project directory structure when starting
# a new "project" where writing code will be involved.
#
# Invocation:
#
#       make_project_structure.sh MyProject
#
# Which results in the following directory tree:
#
#       MyProject/
#       ├── CodeRepo
#       │   └── MyProject
#       │       ├── code
#       │       ├── README.md
#       │       └── testing
#       ├── Data
#       │   └── README.md
#       ├── Figures
#       ├── Log
#       ├── Notebooks
#       ├── Outputs
#       ├── README.md
#       ├── Scratch
#       ├── Scripts
#       └── Writing
#
# The script takes a project name as an argument, creates a directory with the
# project name, and then generates a project tree in that root directory.
# A git repository is initialised in the root directory.
#
# The idea is to make it easy to have a consistent setup to encourage myself to
# be rigorourous, consistent, and produce reproducible science. I will try to
# keep developing the script as I use it in my projects to be functional.
#

# Check that a project name is passed

if [ $# -eq 0 ]; then
    echo "Error: No project name passed as argument for directory creation"
    exit 1
fi

project_name=$1

echo "Making directory structure for project: $project_name ..."

# Make parent dir if no matching directory exists

if [ -d ./$project_name ]; then
    echo "Error: Directory with name: $project_name already exists here"
    exit 1
fi

mkdir $project_name

# Make subdirs

mkdir $project_name/Data
mkdir $project_name/Outputs
mkdir $project_name/Figures
mkdir $project_name/Scratch
mkdir $project_name/CodeRepo
mkdir $project_name/CodeRepo/$project_name
mkdir $project_name/CodeRepo/$project_name/code
mkdir $project_name/CodeRepo/$project_name/testing
mkdir $project_name/Notebooks
mkdir $project_name/Scripts
mkdir $project_name/Log
mkdir $project_name/Writing

# Make README files for project and Data dir

echo "This directory (and any subdir) is not under version control" \
    > $project_name/Data/README.md

echo "# Code repository for $project_name" \
    > $project_name/CodeRepo/$project_name/README.md

echo "# $project_name" > $project_name/README.md

# If tree command exists, add directory tree to README
if [ -x "$(command -v tree)" ]; then

    echo -e "\n## Project directory structure (at init)\n" \
        >> $project_name/README.md

    tree $project_name >> $project_name/README.md
fi

# Initiate Git repository (and initial commit with README file)

echo ""
echo "Starting git repository ..."
echo ""

git init ./$project_name

echo ".gitignore" > $project_name/.gitignore
echo "Data/" >> $project_name/.gitignore

git -C $project_name add README.md
git -C $project_name commit -m \
    "Initial project commit. Dir structure is set up, please use it..."

# Goodbye
echo ""
echo "Project structure has been set up successfully!... Enjoy."
