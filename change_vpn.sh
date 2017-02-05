#!/bin/bash
## change_vpn.sh by: William Lynn
## date: 2/2/2017

## to use, ./change_vpn.sh relative_path_to_file.ovpn

sudo service openvpn stop
sleep 1
sudo rm /etc/openvpn/vpn.conf
sudo ln -s $(readlink -f $1) /etc/openvpn/vpn.conf
sudo service openvpn start
