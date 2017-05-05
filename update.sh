#!/bin/bash
sudo openvpn stop
sudo apt update
sudo apt -y upgrade
sudo apt-get autoremove
sudo reboot
