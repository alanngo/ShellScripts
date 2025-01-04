foods="pizza sushi wings ribs apples quit"


select food in $foods; do
    if [ $food == "quit" ]; then
        break
    fi
    echo "Eating $food"
done
