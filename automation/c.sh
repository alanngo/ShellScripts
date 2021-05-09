# used to create C projects

# no arg will default to 'MyProj'
PROJ_DIR=${1:-"MyProj"}

# prompt for the main file
MAIN="main.c"

# create project w/ <PROJECT_NAME>
mkdir $PROJ_DIR
echo '
#include <stdio.h>

int main(int argc, char** argv)
{
    printf("hello world\n");
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
            "name": "gcc - Build and debug active file",
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
            "preLaunchTask": "C/C++: gcc build active file",
            "miDebuggerPath": "/usr/bin/gdb"
        }
    ]
}'> "$VSCODE/launch.json"

echo '{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "C/C++: gcc build active file",
            "command": "gcc",
            "type": "shell",
            "args": 
            [
                "-g", 
                "*.c",
                "-lm"
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
gcc -g *.c -lm -Wall
./a.out
rm -rf *.out">>"$PROJ_DIR/run.sh"

# gitignore
echo "*.out" >>"$PROJ_DIR/.gitignore"

# runner usage
echo "Use $PROJ_DIR/run.sh to run your program"
echo "1. $ cd $PROJ_DIR"
echo "2. $ ./run.sh"

# done 
