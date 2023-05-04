#!/bin/bash

chmod +x check_options.sh
chmod +x get_info.sh
chmod +x print_info.sh
chmod +x print_colors.sh

source check_options.sh

./print_info.sh ${colors[@]}
./print_colors.sh
