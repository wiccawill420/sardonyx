#!/bin/bash
# tuncheckd.sh
# By: William Lynn
# Continues to check for the VPN tunnel while Kodi is running
# Kills Kodi if the tunnel ever goes down

while true; do
	sleep 5m
	if [ $(ifconfig|grep tun > /dev/null;echo $?) -ne 0 ]
		then
			echo "Tunnel Died! Closed Kodi as a precaution." | wall
			sudo killall -9 -g kodi
			exit 1
	fi
	if [ $(ps aux|grep -v grep|grep kodi.sh > /dev/null;echo $?)  -ne 0 ]
		then
			exit 0
	fi
done
