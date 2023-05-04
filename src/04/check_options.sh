#!/bin/bash

source colors.conf

colors[0]=$column1_background
colors[1]=$column1_font_color
colors[2]=$column2_background
colors[3]=$column2_font_color

colors_default=( "2" "4" "4" "2" )

for index in ${!colors[@]};
do
    if [[ -z ${colors[$index]} ]]
    then
        colors[$index]=${colors_default[$index]}
    fi
done

function isNumber {
    if [[ $1 =~ ^[1-6]$ ]]; then
        echo "1"
    else
        echo "0"
    fi
}

for index in ${!colors[@]};
do
    output=$( isNumber ${colors[$index]} )
    if [[ $output -eq 0 ]]
    then
        colors[$index]=${colors_default[$index]}
    fi
done

if [[ ${colors[0]} -eq ${colors[1]} ]]
then
    colors[0]=${colors_default[0]}
    colors[1]=${colors_default[1]}
fi

if [[ ${colors[2]} -eq ${colors[3]} ]]
then
    colors[2]=${colors_default[2]}
    colors[3]=${colors_default[3]}
fi