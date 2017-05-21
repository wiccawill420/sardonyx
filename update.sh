#!/bin/bash
sudo service openvpn stop
sudo apt update
sudo apt -y upgrade
sudo apt-get autoremove
sudo reboot
