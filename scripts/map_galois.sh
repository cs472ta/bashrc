#!/bin/bash

mkdir ~/shares
mkdir ~/shares/galois

# If local
/usr/bin/sshfs -p 22 -o reconnect,umask=0000,allow_other,nonempty,IdentityFile=~/.ssh/id_rsa taylor@galois:/ ~/shares/galois

# else
# ssh -f tarch@schizo.cs.byu.edu -L 2222:galois:22 -N
# /usr/bin/sshfs -p 2222 -o reconnect,umask=0000,allow_other,nonempty,IdentityFile=~/.ssh/id_rsa $USER@localhost:/ ~/shares/galois
