#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
EXT=$SCRIPT_DIR/../ext/

# Install SSHFS
sudo apt install sshfs

# Install PYCHARM
#sudo snap install pycharm-professional --classic

# Install NOTEPADQQ
#https://github.com/notepadqq/notepadqq
cd $EXT
git clone --recursive https://github.com/notepadqq/notepadqq.git
sudo apt-get install qt5-default qttools5-dev-tools qtwebengine5-dev libqt5websockets5-dev libqt5svg5 libqt5svg5-dev libuchardet-dev pkg-config
cd $EXT/notepadqq
./configure --prefix /usr
make
sudo make install
rm -rf !(out) # delete everything except for OUT compiled folder

#echo 'alias np="."' >> $SCRIPT_DIR/../configs/${HOSTNAME}.sh

# Install ANACONDA


# Install NVIDIA Driver


# Install Windscribe



# Install BFG for cleaning GIT repositories
# https://repo1.maven.org/maven2/com/madgag/bfg/1.13.0/bfg-1.13.0.jar


# dolphin
# sudo apt-get install dolphin
# For FISH to work: sudo apt-get install kio-extras

# LaTex

