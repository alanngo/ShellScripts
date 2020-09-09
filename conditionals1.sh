echo "enter a programming language"
read FAV_LANG

case $FAV_LANG in
    shell|sql) # compounded case, DO NOT USE QUOTES
    echo "6627's favorite language"
    ;; # don't forget the terminating statements
    "java")
    echo "6627 says its the best langauge ever"
    ;;
    "python")
    echo "easiest language to learn"
    echo "start learning it"
    ;;
    *) # default case
    echo "smoking crack again? "
esac # finish clause for case