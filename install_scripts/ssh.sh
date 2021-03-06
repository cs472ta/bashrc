#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# SSH
ssh-keygen -t rsa -N '' -b 4096 -C "tahlor@gmail.com" -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -sel clip
cat ~/.ssh/id_rsa.pub

# COPY IT TO CLIPBOARD
chmod 600 ~/.ssh/id_rsa
sudo -u ssh-add

read -p "Paste to: https://github.com/settings/keys"

## CONNECT TO OTHER COMPUTERS
echo "Logging into FSL"
ssh-copy-id tarch@ssh.fsl.byu.edu

echo "Logging into Schizo"
ssh-copy-id tarch@schizo.cs.byu.edu

## For SSHFS stuff
dest="/etc/fuse.confg"
if [ -f ~/.bashrc ]; then
    search_string="user_allow_other"
    grep -q "^$search_string" "$dest" 
    if [ $? -ne 0 ]; then
        echo $search_string >> $dest
    fi
fi

if [ $(route -n | grep 'UG[ \t]' | awk '{print $2}') == '192.168.187.1' ];
then
    ssh-copy-id taylor@192.168.187.2
    ssh-copy-id taylor@192.168.187.100
    ssh-copy-id pi@192.168.187.103  # Pi3 Hardline
    ssh-copy-id pi@192.168.187.102  # Pi2 Hardline
    ssh-copy-id pi@192.168.187.98   # Pi2 Wifi

    # These are already on schizo
    #    ssh -t tarch@schizo.cs.byu.edu 'ssh-copy-id taylor@192.168.29.8'
    #    ssh -t tarch@schizo.cs.byu.edu 'ssh-copy-id mason@alexthelion-g10ac'
    #    ssh -t tarch@schizo.cs.byu.edu 'ssh-copy-id taylor@galois'
else
  ssh-copy-id taylor@fife.entrydns.org -p 57320
  ssh-copy-id pi@fife.entrydns.org -p 57321
  ssh-copy-id pi@fife.entrydns.org -p 57322
  ssh-copy-id pi@fife.entrydns.org -p 57323
  ssh-copy-id taylor@192.168.29.8
  ssh-copy-id mason@alexthelion-g10ac
  ssh-copy-id taylor@galois
fi


## INSTALL SSH CONFIG
grep -f $SCRIPT_DIR/ssh.config ~/.ssh/config
if [ $? -ne 0 ]; then
	cat $SCRIPT_DIR/ssh.config >> ~/.ssh/config
fi

# Output multiple lines
#cat <<EOT >> greetings.txt
#line 1
#line 2
#EOT



# Ports
# 57320 - TheServe SSH
# 57321 - Pi3 SSH
# 57322 - Pi2 Hard SSH
# 57323 - Pi2 WiFi SSH
# 57324 - Pi2 Website (Lights, Broadlink)
# 57325 - Pi3-Broadlink (Broadlink Server)

