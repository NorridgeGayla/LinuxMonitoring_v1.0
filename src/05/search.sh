#!/bin/bash

function isNumber {
    if [[ $1 =~ ^[1-6]$ ]]; then
        echo "1"
    else
        echo "0"
    fi
}

function check_name_files {
    array=( $@ )
    for index in ${!array[@]}
    do
        if [[ ${array[$index]:0:1} != "/" ]]
        then
            array[$index]="${path}${array[$index]}"
        fi
    done
    echo ${array[*]}
}

function count_directory {
    DIR=$( sudo find $path -type d | wc -l )
}

function get_top_five_directory {
    TOP_FIVE_DIR_NAME=($( sudo du --max-depth=1 -m -h $path | sort -hr | head -n 5 | awk '{ print $2 }' ))
    TOP_FIVE_DIR_SIZE=($( sudo du --max-depth=1 -m -h $path | sort -hr | head -n 5 | awk '{ print $1 }' ))
    TOP_FIVE_DIR_NAME=($( check_name_files ${TOP_FIVE_DIR_NAME[*]} ))
}

function count_files {
    TOTAL_FILES=$( sudo find $path -maxdepth 1 -type f | wc -l )
    CONF_FILES=$( sudo ls $path | grep -E "^?.conf$" | wc -l )
    TXT_FILES=$( sudo ls $path | grep -E '(^?.txt$)|(^?.md$)' | wc -l )
    EXE_FILES=$( sudo find $path -maxdepth 1 -type f -executable | wc -l )
    LOG_FILES=$( sudo ls -l $path | grep -E "^?.log$" | wc -l )
    ARCHIVE_FILES=$( sudo ls -l $path | grep -E '(^?.tar$)|(^?.gz$)|(^?.zip$)|(^?.rar$)' | wc -l )
    LINK=$( sudo find $path -maxdepth 1 -type l | wc -l )
}

function get_top_ten_files {
    TOP_TEN_FILES=($( sudo ls -lhS  $path | grep ^- | head -n 10 | awk '{ print $9 }' ))
    TOP_TEN_FILES_SIZE=($( sudo ls -lhS  $path | grep ^- | head -n 10 | awk '{ print $5 }' ))
    TOP_TEN_FILES=($( check_name_files ${TOP_TEN_FILES[*]} ))
}

function get_type_files {
    delimeter="."
    for index in ${!TOP_TEN_FILES[@]}
    do  
        result=${TOP_TEN_FILES[$index]##*$delimeter}
        if [[ ${TOP_TEN_FILES[$index]} != $result ]] && [[ $(isNumber $result) -eq 0 ]] && [[ $result != *"/"* ]]
        then
            TOP_TEN_FILES_TYPE[$index]=$result
        else
            TOP_TEN_FILES_TYPE[$index]="-"
        fi
        if [[ $index -eq 9 ]]
        then
            break
        fi
    done
}

function get_top_exe_files {
    TOP_TEN_EXE_FILES=($( sudo ls -lShF $path | grep "*" | head -n 10 | awk '{ print $9 }' ))
    TOP_TEN_EXE_FILES_SIZE=($(sudo ls -lShF $path | grep "*" | head -n 10 | awk '{ print $5 }' ))
    TOP_TEN_EXE_FILES=($( check_name_files ${TOP_TEN_EXE_FILES[*]} ))
}

function get_hash_sum {
    for index in ${!TOP_TEN_EXE_FILES[@]}
    do
        TOP_TEN_EXE_FILES_HASH[$index]=$( sudo md5sum ${TOP_TEN_EXE_FILES[$index]} | awk '{ print $1 }' )
        if [[ $index -eq 9 ]]
        then
            break
        fi
    done
}

count_directory
get_top_five_directory
count_files
get_top_ten_files
get_type_files
get_top_exe_files
get_hash_sum
