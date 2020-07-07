#!/bin/bash
hostname=$1
USER=${2-taylor}
DEST_NETWORK=${3-SCHOOL} # destination
CURRENT_NETWORK=${4-UNSPECIFIED} # - LOCAL/REMOTE
ON_HOME=false;
ON_SCHOOL=false;

echo "command: $0"
echo "host: $hostname"
echo "user network: $USER"
echo "dest network: $DEST_NETWORK" 
echo "current network: $CURRENT_NETWORK" 

if [ $CURRENT_NETWORK = "UNSPECIFIED" ]; then
	if [[ $(route -n | grep 'UG[ \t]' | awk '{print $2}') =~ 192.168.18[78].1 ]]; then # on home network
		ON_HOME=true;
	elif [[ $(route -n | grep 'UG[ \t]' | awk '{print $2}') =~ 192.168.29.1 ]]; then
		ON_SCHOOL=true;
	fi;
	
	if $ON_HOME && [ $DEST_NETWORK = 'HOME' ]; then
		CURRENT_NETWORK="LOCAL"
	elif $ON_SCHOOL && [ $DEST_NETWORK = 'SCHOOL' ]; then
		CURRENT_NETWORK="LOCAL"
	else
		CURRENT_NETWORK="REMOTE"
	fi;
fi;

echo "current network: $CURRENT_NETWORK" 
echo "on_home: $ON_HOME, on_school: $ON_SCHOOL"
# Get SSID: (iwgetid -r)
# [ "$(iwgetid -r)" = "FifeNet" ]
# ONLY WORKS FOR WIFI

# If at home, connect through schizo
if [ $hostname = 'schizo.cs.byu.edu' ]; then
	ssh tarch@$hostname
elif [ $hostname = 'pi3' ]; then
	if $ON_HOME; then ssh pi@192.168.187.103; else ssh pi@fife.entrydns.org -p 57321; fi
elif [ $hostname = 'pi2' ]; then
	if $ON_HOME; then ssh pi@192.168.187.99; else ssh pi@fife.entrydns.org -p 57322; fi # 57322 for WiFi; 57322 for Eth 
elif [ "$CURRENT_NETWORK" = 'LOCAL' ] ; then
	echo "on local network"
	ssh $USER@$hostname
elif [ "$CURRENT_NETWORK" = "REMOTE" ] && [ $DEST_NETWORK = "SCHOOL" ]; then
	echo "on home network, connecting to school"
	ssh -t tarch@schizo.cs.byu.edu "ssh $USER@$hostname";
elif [ "$CURRENT_NETWORK" = "REMOTE" ] && [ $DEST_NETWORK = "HOME" ]; then
	echo "on school network, connecting to home"
	ssh -t pi@fife.entrydns.org -p 57321 "ssh $USER@$hostname";
fi

# Comment?
: '
	if [ $DEST_NETWORK = "HOME" ]; then
		echo "on home network, connecting to home"
		ssh $USER@$hostname
	elif [ $DEST_NETWORK = "SCHOOL" ]; then
		echo "on home network, connecting to school"
		ssh -t tarch@schizo.cs.byu.edu "ssh $USER@$hostname"
	fi
else
	if [ $DEST_NETWORK = "HOME" ]; then
		echo "on school network, connecting to home"
		ssh -t pi@fife.entrydns.org -p 57321 "ssh $USER@$hostname"
	elif [ $DEST_NETWORK = "SCHOOL" ]; then
		echo "on school network, connecting to school"
		ssh $USER@$hostname
	fi
fi
'
