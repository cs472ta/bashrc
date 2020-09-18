alias py37="source ~/Projects/py37/bin/activate"
alias pip3='/usr/local/bin/pip'

#alias python="python3 "
#alias pip="pip3 "
# systemctl disable apache2
# sudo service apache2 stop

# Paths
alias ksl="cd ~/Projects/AmazonPriceCheck/generic/KSL"
alias check="ps -ef | grep 'python.* controller.py'"
alias broadlink="cd /home/pi/Projects/broadlink && (python3 -u server.py &) ; sleep 12 && python3 -u scheduler.py"

alias update_wwwfife_ip='curl -k -X PUT -d "" https://entrydns.net/records/modify/wNXDiys4U9AfdaVCbV3U'
alias update_vpn_ip='curl -k -X PUT -d "" https://entrydns.net/records/modify/1KKVH6w46vimddRBrhtp'
alias update_fife_ip='curl -k -X PUT -d "" https://entrydns.net/records/modify/8VoEgzpvEoQuWndnOFGU'
alias update_home_ip='update_fife_ip && update_wwwfife_ip'
alias random_country='echo ${vpn_country[$[ $RANDOM % $arr_length ]]}'
alias w="watch tail ./Projects/broadlink/logs/server_12-27-2019.log"

w_path="/home/pi/Projects/AmazonPriceCheck/wachete"

PATH=$PATH
alias pi3d="cd /home/pi/Flash128/Downloads"
