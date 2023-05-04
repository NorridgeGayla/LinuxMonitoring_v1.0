#!/bin/bash

function isNumber {
    if [[ $1 =~ ^[+-]?[0-9]+([.][0-9]+)?$ ]]; then
        echo "Incorrect data"
    else
        echo $1
    fi
}

if [ $# -eq 1 ]
then
    isNumber $1
else
    echo "You have to enter one parameter!"
fi
