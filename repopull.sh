#!/bin/bash
# Check the status of git and pull if necessary
# By: William Lynn
date
cd $sardonyx_git
git remote update
git pull origin master
