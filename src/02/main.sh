#!/bin/bash

chmod +x get_info.sh
chmod +x print_info.sh

./print_info.sh

echo -n "Save data to file (Y/N)?: "
read answer
if [ $answer = 'Y' ] || [ $answer = 'y' ]
then
    ./print_info.sh > "$( date +'%d_%m_%Y_%H_%M_%S' ).status"
fi
