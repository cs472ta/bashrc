## VERY FIRST TIME -- setup GITHUB ssh keys etc.

sudo apt install openssh-server
sudo apt install git
sudo ufw allow ssh

LOCAL_USER="$(logname)"
LOCAL_HOST="$(hostname)"

sudo apt install xclip
ssh-keygen -t rsa -N '' -b 4096 -C  "${LOCAL_USER}@${LOCAL_HOST}" -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -sel clip

# ADD SSH KEY TO GITHUB 
# https://github.com/settings/keys

git clone git@github.com:tahlor/bashrc
