# usage: ./clone.sh <REMOTE> <USERNAME> <REPO>
# usage: sh clone.sh <REMOTE> <USERNAME> <REPO>

ERROR='\e[31m'
SUCCESS='\e[32m'
INFO='\e[34m'

if [ -z "$1" ] | [ -z "$2" ] | [ -z "$3" ]; then
    echo ${ERROR}"ERROR CLONING!"
    echo ${ERROR}"Use sh clone.sh <REMOTE> <USERNAME> <REPO>"
    echo ${INFO}"Example: $ sh clone.sh github.com ShellScripts"
    exit
fi
git clone "https://"$1"/"$2"/"$3
echo ${SUCCESS} "successfully cloned from :"
echo ${SUCCESS} "https://"$1"/"$2"/"$3
