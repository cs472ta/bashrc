#!/bin/bash
hostname=$1
USER=${2-taylor}
ip=${3-$hostname}
port=${4-2222}

MNT_DIR=~/shares/$hostname

if [ ! -d ~/shares ]; then mkdir ~/shares; fi
if [ ! -d $MNT_DIR ]; then mkdir $MNT_DIR; fi

fusermount -uz ~/shares/$hostname
sudo umount -l $MNT_DIR

if [ $(route -n | grep 'UG[ \t]' | awk '{print $2}') == '192.168.187.1' ]; then
    ssh -f tarch@schizo.cs.byu.edu -L $port:$ip:22 -N
    /usr/bin/sshfs -p $port -o reconnect,umask=0000,allow_other,nonempty,IdentityFile=~/.ssh/id_rsa $USER@localhost:/ $MNT_DIR
else
    /usr/bin/sshfs -p 22 -o reconnect,umask=0000,allow_other,nonempty,IdentityFile=~/.ssh/id_rsa $USER@$ip:/ $MNT_DIR
fi
