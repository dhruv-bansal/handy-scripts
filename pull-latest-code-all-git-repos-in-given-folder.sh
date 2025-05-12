#!/bin/bash

################
# Uncomment if you want the script to always use the scripts
# directory as the folder to look through
#REPOSITORIES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#REPOSITORIES=`pwd`
REPOSITORIES="/Users/dhruvbansal/Documents/code/hgw"

IFS=$'\n'

# Arrays to track success and failure with reasons
SUCCESS_REPOS=()
FAILED_REPOS=()
FAILED_REASONS=()

for REPO in $(ls "$REPOSITORIES/"); do
  if [ -d "$REPOSITORIES/$REPO" ]; then
    echo "Updating $REPOSITORIES/$REPO at $(date)"
    if [ -d "$REPOSITORIES/$REPO/.git" ]; then
      echo "$REPOSITORIES/$REPO"
      cd "$REPOSITORIES/$REPO"
      echo "Fetching"
      
      FETCH_OUTPUT=$(git fetch --all 2>&1)
      if [ $? -ne 0 ]; then
        FAILED_REPOS+=("$REPO")
        FAILED_REASONS+=("Fetch failed: $FETCH_OUTPUT")
        continue
      fi

      PULL_OUTPUT=$(git pull --all 2>&1)
      if [ $? -ne 0 ]; then
        FAILED_REPOS+=("$REPO")
        FAILED_REASONS+=("Pull failed: $PULL_OUTPUT")
        continue
      fi

      SUCCESS_REPOS+=("$REPO")
    else
      FAILED_REPOS+=("$REPO")
      FAILED_REASONS+=("Not a git repository")
    fi
    echo "Done at $(date)"
    echo
  fi
done

# Print summary
echo "Summary:"
echo "Successfully updated repositories:"
for REPO in "${SUCCESS_REPOS[@]}"; do
  echo "  - $REPO"
done

echo "Failed to update repositories:"
for i in "${!FAILED_REPOS[@]}"; do
  echo "  - ${FAILED_REPOS[$i]}: ${FAILED_REASONS[$i]}"
done

