#!/bin/bash
## change_vpn.sh by: William Lynn
## date: 2/2/2017

sudo service openvpn stop
sleep 1
sudo rm /etc/openvpn/vpn.conf
sudo ln -s $(readlink -f $1) /etc/openvpn/vpn.conf
sudo service openvpn start
