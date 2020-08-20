#!/bin/sh
for i in "$*"
do 
    echo $i
done

git pull origin master
git add .
git commit -m "$*"
# git push