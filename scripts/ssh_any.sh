#!/bin/bash
hostname=$1
USER=${2-taylor}
NETWORK=${3-SCHOOL}

# Get SSID: (iwgetid -r)

# If at home, connect through schizo
if [ $hostname = 'schizo.cs.byu.edu' ]; then
	ssh tarch@$hostname
elif [ $hostname = 'pi3' ]; then
	if [ "$(iwgetid -r)" = "FifeNet" ]; then ssh pi@192.168.187.103; else ssh pi@fife.entrydns.org -p 57321; fi
elif [ $hostname = 'pi2' ]; then
	if [ "$(iwgetid -r)" = "FifeNet" ]; then ssh pi@192.168.187.98; else ssh pi@fife.entrydns.org -p 57323; fi
elif [[ $(route -n | grep 'UG[ \t]' | awk '{print $2}') =~ 192.168.18[78].1 ]]; then
	if [ $NETWORK = "HOME" ]; then
		echo "on home network, connecting to home"
		ssh $USER@$hostname
	elif [ $NETWORK = "SCHOOL" ]; then
		echo "on home network, connecting to school"
		ssh -t tarch@schizo.cs.byu.edu "ssh $USER@$hostname"
	fi
else
	if [ $NETWORK = "HOME" ]; then
		echo "on school network, connecting to home"
		ssh -t pi@fife.entrydns.org -p 57321 "ssh $USER@$hostname"
	elif [ $NETWORK = "SCHOOL" ]; then
		echo "on school network, connecting to school"
		ssh $USER@$hostname
	fi
fi


