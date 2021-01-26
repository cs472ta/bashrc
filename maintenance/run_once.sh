#!/bin/bash

chmod 755 ~/bashrc/scripts/*.sh
sed -i "s~tahlor@gmail.com~$(logname)@$(hostname) $(~/bashrc/scripts/get_os.sh)~g" ~/.ssh/id_rsa.pub

