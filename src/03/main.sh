#!/bin/bash

chmod +x get_info.sh
chmod +x print_info.sh

function isNumber {
    if [[ $1 =~ ^[1-6]$ ]]; then
        echo "1"
    else
        echo "0"
    fi
}

output=0

if [[ $# -eq 4 ]]
then
    for var in $@
    do
        output=$( isNumber $var )
        if [[ $output -eq 0 ]]
        then
            echo "Invalid data!"
            break
        fi
    done
    if [[ $output -eq 1 ]]
    then
        if [[ $1 -ne $2 ]] && [[ $3 -ne $4 ]]
        then
            ./print_info.sh $@
        else
            echo "Same color for text and background!"
            output=0
        fi
    fi
else
    echo "You have to write 4 options!"
fi

if [[ $output -eq 0 ]] 
then
    echo -n "Input correct options: "
    read options
    ./main.sh $options
fi
