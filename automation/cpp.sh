# used to create C projects

# no arg will default to 'MyProj'
PROJ_DIR=${1:-"MyProj"}

# prompt for the main file
MAIN="main.cpp"

# create project w/ <PROJECT_NAME>
mkdir $PROJ_DIR
echo '
#include <iostream>
#include "console.hpp"
using namespace std;


int main(int argc, char** argv)
{
    LOG("Hello world");
    TRACE("trace");
    DEBUG("debug");
    INFO("info");
    WARN("warn");
    ERROR("error");
    FATAL("fatal");
    return 0;
}'>>$PROJ_DIR"/"$MAIN

# create console.hpp
echo '
// https://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html
#ifndef CONSOLE_H
#define CONSOLE_H
#include <iostream>
#include <sstream>
#include <chrono>
#include <ctime>
#include <string>
#include <algorithm>
using namespace std;
#define SPACE " "
#define COLON ":"
#define NEWLINE (*new string("\n"))[0]

string getTime()
{
    // Some computation here
    auto end = chrono::system_clock::now();
    time_t end_time = chrono::system_clock::to_time_t(end);

    // to string
    stringstream ss;
    ss << ctime(&end_time);
    string ret = "[ " + ss.str();
    ret.erase(std::remove(ret.begin(), ret.end(), NEWLINE), ret.cend());
    ret += SPACE;
    return ret + "] --- ";
}


// colors
#define RED "\x1B[31m"
#define GREEN "\x1B[32m"
#define YELLOW "\x1B[33m"
#define BLUE "\x1B[34m"
#define PURPLE "\x1B[35m"
#define BLACK "\u001b[41m"
#define RESET "\u001b[0m"

#define MY_PRINT(arg, color, type) cout << color << getTime() << "["<<__FILE__<<"] " << type << COLON << SPACE << arg << RESET << endl;

// MACROs to use
#define LOG(arg) cout << arg << endl;
#define TRACE(arg) MY_PRINT(arg, PURPLE, "TRACE" )
#define DEBUG(arg) MY_PRINT(arg, GREEN, "DEBUG")
#define INFO(arg) MY_PRINT(arg, BLUE, "INFO")
#define WARN(arg) MY_PRINT(arg, YELLOW, "WARN")
#define ERROR(arg) MY_PRINT(arg, RED, "ERROR")
#define FATAL(arg) MY_PRINT(arg, BLACK, "FATAL")

#endif

'>>$PROJ_DIR"/console.hpp"

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
