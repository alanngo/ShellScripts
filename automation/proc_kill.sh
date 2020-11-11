# used to kill multiple processes and release ports
RED='\u001b[31m'
GREEN='\u001b[32m'
BLUE='\u001b[34m'
YELLOW='\u001b[33m'
WHITE='\u001b[37m'

if [ -z $1 ]; then
    echo -e "${RED}Specify processes to kill!"
    echo -e "${BLUE}Usage: ./proc_kill.sh <process0>..."
    exit
fi
for ARG in "$@"
do
    pkill -9 $ARG || echo -e "${GREEN} killed $ARG"
done