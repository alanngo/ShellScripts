echo "enter a value"
read VAR

while [ $VAR != "stop" ]; do
    echo "recorded " $VAR
    echo "enter another value: "
    read VAR
done 