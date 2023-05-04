#!/bin/bash

RESET="\033[0m"
B="\033[40m"
H_F="\033[34m"
R_F="\033[32m"
L_F="\033[33m"
T_F="\033[31m"

START=$( date +%s%3N)
path=$1

length=$(( ${#path} - 1 ))

if [[ ${path:$length} != "/" ]]
then
    path="$path/"
fi

source ./search.sh

echo -e "${B}${H_F}Total number of folders (including all nested ones) = ${R_F}$DIR${RESET}"
echo -e "${B}${H_F}TOP 5 folders of maximum size arranged in descending order (path and size):${RESET}"
for index in ${!TOP_FIVE_DIR_NAME[@]}
do
    echo -e "\t${B}${L_F}$(( $index + 1 )) - ${TOP_FIVE_DIR_NAME[$index]}, ${R_F}${TOP_FIVE_DIR_SIZE[$index]}${RESET}"
done
echo -e "${B}${H_F}Total number of files = ${R_F}$TOTAL_FILES${RESET}"
echo -e "${B}${H_F}Number of:${RESET}"
echo -e "\t${B}${L_F}Configuration files (with the .conf extension) = ${R_F}$CONF_FILES${RESET}"
echo -e "\t${B}${L_F}Text files = ${R_F}$TXT_FILES${RESET}"
echo -e "\t${B}${L_F}Executable files = ${R_F}$EXE_FILES${RESET}"
echo -e "\t${B}${L_F}Log files (with the extension .log) = ${R_F}$LOG_FILES${RESET}"
echo -e "\t${B}${L_F}Archive files = ${R_F}$ARCHIVE_FILES${RESET}"
echo -e "\t${B}${L_F}Symbolic links = ${R_F}$LINK${RESET}"
echo -e "${B}${H_F}TOP 10 files of maximum size arranged in descending order (path, size and type):${RESET}"
for index in ${!TOP_TEN_FILES[@]}
do
    echo -e "\t${B}${L_F}$(( $index + 1 )) - ${TOP_TEN_FILES[$index]}, ${R_F}${TOP_TEN_FILES_SIZE[$index]}, ${T_F}${TOP_TEN_FILES_TYPE[$index]}${RESET}"
done
echo -e "${B}${H_F}TOP 10 executable files of the maximum size arranged in descending order (path, size and and MD5 hash of file):${RESET}"
for index in ${!TOP_TEN_EXE_FILES[@]}
do
    echo -e "\t${B}${L_F}$(( $index + 1 )) - ${TOP_TEN_EXE_FILES[$index]}, ${R_F}${TOP_TEN_EXE_FILES_SIZE[$index]}, ${T_F}${TOP_TEN_EXE_FILES_HASH[$index]}${RESET}"
    if [[ $index -eq 9 ]]
    then
        break
    fi
done
END=$( date +%s%3N )
DIFF=$(( "$END - $START" ))
SEC=$( echo $DIFF | awk '{printf "%.3f", $DIFF / 1000}' )
echo -e "${B}${H_F}Script execution time (in seconds) = \033[41m\033[30m$SEC sec${RESET}"
