#!/bin/bash

LOCAL_USER=${1-$(logname)}
CRON_COMMAND=$2

# 59 23 * * * python3 /home/taylor/bashrc/ext/block_hosts/block.py --on --user taylor > /home/taylor/bashrc/ext/block_hosts/BLOCK.log 2>&1 # PERSISTENT

crontab_file=$(sudo crontab -l)

BACKUP_FOLDER="/home/$LOCAL_USER/bashrc/maintenance/${hostname}/backup_cron"
if [ ! -d $BACKUP_FOLDER ]; then mkdir $BACKUP_FOLDER; fi

echo "$crontab_file" > "/home/$LOCAL_USER/bashrc/maintenance/${hostname}/backup_cron"
echo "$crontab_file" | grep "${CRON_COMMAND:10:100}" # struggles with asterisks

# If grep doesn't find it
if [ $? -ne 0 ]; then
  # Check if crontab exists
  echo $crontab_file | grep -q "no crontab for"
  if [ $? -ne 0 ]; then
    echo "crontab exists"
    sudo crontab -l > mycron
  fi

  # Check if ends with double newline
  if ! [ -z "$(tail -n 1 mycron)" ]; then
        printf "\n" >> mycron
  fi

  # echo new cron into cron file
  echo "$CRON_COMMAND" >> mycron

  #install new cron file
  sudo crontab mycron
else
  echo "already installed"
fi

#cd /var/spool/cron/crontabs
#grep  'search string' *
