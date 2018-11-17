#!/bin/bash

help()
{
    cat help.txt
    echo ""
    cat static_commands.txt
    echo ""
}

CurrentDirectory=$1

# No Argument Condition
if [ $# -eq 1 ]
then
    help
    exit 0
fi



# Flags
case $2 in
    -h|--help)
        if [ -z "$3" ]
        then
            help
        else
            cat ../Commands/$2/help.txt
            echo ""
        fi
        exit 0
    ;;
    -s|--sudo)
        # line is a command, command is a key word
        while IFS='' read -r line || [[ -n "$line" ]]
        do    
            if [ "$line" == "$3" ]
            then
                cd ../Commands/$line
                sudo ./run.sh $CurrentDirectory ${@:4}
                exit 0
            fi
        done < "static_commands.txt"
        exit 0
    ;;
esac


# No Flag Condition
# line is a command, command is a key word
while IFS='' read -r line || [[ -n "$line" ]]
do
    if [ "$line" == "$2" ]
    then
        cd ../Commands/$line
        ./run.sh $CurrentDirectory ${@:3}
        exit 0
    fi
done < "static_commands.txt"

echo "Command Not Found"
echo ""
help
exit 0