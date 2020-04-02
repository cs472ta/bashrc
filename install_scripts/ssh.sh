# SSH
ssh-keygen -t rsa -N '' -b 4096 -C "tahlor@gmail.com" -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub
# COPY IT TO CLIPBOARD
chmod 600 ~/.ssh/id_rsa

echo "Paste this to: " "https://github.com/settings/keys"

## CONNECT TO OTHER COMPUTERS
ssh-copy-id tarch@ssh.fsl.byu.edu
ssh-copy-id tarch@schizo.cs.byu.edu

if [ $(route -n | grep 'UG[ \t]' | awk '{print $2}') == '192.168.187.1' ];
then
    ssh-copy-id taylor@192.168.187.100
    ssh-copy-id pi@192.168.187.103
    ssh-copy-id pi@192.168.187.98
    ssh-copy-id pi@192.168.187.102
    ssh -t tarch@schizo.cs.byu.edu 'ssh-copy-id taylor@192.168.29.8'
    ssh -t tarch@schizo.cs.byu.edu 'ssh-copy-id mason@alexthelion-g10ac'
    ssh -t tarch@schizo.cs.byu.edu 'ssh-copy-id taylor@galois'
else
  ssh-copy-id taylor@fife.entrydns.org -p 57320
  ssh-copy-id pi@fife.entrydns.org -p 57321
  ssh-copy-id pi@fife.entrydns.org -p 57322
  ssh-copy-id pi@fife.entrydns.org -p 57323
  ssh-copy-id tarch@galois # copy local ssh to server
  ssh-copy-id taylor@192.168.29.8
  ssh-copy-id mason@alexthelion-g10ac
  ssh-copy-id taylor@galois
fi

# Ports
# 57320 - TheServe SSH
# 57321 - Pi3 SSH
# 57322 - Pi2 Hard SSH
# 57323 - Pi2 WiFi SSH
# 57324 - Pi2 Website (Lights, Broadlink)
# 57325 - Pi3-Broadlink (Broadlink Server)

