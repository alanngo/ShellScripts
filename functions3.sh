# we can return numerical values or boolean values
function good_language()
{
    local LANG=$1
    case $LANG in
        "shell"|"java"|"python"|"sql"|"cpp"|"js")
        return 1
        ;;
    esac
    return 0
} 

good_language $1 # run the function
VAR=$? # capture the return value

if [ $VAR -ge 1 ]; then
    echo "$1 is a good language to learn"
else
    echo "hell no"
fi
