#!/bin/bash

#
# This script takes a project name as an argument and
# generates a directory structure for a research project
#

project_name=$1

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
mkdir $project_name/Code
mkdir $project_name/Notebooks
mkdir $project_name/Docs
mkdir $project_name/Log
mkdir $project_name/Writing

# Make README file

printf "# $project_name"  > $project_name/README.md

# Initiate Git repository

git init
printf ".gitignore" > $project_name/.gitignore


# END
echo ""
echo "Project structure has been set up successfully! .... enjoy ..."
