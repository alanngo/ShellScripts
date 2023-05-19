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
using namespace chrono;


#define SPACE " "
#define COLON ":"
#define NEWLINE "\n"[0]

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
    auto end = system_clock::now();
    time_t end_time = system_clock::to_time_t(end);

    // to string
    stringstream ss;
    ss << ctime(&end_time);
    string ret = "[ " + ss.str();
    ret.erase(std::remove(ret.begin(), ret.end(), NEWLINE), ret.cend());
    ret += SPACE;
    return ret + "]";
}
template <class E>
void print(
    ostream &o,
    const string &color,
    const string &type,
    const string &fi,
    const E &arg) { o << color << getTime()<<" --- " << "[" << fi << "] " << type << COLON << SPACE << arg << RESET << endl; }

#define PRINT(arg, color, type) print(clog, color, type, __FILE__, arg);
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

# create a test suite
mkdir "$PROJ_DIR/TestSuite"
echo '
#ifndef TEST_SUITE
#define TEST_SUITE
#include <iostream>
#include <string>
using namespace std;
class TestSuite
{
private:
    int num;
    int pass;
    int fail;
    const string desc;
    ostream &os;

#define FAIL false
#define PASS true
#define NULLPTR 0
#define NOTNULLPTR 1

    void newline()
    {
        os << endl;
    }
    void resolve(const bool &b)
    {
        if (b)
            pass++;
        else
            fail++;
        num++;
    }
    template <class E>
    void failTest(const E &expected, const E &actual)
    {
        os << "❌ TEST " << num << " FAILED! Expected " << expected << " Got " << actual << endl;
        resolve(FAIL);
    }
    template <class E>
    void failTest(const E &expected, const E &actual, int x)
    {
        os << "❌ TEST " << num << " FAILED! Expected value other than " << expected << " Got " << actual << endl;
        resolve(FAIL);
    }
    void failTest(const bool &statement)
    {
        os << "❌ TEST " << num << " FAILED! Statement should be " << (statement ? "true" : "false") << endl;
        resolve(FAIL);
    }
    void failTest(const int &n)
    {
        os << "❌ TEST " << num << " FAILED!, Object " << (n == NULLPTR ? "should" : "should not") << " be nullptr" << endl;
        resolve(FAIL);
    }
    void passTest()
    {
        os << "✅ Test " << num << " passed" << endl;
        resolve(PASS);
    }

public:
    /**
     * Generates a test suite w/ custom description
     * @param d description of test suite
     * @param o output stream buffer to write report to, defaults to clog
     */
    TestSuite(const string &, ostream &);

    /**
     * Generates default test suite and prints result to clog
     */
    TestSuite() : TestSuite("Sample Test", clog) {}

    /**
     * Assert equals
     * @param expected expected value
     * @param actual actual value
     */
    template <class E>
    void assertEq(const E &, const E &);

    /**
     * Assert Not equals
     * @param expected expected value
     * @param actual actual value
     */
    template <class E>
    void assertNotEq(const E &, const E &);

    /**
     * Assert true
     * @param condition should be true
     */
    void assertTrue(const bool &);

    /**
     * Assert false
     * @param condition should be false
     */
    void assertFalse(const bool &);

    /**
     * Assert Null or nullptr
     * @param ptr should point to NULL or nullptr
     */
    template <class E>
    void assertNull(E *);

    /**
     * Assert not Null or nullptr
     * @param ptr should NOT point to NULL or nullptr
     */
    template <class E>
    void assertNotNull(E *);

    /**
     * prints final report for test suite
     */
    ~TestSuite();

    // EXCLUDE
    /**
     * @dontinclude copy constructor
     */
    TestSuite(const TestSuite &) = delete;
    /**
     * @dontinclude move constructor
     */
    TestSuite(TestSuite &&) = delete;

    /**
     * @dontinclude prevent heap allocation
     */
    void *operator new(size_t) = delete;

    /**
     * @dontinclude prevent dynamic array allocation
     */
    void *operator new[](size_t) = delete;

    /**
     * @dontinclude prevent heap deallocation
     */
    void operator delete(void *) = delete;

    /**
     * @dontinclude prevent dynamic array deallocation
     */
    void operator delete[](void *) = delete;
};
#include "TestSuite.cpp"
#endif
' >> "$PROJ_DIR/TestSuite/TestSuite.hpp"

echo '
#include "TestSuite.hpp"
TestSuite::TestSuite(const string &d, ostream &o =clog) : num(0), pass(0), fail(0), desc(d), os(o)
{
    newline();
    os << "======== 🧪 Test Suite 🧪 ========" << endl;
    os << "Description: " << desc << endl;
    os << "==================================" << endl;
    newline();
}

template <class E>
void TestSuite::assertEq(const E &expected, const E &actual)
{
    if (expected == actual)
        passTest();
    else
        failTest(expected, actual);
}

template <class E>
void TestSuite::assertNotEq(const E &expected, const E &actual)
{
    if (expected != actual)
        passTest();
    else
        failTest(expected, actual, 1);
}

void TestSuite::assertTrue(const bool &condition)
{
    if (condition)
        passTest();
    else
        failTest(true);
}

void TestSuite::assertFalse(const bool &condition)
{
    if (!condition)
        passTest();
    else
        failTest(false);
}

template <class E>
void TestSuite::assertNull(E *ptr)
{
    if (ptr == nullptr || ptr == NULL)
        passTest();
    else
        failTest(NULLPTR);
}

template <class E>
void TestSuite::assertNotNull(E *ptr)
{
    if (ptr != nullptr || ptr != NULL)
        passTest();
    else
        failTest(NOTNULLPTR);
}

TestSuite::~TestSuite()
{
    newline();
    os << "Final Report: " << desc << endl;
    os << "==================================" << endl;
    if (pass > 0)
        os << "Passed " << pass << "/" << num << " tests ✅" << endl;
    if (fail > 0)
        os << "Failed " << fail << "/" << num << " tests ❌" << endl;
    os << "Total Tests: " << num << endl;
    os << "==================================" << endl;
    newline();
}

' >> "$PROJ_DIR/TestSuite/TestSuite.cpp"


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
g++ -g main.cpp -Wall -fsanitize=undefined -fsanitize=address
./a.out
rm -rf *.out">>"$PROJ_DIR/run.sh"

# gitignore
echo "*.out" >>"$PROJ_DIR/.gitignore"

# runner usage
echo "Use $PROJ_DIR/run.sh to run your program"
echo "1. $ cd $PROJ_DIR"
echo "2. $ ./run.sh"

# done 
