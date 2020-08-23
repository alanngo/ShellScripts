
<img src="shell.jpg" align="right" width = 100 height=100>

# Bash Shell
### 6627's favorite language

#### Basic 
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
$ ./<SCRIPT_NAME>.sh
```
#### Comments

```shell
# this is a comment
# don't catch you slippin now
```

#### Variables
<b><i>Excplicit Declaration</i></b>
```shell
VAR = "sanjna" # declaring a variable explicitly
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
- you can figure out their values by using 
```shell
$ echo $<ENV_VARIABLE> # replace <ENV_VARIABLE> w/ a variable from below
```
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