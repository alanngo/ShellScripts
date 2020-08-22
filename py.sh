# used to create a python project

# no project name specified
if [ -z "$1" ]; then
    echo "USAGE"
    echo "$ ./py.sh <PROJECT_NAME>"
    exit
fi
# prompt for the main file
echo "Name of main File: "
read MAIN
if [ -z "$MAIN" ]; then
    echo "Provide a name to your main file! "
    echo "exiting"
    exit
fi
# create project w/ <PROJECT_NAME>
mkdir $1
echo "def main():" >>$1"/"$MAIN".py"
echo "   print('created project $1')" >>$1"/"$MAIN".py"
echo "main()" >>$1"/"$MAIN".py"

# done 
echo "Created Python Project "$1

# runner usage
echo "Use python3 to run your program "
echo "1. $ cd $1"
echo "2. $ python3 "$MAIN".py"