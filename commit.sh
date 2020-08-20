#!/bin/sh
# usage 

echo "files > "
read FILES

echo "commit message > "
read MSG

git pull origin $1
git add $FILES
git commit -m "$MSG"
git push origin $2