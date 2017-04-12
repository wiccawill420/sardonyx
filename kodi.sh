#!/bin/bash
#By: William Lynn

function fCHECK(){
	if [ $(ifconfig|grep tun > /dev/null;echo $?) -eq 0 ]
		then
			echo ""
			echo -e "${cyan}Tunnel is ${green}up${cyan}," 
			echo -e "${cyan}starting ${blue}Kodi${plain}"
			/home/pi/bin/tuncheckd.sh &
			sleep 3
			sudo /home/pi/bin/clear-caches.sh
			kodi
		else
			echo ""
			echo -e "${lightred}Tunnel seems ${red}down!!${plain}"
			echo -e "${blue}Please manually check vpn status${plain}"
			echo -e "${blue}Check ${lightcyan}ifconfig${blue} for tun0 device${plain}"
			echo -e "${blue}Try ${lightcyan}sudo service openvpn start${plain}"
			echo -e "${blue}To bypass check, start with ${green}-y ${blue}flag${plain}"
			read -p "Try auto-starting the vpn? [y/n] >> " vSTART
			if [ "$vSTART" == "y" ]
				then
					fSTARTVPN
				else
					exit 1
			fi
	fi
}

function fSTARTVPN(){
	echo "Attempting to start vpn"
	sudo service openvpn restart
	sleep 5
	if [ $(ifconfig|grep tun > /dev/null;echo $?) -eq 0 ]
		then
			echo "It worked!"
			fCHECK
		else
			echo "Failure to start tunnel. Check connection"
	fi
}

function fMAIN(){
	case $args in
		-y)
			echo ""
			echo -e "${red}Starting without vpn checks${plain}"
			read -p "Enter y to start > " bypass
			if [ "$bypass" == "y" ]
				then
				sudo /home/pi/bin/clear-caches.sh	
				kodi
				else
					echo -e "${red}Exiting${plain}"
					exit 1
			fi
			;;
		"")
			fCHECK
			;;
		*)
			echo ""
			echo -e "${red}Unknown flag, exiting${plain}"
			exit 1
			;;
	esac
}

function fCOLOR(){		#Define colors
	green='\e[0;32m'
	plain='\e[0m'
	cyan='\e[0;36m'
	red='\e[0;31m'
	purple='\e[0;35m'
	brown='\e[0;33m'
	lightgreen='\e[1;32m'
	lightcyan='\e[1;36m'
	lightred='\e[1;31m'
	lightpurple='\e[1;35m'
	yellow='\e[1;33m'
	blue='\e[1;34m'
	white='\e[1;37m'
}

args="$1"
fCOLOR
fMAIN
