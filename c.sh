# used to create C projects

# no project name specified
if [ -z "$1" ]; then
    echo "USAGE"
    echo "$ ./c.sh <PROJECT_NAME>"
    exit
fi

# create project w/ <PROJECT_NAME>
mkdir $1
echo "#include <stdio.h>">>$1"/main.c"
echo "int main(int argc, char*argv[])">>$1"/main.c"
echo "{">>$1"/main.c"
echo "      return 0;">>$1"/main.c"
echo "}">>$1"/main.c"

# create runner
echo "rm -rf *.out">>"$1/run.sh"
echo "gcc -g *.c -lm -Wall">>"$1/run.sh"
echo "./a.out">>"$1/run.sh"
echo "rm -rf *.out">>"$1/run.sh"

# runner usage
echo "Use $1/run.sh to run your program"
echo "1. $ cd $1"
echo "2. $ ./run.sh"

# done 
