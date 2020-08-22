# used to create a python project
# no project name specified
if [ -z "$1" ]; then
    echo "USAGE"
    echo "$ ./py.sh <PROJECT_NAME>"
    exit
fi

# create project w/ <PROJECT_NAME>
mkdir $1
echo "def main():" >>$1"/main.py"
echo "   print('created project $1')" >>$1"/main.py"
echo "main()" >>$1"/main.py"

# done 
echo "Created "$1