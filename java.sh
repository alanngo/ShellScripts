# used to create C projects

# no project name specified
if [ -z "$1" ]; then
    echo "USAGE"
    echo "$ ./java.sh <PROJECT_NAME>"
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
mkdir -p $1"/src"
echo "public class "$MAIN>>$1"/src/"$MAIN".java"
echo "{">>$1"/src/"$MAIN".java"
echo "      static void log(Object o){System.out.println(o);}">>$1"/src/"$MAIN".java"
echo "      public static void main(String [] args){}">>$1"/src/"$MAIN".java"
echo "}">>$1"/src/"$MAIN".java"

# create runner
echo "rm -rf *.class">>"$1/src/run.sh"
echo "javac *.java">>"$1/src/run.sh"
echo "java $MAIN">>"$1/src/run.sh"
echo "rm -rf *.class">>"$1/src/run.sh"

# runner usage
echo "Use $1/src/run.sh to run your program"
echo "1. $ cd $1"
echo "2. $ ./src/run.sh"