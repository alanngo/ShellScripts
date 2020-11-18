RED='\u001b[31m'
GREEN='\u001b[32m'
BLUE='\u001b[34m'
YELLOW='\u001b[33m'
WHITE='\u001b[37m'


if [ -z $1 ]; then
    echo -e "${RED}Specify a project name!"
    echo -e "${BLUE}Usage: $ bash express.sh <PROJ NAME>"
    exit
fi
cat ${1} > ~/${1}
echo "alias "${2}"='bash ~/"${1}"'" >> ~/.bashrc