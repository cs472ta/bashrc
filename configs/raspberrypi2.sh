#export SYNCHRONIZED_LIGHTS_HOME=/home/pi/lightshowpi
#export BROADLINK=/home/pi/broadlink
export QBITTORRENT=/home/pi/Projects/vpn/qbittorrent/

alias off="/home/pi/lightshowpi/bin/stop_music_and_lights"
alias on="/home/pi/lightshowpi/bin/start_music_and_lights"
alias tst="on && sleep 4 && off"
alias web="stop_microweb && sleep 2 && $SYNCHRONIZED_LIGHTS_HOME/bin/start_microweb >> $SYNCHRONIZED_LIGHTS_HOME/logs/microweb.log 2>&1 &"
alias w="watch tail ~/lightshowpi/web/microweb/logs/relay_01-05-2020.log"
alias ww="watch tail ~/lightshowpi/logs/microweb.log"

alias torrents="cd /home/pi/Downloads/external/Downloads/"
alias mam="cd ~/Projects/stack_exchange/mam/ && python3 mam_login.py"
alias qbit="cd ~/Projects/vpn/qbittorrent"
alias qlog="cat /home/pi/.local/share/data/qBittorrent/logs/qbittorrent.log"
alias pi3d="cd /home/pi/pi3/Flash128/Downloads"
