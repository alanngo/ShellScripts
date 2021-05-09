# used to create C projects

# no arg will default to 'MyProj'
PROJ_DIR=${1:-"MyProj"}

# prompt for the main file
MAIN="main.cpp"

# create project w/ <PROJECT_NAME>
mkdir $PROJ_DIR
echo '
#include <iostream>

using namespace std;

template <class E>
void log(const E& e){cout<<e<<endl;}

int main(int argc, char** argv)
{
    log("hello world");
    return 0;
}

'>>$PROJ_DIR"/"$MAIN

# create vscode debuger
VSCODE="$PROJ_DIR/.vscode"
mkdir $VSCODE

echo '{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "g++ - Build and debug active file",
            "type": "cppdbg",
            "request": "launch",
            "program": "${workspaceFolder}/a.out",
            "args": [],
            "stopAtEntry": false,
            "cwd": "${workspaceFolder}",
            "environment": [],
            "externalConsole": false,
            "MIMode": "gdb",
            "setupCommands": [
                {
                    "description": "Enable pretty-printing for gdb",
                    "text": "-enable-pretty-printing",
                    "ignoreFailures": true
                }
            ],
            "preLaunchTask": "C/C++: g++ build active file",
            "miDebuggerPath": "/usr/bin/gdb"
        }
    ]
}'> "$VSCODE/launch.json"

echo '{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "C/C++: g++ build active file",
            "command": "g++",
            "type": "shell",
            "args": 
            [
                "-g", 
                "main.cpp",
                "-Wall"
            ],
            "problemMatcher": [
                "$tsc"
            ],
            "presentation": {
                "reveal": "always"
            },
            "group": "build"
        }
    ]
}' >"$VSCODE/tasks.json"


# create runner
echo "
rm -rf *.out
g++ -g main.cpp -Wall
./a.out
rm -rf *.out">>"$PROJ_DIR/run.sh"

# gitignore
echo "*.out" >>"$PROJ_DIR/.gitignore"

# runner usage
echo "Use $PROJ_DIR/run.sh to run your program"
echo "1. $ cd $PROJ_DIR"
echo "2. $ ./run.sh"

# done 
