#!/bin/bash
LOCAL_USER=${1-$(/usr/bin/logname)}

## Add this to CRON -- backup the repo at 6am
cron_command="0 6 * * * cd ~/bashrc && ./maintenance/update_bashrc.sh ${LOCAL_USER} > ./cron.log 2>&1"

~/bashrc/maintenance/run_once.sh

## Backup the old CRON in the repo
~/bashrc/scripts/add_to_cron.sh "$cron_command"

## Add bashrc to sources
if [[ -f ~/.bashrc ]]; then
    KEEP_EN="source /home/${LOCAL_USER}/bashrc/master.sh"
    grep -q "$KEEP_EN" /home/${LOCAL_USER}/.bashrc
    if [[ $? -ne 0 ]]; then
        echo "$KEEP_EN" >> ~/.bashrc
        echo "Updating .bashrc"
    fi
fi

cd ~/bashrc
message=${1:-"update"}
git add . && git commit -m "$message" && git push
git pull
git push
