#!/bin/bash

CRON_COMMAND=$1
LOCAL_USER=${2-$(logname)}
FILE_NAME=${3-$(logname)} # extend to work with any file, not just CRON
SUDO=${4-""} # specify SUDO if backing up sudo cron

# 59 23 * * * python3 /home/taylor/bashrc/ext/block_hosts/block.py --on --user taylor > /home/taylor/bashrc/ext/block_hosts/BLOCK.log 2>&1 # PERSISTENT

crontab_file=$($SUDO crontab -l)

## BACKUP CRON PATH
/home/$(logname)/bashrc/scripts/backup_path.sh CRON

echo "$crontab_file" | grep "${CRON_COMMAND:10:100}" # struggles with asterisks

# If grep doesn't find it
if [ $? -ne 0 ]; then
  # Check if crontab exists
  echo $crontab_file | grep -q "no crontab found for $(logname)"
  if [ $? -ne 0 ]; then
    echo "crontab exists"
    echo "$crontab_file" > mycron
  fi

  # Check if ends with double newline
  if ! [ -z "$(tail -n 1 mycron)" ]; then
        printf "\n" >> mycron
		echo "added line to cron"
  fi

  # echo new cron into cron file
  echo "$CRON_COMMAND" >> mycron

  #install new cron file
  $SUDO crontab mycron
  
  rm mycron
  
else
  echo "already installed"
fi

#cd /var/spool/cron/crontabs
#grep  'search string' *


#
#grep + echo should suffice:
#grep -qxF 'include "/configs/projectname.conf"' foo.bar || echo 'include "/configs/projectname.conf"' >> foo.bar
#-q be quiet
#-x match the whole line
#-F pattern is a plain string
