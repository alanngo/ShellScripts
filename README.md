
<img src="shell.jpg" align="right" width = 100 height=100>

# Bash Shell
### 6627's favorite language

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
$ sh <SCRIPT_NAME> # use this for running shell scripts from different directory
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
for ARG in "$@"
do
    echo $ARG
done
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
How to access arrays at a certain index
```shell
# print an array at a certain index
echo ${ARRAY[2]} # gives us 3
```