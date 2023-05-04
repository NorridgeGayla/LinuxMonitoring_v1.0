#!/bin/bash

source check_options.sh

function nameColor {
    case $1 in 
    1) echo "white";; # white
    2) echo "red";; # red
    3) echo "green";; # green
    4) echo "blue";; # blue
    5) echo "purple";; # purple
    6) echo "black";; # black
    esac
}

for index in ${!colors[@]};
do
    name_colors[$index]=$( nameColor ${colors[$index]} )
done

for index in ${!colors[@]};
do
    if [[ ${colors[$index]} -eq ${colors_default[$index]} ]]
    then
        colors[$index]="default"
    fi
done

echo -e "\nColumn 1 background = ${colors[0]} (${name_colors[0]})"
echo "Column 1 font color = ${colors[1]} (${name_colors[1]})"
echo "Column 2 background = ${colors[2]} (${name_colors[2]})"
echo "Column 2 font color = ${colors[3]} (${name_colors[3]})"
