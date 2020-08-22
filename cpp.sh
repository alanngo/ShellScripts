# used to create C++ projects

# no project name specified
if [ -z "$1" ]; then
    echo "USAGE"
    echo "$ ./cpp.sh <PROJECT_NAME>"
    exit
fi

# create project w/ <PROJECT_NAME>
mkdir $1
echo "#include <iostream>">>$1"/main.cpp"
echo "">>$1"/main.cpp"
echo "using namespace std;">>$1"/main.cpp"
echo "">>$1"/main.cpp"
echo "template<class E>">>$1"/main.cpp"
echo "void log(const E& e){cout<<e<<endl;}">>$1"/main.cpp"
echo "">>$1"/main.cpp"
echo "int main(int argc, char*argv[])">>$1"/main.cpp"
echo "{">>$1"/main.cpp"
echo "      return 0;">>$1"/main.cpp"
echo "}">>$1"/main.cpp"

# create runner
echo "rm -rf *.out">>"$1/run.sh"
echo "g++ -g *.cpp -Wall">>"$1/run.sh"
echo "./a.out">>"$1/run.sh"
echo "rm -rf *.out">>"$1/run.sh"

# runner usage
echo "Use $1/run.sh to run your program"
echo "1. $ cd $1"
echo "2. $ ./run.sh"

# done 