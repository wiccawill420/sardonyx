#!/bin/bash
## change_vpn.sh by: William Lynn
## date: 2/2/2017

## to use, ./change_vpn.sh relative_path_to_file.ovpn

function do_it(){
	echo $(readlink -f $1)
	if [ -e "$1" ]; then
		sudo service openvpn stop
		sleep 1
		sudo rm /etc/openvpn/vpn.conf
		sudo ln -s $(readlink -f $1) /etc/openvpn/vpn.conf
		sudo service openvpn start
	else
		echo "File not found"
		sleep 2
		help
		exit 2
	fi
}
function help() {
	echo "This is the help page"
	echo "---------------------"
	echo "Setup"
	echo "Download some openvpn .ovpn files"
	echo "and put them in a folder somewhere in "
	echo "your home folder"
	echo "remove the openvpn conf file from /etc/openvpn/"
	echo "create an empty file $ sudo touch /etc/openvpn/vpn.conf"
	echo "and finally reboot"
	echo "How to use"
	echo "All you have to do is call this script with the"
	echo "file.ovpn you want to change to. Example"
	echo "$ ./change_vpn.sh ovpn_config/my_express_vpn_LA1.ovpn"
	echo "It will stop the service, delete previous symbolic link,"
	echo "create a new sym link /etc/openvpn/vpn.conf, and start the "
	echo "service again."
}

case $1 in 
	h|H|-h|-H|help|--help|"") help;;
	*) do_it $1
esac
