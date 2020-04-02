# SETUP SCRIPT
#sudo apt update
sudo apt install git
sudo apt install openssh-server
sudo apt install xsel
sudo apt install xclip
# https://repo1.maven.org/maven2/com/madgag/bfg/1.13.0/bfg-1.13.0.jar

echo $USER


# Add bashrc to sources
if [ -f ~/.bashrc ]; then
    KEEP_EN="source /home/$USER/bashrc/master.sh"
    grep -q "$KEEP_EN" /home/$USER/bashrc/master.sh
    if [ $? -ne 0 ]; then
        echo "source /home/$USER/bashrc/master.sh" >> ~/.bashrc
    fi
fi

source "/home/$USER/bashrc/master.sh"

bash "/home/$USER/bashrc/install_scripts/ssh.sh"

# GIT
git config --global user.email tahlor@gmail.com
git config --global user.name Taylor
git config --global credential.helper 'cache --timeout=3600000'

# Install onedrive
cd ~/bashrc/ext
git clone git@github.com:abraunegg/onedrive
# Install it

# Block hosts
git clone git@github.com:tahlor/block_hosts
bash ~/bashrc/ext/block_hosts/INSTALL.sh

## MAP / CONNECTIONS - determine if connecting through schizo is required
## BYU VPN
# BFG for GITHUB

# Get onedrive and github locations
# Install other github repos
# Install SHARE/.gitignore

# Optionally add a line to /etc/sudoers
if [ -f /etc/sudoers ]; then
    KEEP_EN="Defaults             env_keep="SYNCHRONIZED_LIGHTS_HOME""
    grep -q "$KEEP_EN" /etc/sudoers
    if [ $? -ne 0 ]; then
        echo "$KEEP_EN" >> /etc/sudoers
    fi
fi

# Copy over .bashrc and taylors_scripts from the internet

# Install PYCHARM
# Install NOTEPADQQ
# Install ANACONDA
# Install NVIDIA Driver

# Test pytorch
python
import torch
torch.cuda.current_device()
torch.cuda.device(0)
torch.cuda.device_count()
torch.cuda.get_device_name(0)
torch.cuda.is_available()
