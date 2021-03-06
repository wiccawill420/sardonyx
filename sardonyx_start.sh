#!/bin/bash
#By: William

function fMAIN(){
#Check if this is ssh or regular terminal
if [ `printenv|grep SSH>/dev/null; echo $?` -ne 0 ]; then
clear

echo -e "${white}#############################${white}#${plain}"
echo -e "${white}#                            ${white}#${plain}"
echo -e "${white}#    ${lightcyan}Welcome to ${lightpurple}Sardonyx!    ${white}#${plain}"
echo -e "${white}#                            ${white}#${plain}"
echo -e "${white}# ${green}To watch shows, type ${blue}shows ${white}#${plain}"
echo -e "${white}# ${green}To play games, type ${blue}games  ${white}#${plain}"
echo -e "${white}# ${green}To open desktop, type ${blue}desk ${white}#${plain}"
echo -e "${white}#                            ${white}#${plain}"
echo -e "${white}# ${green}Have fun!                  ${white}#${plain}"
echo -e "${white}#                            ${white}#${plain}"
echo -e "${white}#############################${white}#${plain}"
echo ""
fi
}

function fCOLOR(){		#Define colors
green='\e[0;32m'
plain='\e[0m'
cyan='\e[0;36m'
red='\e[0;31m'
purple='\e[0;35m'
brown='\e[0;33m'
lightblue='\e[1;30m'
lightgreen='\e[1;32m'
lightcyan='\e[1;36m'
lightred='\e[1;31m'
lightpurple='\e[1;35m'
yellow='\e[1;33m'
blue='\e[1;34m'
white='\e[1;37m'
}

fCOLOR
fMAIN
