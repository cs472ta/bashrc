#!/bin/bash

sudo apt install build-essential
sudo apt install libcurl4-openssl-dev
sudo apt install libsqlite3-dev
sudo apt install pkg-config
sudo apt install git
sudo apt install curl
curl -fsS https://dlang.org/install.sh | bash -s dmd
sudo apt install libnotify-dev

source ~/dlang/dmd-2.*/activate # or wherever DMD is installed above

cd "/home/$USER/bashrc/ext"
git clone https://github.com/abraunegg/onedrive.git
cd onedrive
./configure
make clean; make;
sudo make install

# Setup
onedrive
onedrive --synchronize --syncdir $ONEDRIVE --check-for-nosync --single-directory "Documents/Notes for Tools"

  # /usr/local/bin/onedrive
  # onedrive --synchronize --syncdir $ONEDRIVE --check-for-nosync --single-directory "Documents/Notes for Tools"
  # onedrive --syncdir $ONEDRIVE --check-for-nosync --monitor > /home/$USER/bashrc/ext/onedrive/onedrive_manual.log
