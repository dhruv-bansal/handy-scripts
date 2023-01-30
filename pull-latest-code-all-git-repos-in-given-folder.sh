#!/bin/bash

################
# Uncomment if you want the script to always use the scripts
# directory as the folder to look through
#REPOSITORIES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#REPOSITORIES=`pwd`
REPOSITORIES="/Users/dhruvbansal/Documents/code/hgw"

IFS=$'\n'

for REPO in `ls "$REPOSITORIES/"`
do
  if [ -d "$REPOSITORIES/$REPO" ]
  then
    echo "Updating $REPOSITORIES/$REPO at `date`"
    if [ -d "$REPOSITORIES/$REPO/.git" ]
    then
      echo "$REPOSITORIES/$REPO"
      cd "$REPOSITORIES/$REPO"
      git status
      echo "Fetching"
      git fetch -all
      echo "Pulling"
      git pull -all
#    else
#      echo "Skipping because it doesn't look like it has a .git folder."
    fi
    echo "Done at `date`"
    echo
  fi
done