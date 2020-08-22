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
echo "Created Python Project "$1

# runner usage
echo "Use python3 to run your program "
echo "1. $ cd $1"
echo "2. $ python3 main.py"