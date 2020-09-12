function foo() # we don't pass arguments in the parenthesis
{
    # this is how we pass arguments
    local NAME=$1
    local LANGUAGE=$2
    echo $NAME" loves "$LANGUAGE
    return 0
}
foo "6627" "shell" # calling functions with multiple arguments