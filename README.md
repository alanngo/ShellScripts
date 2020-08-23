
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
$ echo $<ENV_VARIABLE> # replace $<ENV_VARIABLE> w/ a variable from below
```
<img src ="https://phoenixts.com/wp-content/uploads/2016/02/environmentvariables.png" width = 500 height = 2500>