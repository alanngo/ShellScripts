RED='\u001b[31m'
GREEN='\u001b[32m'
BLUE='\u001b[34m'
YELLOW='\u001b[33m'
WHITE='\u001b[37m'

FAV_SUBJECTS=(
    "Research" 
    "JS" 
    "SQL" 
    "Python" 
    "Flask" 
    "CPP"
    "Spring"
    "Java" 
    "Articles"
    "C#"
    "Textbooks")
LEN=${#FAV_SUBJECTS[*]}

for (( I=0; I<${LEN}; I++ )); do
    if [ $(( I % 2 )) == 0 ]; then
        echo -e ${WHITE}"6627 ${GREEN}really ${RED}loves" ${BLUE}"${FAV_SUBJECTS[$I]}"
    fi
done