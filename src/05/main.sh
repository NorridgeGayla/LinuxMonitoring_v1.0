#!/bin/bash

chmod +x print_info.sh
chmod +x search.sh

output=1

if [ $# -eq 1 ]
then
    if [ -d $1  ]
    then
        ./print_info.sh $1
    else
        output=0
        echo "It's not a directory"
    fi
else
    output=0
    echo "You have to enter one parameter!"  
fi

if [ $output -eq 0 ]
then
    echo -n "Enter the correct path: "
    read answer
    ./main.sh $answer
fi
