#!/bin/bash

PATH_TO_BACKUP=$1
PREFIX=${2} # should like cron_USERNAME, or bashrc_USERNAME etc.
BACKUP_FOLDER=${3-"/home/$(logname)/bashrc/maintenance/backup/"}

if [[ -z "$PREFIX" ]]; then
    if [[ $(id -u) -eq 0 ]]; then
        PREFIX="sudo";
    else
        PREFIX="$(logname)"
    fi;
fi;


HOSTNAME=$(hostname)
BACKUP_FOLDER="/home/$(logname)/bashrc/maintenance/backup/"
echo "$BACKUP_FOLDER"
if [ ! -d $BACKUP_FOLDER ]; then mkdir $BACKUP_FOLDER; fi
if [ ! -d $BACKUP_FOLDER/$HOSTNAME ]; then mkdir "$BACKUP_FOLDER/$HOSTNAME"; fi
BACKUP_FOLDER="$BACKUP_FOLDER/$HOSTNAME"

if [[ "${PATH_TO_BACKUP,,}" == "cron" ]]; then
    crontab_file=$($SUDO crontab -l)
    echo "$crontab_file" > "${BACKUP_FOLDER}/${PREFIX}_cron"
else
    name="$(basename $PATH_TO_BACKUP)"
    echo "$1" "$BACKUP_FOLDER/${PREFIX}_$name"
    cp "$1" "$BACKUP_FOLDER/${PREFIX}_$name"
fi;

