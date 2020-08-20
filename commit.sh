#!/bin/sh
# usage 
echo "enter pull branch > "
read PULL_BRANCH

echo "files > "
read FILES

echo "commit message > "
read MSG
git pull origin $PULL_BRANCH
git add $FILES
git commit -m "$MSG"
git push