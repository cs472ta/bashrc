#!/bin/bash
hostname=$1
USER=${2-taylor}
NETWORK=${3-SCHOOL}

# If at home, connect through schizo
if [ $hostname = 'schizo.cs.byu.edu' ]; then
	ssh tarch@$hostname

elif [ $(route -n | grep 'UG[ \t]' | awk '{print $2}') == '192.168.187.1' ]; then
	if [ $NETWORK = "HOME" ]; then
		ssh $USER@$hostname
	elif [ $NETWORK = "SCHOOL" ]; then
		ssh -t tarch@schizo.cs.byu.edu 'ssh $USER@$hostname'
	fi
else
	if [ $NETWORK = "HOME" ]; then
		ssh -t pi@fife.entrydns.org -p 57321 'ssh $USER@$hostname'
	elif [ $NETWORK = "SCHOOL" ]; then
		ssh $USER@$hostname
	fi
fi


