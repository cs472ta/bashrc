#!/bin/bash

## Add this to CRON -- backup the repo at 6am
cron_command="0 6 * * * cd ~/bashrc && ./maintenance/update_bashrc.sh > ./cron.log 2>&1"
logname=$(/usr/bin/logname)

## Backup the old CRON in the repo
~/bashrc/scripts/add_to_cron.sh "$cron_command"

## Add bashrc to sources
if [[ -f ~/.bashrc ]]; then
    KEEP_EN="source /home/$(logname)/bashrc/master.sh"
    grep -q "$KEEP_EN" /home/$(logname)/.bashrc
    if [[ $? -ne 0 ]]; then
        echo "$KEEP_EN" >> ~/.bashrc
    fi
fi

cd ~/bashrc
message=${1:-"update"}
git add . && git commit -m "$message" && git push
git pull
git push
