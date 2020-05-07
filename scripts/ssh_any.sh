#!/bin/bash
hostname=$1
USER=${2-taylor}
DEST_NETWORK=${3-SCHOOL} # destination
CURRENT_NETWORK=${4-UNSPECIFIED} # - LOCAL/REMOTE
ON_HOME=false;

if [ $CURRENT_NETWORK = "UNSPECIFIED" ]; then
	if [[ $(route -n | grep 'UG[ \t]' | awk '{print $2}') =~ 192.168.18[78].1 ]]; then # on home network
		ON_HOME=true;
	fi;
	if $ON_HOME && [ $DEST_NETWORK = 'HOME' ]; then
		CURRENT_NETWORK="LOCAL"
	elif ! $ON_HOME && [ $DEST_NETWORK = 'SCHOOL' ]; then
		CURRENT_NETWORK="LOCAL"
	else
		CURRENT_NETWORK="REMOTE"
	fi;
fi;

echo "current network: $CURRENT_NETWORK" 
# Get SSID: (iwgetid -r)

# If at home, connect through schizo
if [ $hostname = 'schizo.cs.byu.edu' ]; then
	ssh tarch@$hostname
elif [ $hostname = 'pi3' ]; then
	if [ "$(iwgetid -r)" = "FifeNet" ]; then ssh pi@192.168.187.103; else ssh pi@fife.entrydns.org -p 57321; fi
elif [ $hostname = 'pi2' ]; then
	if [ "$(iwgetid -r)" = "FifeNet" ]; then ssh pi@192.168.187.98; else ssh pi@fife.entrydns.org -p 57323; fi
elif [ "$CURRENT_NEWORK" = 'LOCAL' ] ; then
	echo "on local network"
	ssh $USER@$hostname
elif [ "$CURRENT_NEWORK" = "REMOTE" ] && [ $DEST_NETWORK = "SCHOOL" ]; then
	echo "on home network, connecting to school"
	ssh -t tarch@schizo.cs.byu.edu "ssh $USER@$hostname";
elif [ "$CURRENT_NEWORK" = "REMOTE" ] && [ $DEST_NETWORK = "HOME" ]; then
	echo "on school network, connecting to home"
	ssh -t pi@fife.entrydns.org -p 57321 "ssh $USER@$hostname";
fi

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
