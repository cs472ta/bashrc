# Clear Journal File /var/log/journal
sudo journalctl --vacuum-time=10d


# headers
dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge

# apt cache
sudo apt-get clean

## FIX EVERYTHING
sudo apt-get update && sudo apt-get install ubuntu-desktop

## REMOVE ALL PPA SOURCES
/etc/apt/sources.list.d
