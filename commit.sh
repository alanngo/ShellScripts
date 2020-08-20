#!/bin/sh
# usage: ./commit.sh <PULL_BRANCH> <PUSH_BRANCH>

echo "files > "
read FILES

echo "commit message > "
read MSG

git pull origin $1
git add $FILES
git commit -m "$MSG"
git push origin -u $2