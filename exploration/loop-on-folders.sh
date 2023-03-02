#!/bin/bash

#REPOSITORIES=`pwd`
REPOSITORIES="/Users/dhruvbansal/Documents/code/hgw"

IFS=$'\n'

for REPO in `ls "$REPOSITORIES/"`
do
  if [ -d "$REPOSITORIES/$REPO" ]
  then
    echo "Updating $REPOSITORIES/$REPO at `date`"
  fi
done