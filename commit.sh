#!/bin/sh
# usage 
echo "enter pull branch > "
read PULL_BRANCH
if [$PULL_BRANCH =""]; then
    echo "Default pull branch is master"
    PULL_BRANCH="master"
fi
echo "files > "
read FILES

echo "commit message > "
read MSG

echo "enter push branch > "
read PUSH_BRANCH
if [$PUSH_BRANCH =""]; then
    echo "Default pull branch is master"
    PUSH_BRANCH="master"
fi

git pull origin $PULL_BRANCH
git add $FILES
git commit -m "$MSG"
git push origin $PUSH_BRANCH