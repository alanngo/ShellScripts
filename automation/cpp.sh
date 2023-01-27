# used to create C++ projects

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

// colors
#define RED "\x1B[31m"
#define GREEN "\x1B[32m"
#define YELLOW "\x1B[33m"
#define BLUE "\x1B[34m"
#define PURPLE "\x1B[35m"
#define BLACK "\u001b[41m"
#define RESET "\u001b[0m"

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
template <class E>
void print(
    ostream &o,
    const string &color,
    const string &type,
    const string &fi,
    const E &arg) { o << color << getTime() << "[" << fi << "] " << type << COLON << SPACE << arg << RESET << endl; }

#define PRINT(arg, color, type) print(cout, color, type, __FILE__, arg);
#define ERR(arg, color, type) print(cerr, color, type, __FILE__, arg);

// MACROs to use
#define LOG(arg) clog << arg << endl;
#define TRACE(arg) PRINT(arg, PURPLE, "TRACE")
#define DEBUG(arg) PRINT(arg, GREEN, "DEBUG")
#define INFO(arg) PRINT(arg, BLUE, "INFO")
#define WARN(arg) PRINT(arg, YELLOW, "WARN")
#define ERROR(arg) ERR(arg, RED, "ERROR")
#define FATAL(arg) ERR(arg, BLACK, "FATAL")

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
