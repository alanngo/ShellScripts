
ARR=( "java" "shell" "sql" "chromebook" "macbook" "research" "flask" ) # declaring an array
echo "6627 loves" ${ARR[*]} # print all elements in array

echo "6627 REALLY loves" ${ARR[1]} # print the element @ index 1      

echo "6627 loves to teach" ${ARR[*]:1:2} # print the elements at index 1 thru 2

echo "there are "${#ARR[*]}" elements in 6627 favorite list" # prints the size of array

echo "using a for loop"
for e in ${ARR[*]}; do
    echo $e
done
