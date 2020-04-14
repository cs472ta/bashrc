#!/bin/bash

mkdir ~/shares
mkdir ~/shares/galois

/usr/bin/sshfs -p 22 -o reconnect,umask=0000,allow_other,nonempty,IdentityFile=~/.ssh/id_rsa taylor@localhost:/ ~/shares/galois
