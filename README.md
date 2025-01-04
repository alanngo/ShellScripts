
<img src="shell.jpg" align="right" width = 100 height=100>

# Bash Shell

<br>
<img src="tux.png" align = "left" width = 50 height = 60>

#### Basic 

- BE CAREFUL W/ SPACES
- we want to automate linux commands
- know the following commands by heart
    - echo
    - pwd
    - ls
    - cd
    - cat
    - read
    - alias
    - git commands
- how to run a shell script
```bash
$ ./<SCRIPT_NAME>.sh # use this for running shell scripts from working directory
$ sh <SCRIPT_NAME>.sh # use this for running shell scripts from different directory
$ bash <SCRIPT_NAME>.sh # running a script using bash command 
$ zsh <SCRIPT_NAME>.sh # running a script using zsh command 
```
<br>
<img src="tux.png" align = "left" width = 50 height = 60>

#### Comments

```shell
# this is a comment
# don't catch you slippin now
```
<br>
<img src="tux.png" align = "left" width = 50 height = 60>

#### Variables
<b><i>Excplicit Declaration</i></b>

```shell
VAR="sanjna" # declaring a variable explicitly
echo $VAR # referencing a declared variable
```

<b><i>Storing Outputs in Variables</i></b>

```shell
# use $(command) to store output of 'command' in a astring
MESSAGE="Hello $(whoami), you are currently in $(pwd)"
echo $MESSAGE 
```

<b><i>Numerical values</i></b>

```shell
declare -i X=43 # declaring an int variable
echo $X # treat '43' as a string
echo $(( X )) # treat '43' as a number
```

<table>
    <tr>
        <td><b>Operator</b></td>
        <td><b>Functionality</b></td>
        <td><b>Example</b></td>
    </tr>
    <tr>
        <td>+</td>
        <td>addition</td>
        <td>$(( X + Y ))</td>
    </tr>
    <tr>
        <td>-</td>
        <td>subtraction</td>
        <td>$(( X - Y ))</td>
    </tr>
    <tr>
        <td>*</td>
        <td>multiplication</td>
        <td>$(( X * Y ))</td>
    </tr>
    <tr>
        <td>/</td>
        <td>division</td>
        <td>$(( X / Y ))</td>
    </tr>
    <tr>
        <td>%</td>
        <td>modulus</td>
        <td>$(( X % Y ))</td>
    </tr>
</table>

<b><i>User Input</i></b>

```shell
read VAR # takes user input from keyboard
echo $VAR # referencing a declared variable
```
<b><i>Positional Command Line Argument</i></b>

```shell
echo $1 # prints first arg
echo $2 # prints second arg
...
echo ${10} # prints the 10th argument 
echo ${20} # prints the 20th argument
# arguments after 9th must be enclosed in {}
```
<i>Iterate thru Command Line Argument</i>

```shell
for ARG in "$*"
do
    echo $ARG
done
```

<b><i>Optional-Value Variables</i></b>
  
  - replaces empty checks
  - much cleaner way to deal with optional variables
  
```bash
YOUTUBER=${1:-"Linus Tech Tips"} # if first arg is not present, default to Linus Tech Tips
```


<b><i>Environment Variables</i></b>

- system/program info stored in variables
- you can figure out their values by using the command below

```shell
$ echo $<ENV_VARIABLE> # replace <ENV_VARIABLE> w/ a variable from below
```
- Useful commands when working w/ environment variables

```bash
$ env  # The command lists all of the environment variables in the shell.
$ printenv # The command prints all environment variables.
$ set # The command assigns or defines an environment variable.
$ unset # The command deletes the environment variable. 
$ export # The command exports the value of the newly assigned environment variable.
```
- list of common linux environment variables

```shell
USER # The current logged in user.
HOME #The home directory of the current user.
EDITOR # The default file editor to be used i.e: vim, nano, emacs, ect... 
SHELL # The path of the current user’s shell, such as bash or zsh.
LOGNAME # The name of the current user.
PATH # A list of directories to be searched when executing commands. 
LANG # The current locales settings.
TERM # The current terminal emulation.
MAIL # Location of where the current user’s mail is stored.
```
<br>
<img src="tux.png" align = "left" width = 50 height = 60>

#### Conditionals
- SPACES MATTER in between brackets and expression
- 4 kinds
    - if 
    - else
    - elif
    - case
- comparison operators
<table>
<tr>
    <td><b>Operator</b></td>
    <td><b>Functionality</b></td>
    <td><b>Example</b></td>
</tr>
<tr>
    <td>==</td>
    <td>two strings are equal</td>
    <td>$VAR1 == $VAR2</td>
</tr>
<tr>
    <td>!=</td>
    <td>two strings are NOT equal</td>
    <td>$VAR1 != $VAR2</td>
</tr>
<tr>
    <td><</td>
    <td>less than for strings</td>
    <td>$VAR1 < $VAR2</td>
</tr>
<tr>
    <td>></td>
    <td>greater than for strings</td>
    <td>$VAR1 > $VAR2</td>
</tr>
<tr>
    <td>-n</td>
    <td>string length > 0</td>
    <td>-n $VAR1</td>
</tr>
<tr>
    <td>-z</td>
    <td>string length == 0</td>
    <td>-z $VAR1</td>
</tr>
<tr>
    <td>-eq</td>
    <td>two numbers are equal</td>
    <td>$num1 -eq $num2</td>
</tr>
<tr>
    <td>-ne</td>
    <td>two numbers are NOT equal</td>
    <td>$num1 -ne $num2</td>
</tr>
<tr>
    <td>-lt</td>
    <td>less than for numbers</td>
    <td>$num1 -lt $num2</td>
</tr>
<tr>
    <td>-le</td>
    <td>less than or equals for numbers</td>
    <td>$num1 -le $num2</td>
</tr>
<tr>
    <td>-gt</td>
    <td>greater than for numbers</td>
    <td>$num1 -gt $num2</td>
</tr>
<tr>
    <td>-ge</td>
    <td>greater than or equals for numbers</td>
    <td>$num1 -ge $num2</td>
</tr>
</table>

if, else, elif, else
```shell
if [ expression ]; then # need a space between brackets 
   ...
elif [ expression ]; then
    ...
else
    ...
fi # DO NOT FORGET THE FINISH CLAUSE!
```
case
```shell
case $VAR in
    pattern1)
    ...
    ;; # don't forget the terminating statements
    pattern2)
    ...
    ;;
    pattern3)
    ...
    ;;
    *) # default case
    echo "default case "
esac # finish clause for case
```

<br>
<img src="tux.png" align = "left" width = 50 height = 60>

#### Loops
- while
- for
- until

```shell
# standard while loop
while [ condition ]; do  # spaces matter between brackets
    ...
done # don't forget the done clause
```

```shell
# infinite while loop
while :  # ':' will always evaluate to true
do 
    ...
done # don't forget the done clause
```
```shell
# for loop
for var in v0 v1 v2 ... vN; do  # set of words
    ...
done # don't forget the done clause
```
```shell
# until loop
until [ condition ]; do
    ...
done # don't forget the done clause
```

<br>
<img src="tux.png" align = "left" width = 50 height = 60>

#### Arrays
- they are dynamically sized
- they are loosely typed
- zero-based indexed

```shell
ARRAY=(1 2 3 4 5) # declaring an array
```

This is how to print arrays
```shell
# print the whole array
echo ${ARRAY[@]}
echo ${ARRAY[*]}
# * and @ means all
```
```shell
# print the array in a certain range
echo ${ARRAY[@]:1} # gives us 2 3 4 5
echo ${ARRAY[*]:1:3} # gives us 2 3 
# ${ARRAY[*]:<START>:<COUNT_ELEMENT>} => array from index <START> and count 
# the number of elements specified by <COUNT_ELEMENT>
# if no count is specified, it will be from <START> to end of array
```
```shell
# using for loop
for e in "${ARRAY[*]}; do
    echo $e
done
```
How to access array properties
```shell
# print an array at a certain index
echo ${ARRAY[2]} # gives us 3

# print the size of an array
echo ${#ARRAY[*]} # gives us 5
```

<br>
<img src="tux.png" align = "left" width = 50 height = 60>

#### Functions
- can take 0 or multiple arguments
- called differently than other programming languages
- use these for large-scale automation

Defining and calling a function method 1
```shell
foo() # defining foo
{
    ... # do stuff
}

foo # calling foo DO NOT USE ()
```
Defining and calling a function method 2 USE THIS METHOD
```shell
function foo() # defining foo by using 'function keyword'
{
    ... # do stuff
}

foo # calling foo
```

Defining and calling a function with arguments
```shell
function foo()
{
    # use the 'local' keyword to declare variables in the functions scope
    local A1=$1
    local A2=$2
    ...
}

foo  "abc" "def" # calling foo with arguments
```

Returning a value from a function
```shell
function foo() # defining foo by using 'function keyword'
{
    return 123
}

foo # calling foo DO NOT USE ()
```


#### Show git branch in terminal

append this into `~/.bashrc`
```bash
# Show git branch name
force_color_prompt=yes
color_prompt=yes
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt
```