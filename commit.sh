# usage: ./commit.sh => push and pull from master
#        ./commit.sh <PULL_BRANCH> <PUSH_BRANCH>

INFO='\u001b[34m'
SUCCESS='\u001b[32m'
NORMAL='\u001b[37m'
# pull
if [ -z "$1" ]; then
    echo -e ${INFO} "DEFAULT: pulling from orign master"${NORMAL}
    git pull origin master
else
    echo -e ${INFO} "pulling from $1"${NORMAL}
    git pull origin $1
fi

# stage files
git status
echo "files > "
read FILES
git add $FILES
git status

#commit to local repository
echo "commit message > "
read MSG
git commit -m "$MSG"

# push
if [ -z "$2" ]; then
    echo -e ${INFO}"DEFAULT: pushing to orign master"${NORMAL}
    git push -u origin master
else
    echo -e ${INFO}"pushing to $2"${NORMAL}
    git push origin -u $2
fi

echo -e ${SUCCESS}"Successfully pushed to remote"