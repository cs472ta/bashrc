#!/bin/bash

cron_command="0 6 * * * cd ~/bashrc && ./maintenance/update_bashrc.sh > ./cron.log 2>&1"

../scripts/add_to_cron.sh $(logname) "$cron_command"

# Add bashrc to sources
if [ -f ~/.bashrc ]; then
    KEEP_EN="source /home/$LOCAL_USER/bashrc/master.sh"
    grep -q "$KEEP_EN" /home/$LOCAL_USER/bashrc/master.sh
    if [ $? -ne 0 ]; then
        echo "source /home/$LOCAL_USER/bashrc/master.sh" >> ~/.bashrc
    fi
fi

cd ~/bashrc
message=${1:-"update"}
git add . && git commit -m "$message" && git push
git pull
git push
