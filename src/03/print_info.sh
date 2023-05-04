#!/bin/bash

source get_info.sh

function getColor {
    case $1 in 
    1) echo "97";; # white
    2) echo "91";; # red
    3) echo "92";; # green
    4) echo "94";; # blue
    5) echo "95";; # purple
    6) echo "30";; # black
    esac
}

RESET="\033[0m"

column1_background="\033[$(( $( getColor $1 )+10 ))m"
column1_font_color="\033[$( getColor $2 )m"
column2_background="\033[$(( $( getColor $3 )+10 ))m"
column2_font_color="\033[$( getColor $4 )m"

echo -e "${column1_background}${column1_font_color}HOSTNAME${RESET} = ${column2_background}${column2_font_color}$HOSTNAME${RESET}"
echo -e "${column1_background}${column1_font_color}TIMEZONE${RESET} = ${column2_background}${column2_font_color}$TIMEZONE${RESET}"
echo -e "${column1_background}${column1_font_color}USER${RESET} = ${column2_background}${column2_font_color}$USER${RESET}"
echo -e "${column1_background}${column1_font_color}OS${RESET} = ${column2_background}${column2_font_color}$OS${RESET}"
echo -e "${column1_background}${column1_font_color}DATE${RESET} = ${column2_background}${column2_font_color}$DATE${RESET}"
echo -e "${column1_background}${column1_font_color}UPTIME${RESET} = ${column2_background}${column2_font_color}$UPTIME${RESET}"
echo -e "${column1_background}${column1_font_color}UPTIME_SEC${RESET} = ${column2_background}${column2_font_color}$UPTIME_SEC${RESET}"
echo -e "${column1_background}${column1_font_color}IP${RESET} = ${column2_background}${column2_font_color}$IP${RESET}"
echo -e "${column1_background}${column1_font_color}MASK${RESET} = ${column2_background}${column2_font_color}$MASK${RESET}"
echo -e "${column1_background}${column1_font_color}GATEWAY${RESET} = ${column2_background}${column2_font_color}$GATEWAY${RESET}"
echo -e "${column1_background}${column1_font_color}RAM_TOTAL${RESET} = ${column2_background}${column2_font_color}$RAM_TOTAL${RESET}"
echo -e "${column1_background}${column1_font_color}RAM_USED${RESET} = ${column2_background}${column2_font_color}$RAM_USED${RESET}"
echo -e "${column1_background}${column1_font_color}RAM_FREE${RESET} = ${column2_background}${column2_font_color}$RAM_FREE${RESET}"
echo -e "${column1_background}${column1_font_color}SPACE_ROOT${RESET} = ${column2_background}${column2_font_color}$SPACE_ROOT${RESET}"
echo -e "${column1_background}${column1_font_color}SPACE_ROOT_USED${RESET} = ${column2_background}${column2_font_color}$SPACE_ROOT_USED${RESET}"
echo -e "${column1_background}${column1_font_color}SPACE_ROOT_FREE${RESET} = ${column2_background}${column2_font_color}$SPACE_ROOT_FREE${RESET}"
