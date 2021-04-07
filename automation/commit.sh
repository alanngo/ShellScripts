# usage: ./commit.sh => push and pull from master
#        ./commit.sh <PULL_BRANCH> <PUSH_BRANCH> <REMOTE>

INFO='\u001b[34m'
SUCCESS='\u001b[32m'
NORMAL='\u001b[37m'

PULL=${1:-"master"}
PUSH=${2:-"master"}
REMOTE=${3:-"origin"}
# pull
git pull $REMOTE $PULL && echo -e ${INFO}"Pulling from $PULL"${NORMAL}


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
git push -u $REMOTE $PUSH && echo -e ${INFO}"Pushing to $REMOTE $PUSH" 


echo -e ${SUCCESS}"Successfully pushed to remote"${NORMAL}  