echo -n "Enter the first number : " 
read X 
echo -n "Enter the second number : " 
read Y 

# use expr keyword to denote numerical valuse
SUM=`expr $X + $Y` # use ` not '
echo $SUM
if [ $((SUM%2)) -eq 0 ]; then # use 'eq' for number comparison, use '==' for string comparison
    echo "even number"
else
    echo "odd number"
fi
