function good_computer()
{
    local COMPUTER=$1
    case $COMPUTER in 
        "chromebook")
        echo "chromebooks suck"
        ;;
        "mac")
        echo "betteer than chromebook, but expensive"
        ;;
        "pc"|"PC")
        echo "good performance and value"
        ;;
        "linux")
        echo "best performance and value"
        ;;
        *)
        echo "potato"
    esac 
}

good_computer "chromebook"
good_computer "mac"
good_computer "PC"
good_computer "blank string"