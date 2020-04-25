#!/bin/bash
LOCAL_USER="$(logname)"
# SETUP SCRIPT
# Choose hostname
# hostnamectl set-hostname 'TheServe'

### SETUP ONEDRIVE SYNC
  # /usr/local/bin/onedrive
  # onedrive --synchronize --syncdir $ONEDRIVE --check-for-nosync --single-directory "Documents/Notes for Tools"
  # onedrive --syncdir $ONEDRIVE --check-for-nosync --monitor > /home/$USER/bashrc/ext/onedrive/onedrive_manual.log

## UPDATE BASH NOTES
  # BASH [ ] - test command
  # Always use spaces between brackets, ==
  # -ne -eq for numeric, == and != for string

### UBUNTU SCREEN PREFERENCES

### SET UBUNTU TO LOCAL TIME (For DUAL BOOTING WITH WINDOWS)
timedatectl set-local-rtc 1

### Fix ALT+TAB ISSUES ###
/usr/bin/gsettings set org.gnome.shell.app-switcher current-workspace-only true

#################
### SET PATHS ###
#################

# If it doesn't exist, create it, ask for paths
hostname_rc="/home/$LOCAL_USER/bashrc/configs/${HOSTNAME}.sh"
#echo `test -f "$hostname_rc"`
#echo `test -f INSTALL.sh`
echo $hostname_rc
if [ ! -f $hostname_rc ]; then
  read -p "Github Path: " github_path
  read -p "HWR env name: " hwr_env
  read -p "OneDrive Path: " onedrive_path

  github_path=${github_path:-"/home/$LOCAL_USER/Github"}
  onedrive_path=${onedrive_path:-"/home/$LOCAL_USER/OneDrive"}
  hwr_env=${hwr_env:-"hwr"}

  echo "GITHUB=${github_path}" > $hostname_rc
  echo "ONEDRIVE=${onedrive_path}" >> $hostname_rc
  echo "HWR_ENV=${hwr_env}" >> $hostname_rc
fi

chmod 755 /home/$LOCAL_USER/bashrc/install_scripts/*
chmod 755 "/home/$LOCAL_USER/bashrc/INSTALL.sh"

##########################
### INSTALL SMALL BINS ###
##########################

sudo apt update
sudo apt install git
sudo apt install openssh-server
sudo apt install xsel
sudo apt install xclip

###########################
### Add BASHRC COMMANDS ###
###########################

# Add bashrc to sources
if [ -f ~/.bashrc ]; then
    KEEP_EN="source /home/$LOCAL_USER/bashrc/master.sh"
    grep -q "$KEEP_EN" /home/$LOCAL_USER/bashrc/master.sh
    if [ $? -ne 0 ]; then
        echo "source /home/$LOCAL_USER/bashrc/master.sh" >> ~/.bashrc
    fi
fi

source "/home/$LOCAL_USER/bashrc/master.sh"
source "/home/$LOCAL_USER/.bashrc"

##########################
###   SSH/SUPER        ###
##########################

# Install onedrive
while true; do
    read -p "Do you wish to install SSH keys? Y/n " yn
    case $yn in
        [Yy]* ) bash "/home/$LOCAL_USER/bashrc/install_scripts/ssh.sh"; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

while true; do
    read -p "Do you wish to install Super Computer keys? Y/n " yn
    case $yn in
        [Yy]* ) bash bash "/home/$LOCAL_USER/bashrc/install_scripts/super.sh"; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done


##########################
### CONFIGURE GIT      ###
##########################

# GIT
git config --global user.email tahlor@gmail.com
git config --global user.name Taylor
git config --global credential.helper 'cache --timeout=3600000'

# Install onedrive
while true; do
    read -p "Do you wish to install ONEDRIVE SYNC? Y/n " yn
    case $yn in
        [Yy]* ) bash "/home/$LOCAL_USER/bashrc/install_scripts/install_onedrive.sh"; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

##########################
### BLOCK WEBSITES     ###
##########################
# Block hosts
mkdir ~/bashrc/ext
while true; do
    read -p "Do you wish to install WEBSITE HOST BLOCKER? Y/n " yn
    case $yn in
        [Yy]* ) cd ~/bashrc/ext;
                git clone git@github.com:tahlor/block_hosts;
                bash ~/bashrc/ext/block_hosts/INSTALL.sh;
                break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done


## MAP / CONNECTIONS - determine if connecting through schizo is required
## BYU VPN
# BFG for GITHUB

# Get onedrive and github locations
# Install other github repos
# Install SHARE/.gitignore

# SUDOERS
#if [ -f /etc/sudoers ]; then
#    KEEP_EN="Defaults             env_keep="SYNCHRONIZED_LIGHTS_HOME""
#    grep -q "$KEEP_EN" /etc/sudoers
#    if [ $? -ne 0 ]; then
#        echo "$KEEP_EN" >> /etc/sudoers
#    fi
#fi

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

## PROMPT Y/N
#while true; do
#    read -p "Do you wish to install this program?" yn
#    case $yn in
#        [Yy]* ) make install; break;;
#        [Nn]* ) break;;
#        * ) echo "Please answer yes or no.";;
#    esac
#done

