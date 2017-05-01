#!/bin/bash
# Check the status of git and pull if necessary
# By: William Lynn
# Auto-commit check
date
cd $HOME/bin/
git remote update
git pull origin master
