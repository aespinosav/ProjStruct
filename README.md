This is a repo for a script that initiates a directory structure for a research project.

The idea is to make my workflow reproducible, and keep me structured.

I have decided to initialise the git version control for the projects with the Data subdir
in the .gitignore file, since it should not really be version controlled.

I have decided to have a subdir with the project name inside the CodeRepo directory.
This will help with writing code in "Modules" at least with python by making the import paths
work better, even though it adds another layer to the structure.

This should also make the code easier to spearate from the analysis.
