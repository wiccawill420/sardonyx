#!/bin/bash
# tuncheckd.sh
# By: William Lynn
# Continues to check for the VPN tunnel while Kodi is running
# Kills Kodi if the tunnel ever goes down
# Update Jan 9, 2017: integrated Andrew's website for live location checking
# Update Jan 30, 2017: added check for failure of curl to kill kodi

while true; do		#Keep the party going
	sleep 1 m		#Every 60 seconds
#Create a random value that is 32 alphanumeric characters long
#Use Andrew's site to check the state we are connecting from
#0 is good, above 0 is not. ie, if we are connecting from NV, then the tunnel is down
	vRAND=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1`
	vGOOD=`curl -s "http://interruptr.com/ipcheck/?state=NV&rnd=$vRAND"`
# If curl fails, set var to failure 
	if [ $? -ne 0 ]
		then
			vGOOD=2
	fi

#If the site returned higher than 0, kill kodi
	if [ $vGOOD -gt 0 ]		
		then
			echo "Tunnel Died! Closed Kodi as a precaution." | wall
			sudo killall -9 -g kodi
			exit 1
	fi

#When kodi exits, close this as well
	if [ $(ps aux|grep -v grep|grep kodi.sh > /dev/null;echo $?)  -ne 0 ]
		then
			exit 0
	fi
done
