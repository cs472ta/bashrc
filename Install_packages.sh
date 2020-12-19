##########################
### INSTALL SMALL BINS ###
##########################

sudo apt update
sudo apt install git
sudo apt install openssh-server
sudo apt install xsel
sudo apt install xclip
sudo apt install sox libsox-fmt-mp3 # for playing alarm

sudo apt install -y dnsutils
sudo apt-get install exfat-fuse exfat-utils
sudo apt install tmux

### NTFS Read/Write
sudo apt-get remove ntfsprogs && sudo apt-get install ntfs-3g
# sudo ntfsfix /dev/sdxX <- for Windows hibernation etc.


# Route etc.
sudo apt install net-tools

# Log boots in  /var/log/
sudo apt-get install bootlogd

