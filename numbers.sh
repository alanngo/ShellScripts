declare -i X=35
declare -i Y=24
echo $X+$Y # will print 35+24 as string
echo $(( X + Y )) # will print 59
echo $(( X - Y )) # will print 11
echo $(( X * Y )) # will print 840
echo $(( X / Y )) # will print 1
echo $(( X % Y )) # will print 11
echo expr $X + $Y