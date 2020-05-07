## Bash history stuff
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups
export HISTIGNORE="ls:ps:history:pullit:push:pull:git pull:git push:refresh:refresh1:bashrc"

PROMPT_COMMAND='history -a'

# Path
export "PATH=$PATH:~/bashrc/bin" # add standard command binaries


## Github
unalias pushit 2>/dev/null
pushit () {
  message=${1:-"update"}
  git add . && git commit -m "$message" && git push
}


# Script to install bashrc to bashrc
# Computer specific paths
host_rc="/home/${USER}/bashrc/configs/${HOSTNAME}.sh"
super_rc="/home/${USER}/bashrc/super/secure.sh"
secure_rc="/home/${USER}/bashrc/secure.sh"


if test -f "$host_rc"; then source "$host_rc"; fi
if test -f "$super_rc"; then source "$super_rc"; fi
if test -f "$secure_rc"; then source "$secure_rc"; fi

vpn_path=/home/${USER}/bashrc/scripts/vpn
if [ -f "$vpn_path" ]; then
    source $vpn_path
fi

if test -f "cat ~/cronenv"; then
  alias cron_env="env - `cat ~/cronenv` /bin/sh"
fi

secure_path="~/super/secure.sh"
if [ -f "$secure_path" ]; then
    source $secure_path
fi


alias py="source ./venv/bin/activate"
alias venv="virtualenv -p python3 venv"
alias munit="cd '/media/${USER}/Data/PyCharm Projects/MUNIT'"
alias github="cd $GITHUB"
alias hibernate="systemctl hibernate -i"
shopt -s dotglob ## Always move hidden files


# Python
unalias py 2>/dev/null
py () {
  path=${1:-.}
  source "$path/venv/bin/activate"
}
alias virt="virtualenv -p python3 venv"
alias virt2="virtualenv -p python3 venv && sleep 5 && py && pip install -r requirements.txt"
alias install_req='pip install -r /media/taylor/eef4fe97-0587-4acb-b65d-f0ad5ed8d623/taylor/requirements.txt'
alias super_jupy='ssh -N -f -L localhost:8888:localhost:8889 tarch@rhel7ssh.fsl.byu.edu'
alias jupy='github && jupyter lab'
alias jupy2='cd "$ONEDRIVE/Documents/Notes for Tools/Python/" && jupyter lab'
alias update_utils='pip install git+https://github.com/Tahlor/utils.git'
alias cars='conda activate cars && github && cd cars'
alias add_kernel='pip install ipykernel && python -m ipykernel install --user --name '
alias add_kernel2='pip2 install ipykernel && python2 -m ipykernel install --user --name '
alias remove_kernel='jupyter kernelspec uninstall '

alias notes='cd "$ONEDRIVE/Documents/Notes for Tools"'
alias update="cd $GITHUB/simple_hwr && push && cd /media/SuperComputerGroups/fslg_hwr/taylor_simple_hwr && pull"
alias update_env="conda env update -f environment.yaml"
alias pydtw="ss && cd loss_module && python taylor_dtw/setup.py install"

# System
alias refresh='source ~/.bashrc'
alias refresh1='cd ~/bashrc && git pull && cd - && refresh'
alias websites='gedit ~/bashrc/ext/block_hosts/websites.txt'
alias saveit='cd ~/bashrc && pushit && cd - '
alias bashrc="nano ~/bashrc/master.sh && refresh"
alias bashrc2='gedit ~/bashrc/master.sh && refresh'
alias sleepy="osync && ~/bashrc/scripts/sleep.sh "
alias shutty="osync && shutdown "
#alias sleepy="~/bashrc/super/sleep.sh "
alias hibernate="systemctl hibernate -i"
alias suspend="sudo pkill -f sshfs && systemctl suspend -i"
alias wanip='dig @resolver1.opendns.com ANY myip.opendns.com +short'
alias sudo='sudo '
alias omon='/usr/local/bin/onedrive --syncdir $ONEDRIVE --monitor  > /home/$USER/bashrc/onedrive/onedrive_manual.log'
alias osync='/usr/local/bin/onedrive --synchronize --syncdir $ONEDRIVE'
alias osync_log='osync > /home/$USER/bashrc/onedrive/onedrive_manual.log'
alias reset_mouse="sudo modprobe -r psmouse && sudo mode probe psmouse"
alias enable_suspend='sudo sh -c "echo XHC > /proc/acpi/wakeup"'
alias pdf_studio='rm -r /home/${USER}/.pdfstudio12' #&& cp -r /home/${USER}/.pdfstudio12_backup/ /home/${USER}/.pdfstudio12/'
alias unlock='$ONEDRIVE/Documents/Notes for Tools/Linux/scripts/pdf/unlock_all_in_folder.sh'fitting
alias trash='cd ~/.local/share/Trash'
alias count="ls -1 | wc -l"
alias cps="xsel -b < " # copy to text
alias onedrivef="onedrive --syncdir $ONEDRIVE --monitor > /home/$USER/bashrc/onedrive/onedrive_manual.log --check-for-nosync"
#find . -type f -name '*.sh' -print0 | xargs -0 sed -i 's|--ntasks=28|--ntasks=8|g'
alias search="find . -type 'f' -name " # Find a file

alias docker="sudo docker "
alias np="notepadqq "
alias res="/media/SuperComputerGroups/fslg_hwr/taylor_simple_hwr/RESULTS"
alias watch="/usr/bin/watch -n .3"

## GPU
alias gpu="watch -n0 nvidia-smi"
alias gpu_reset="kill -9 \$(nvidia-smi | sed -n 's/|\s*[0-9]*\s*\([0-9]*\)\s*.*/\1/p' | sort | uniq | sed '/^\$/d')"
alias gpu_reset="pkill -9 python && visdom"
alias reset_gpu=gpu_reset

# GITHUB FIXING
alias bfg='java -jar /home/${USER}/apps/bfg-1.13.0.jar '

## TMUX
alias attach="tmux attach-session -t "
alias grab='sudo reptyr -T ' # get TMUX sessions

## KVM / Virtual Machine / QEMU
alias kvm='virsh console ubuntu18.04'

## Github
#alias push="git add . && git commit -C HEAD --amend && git push origin master -f"
alias push="git add . && git commit -C HEAD --amend && git push -f"
#alias push="git add . && git commit -m update && git push"
alias pull='git reset --merge ORIG_HEAD && git pull'
alias pullf='git reset --hard HEAD~1 && git pull'
alias recommit='git commit --amend -m '
# git reset HEAD^ # uncommit

git_setup(){
	git init
	cp "$GITHUB/SHARE/.gitignore" .
	git add .
	git commit -m "first commit"
	git remote add origin git@github.com:Tahlor/${1}
	git push -u origin master
}


## VPN Stuff
# Switzerland Switzerland Spain Spain Sweden Sweden Poland Norway Netherlands Latvia Lithuania Hungary Czech Coratia Denmark Finland 
vpn_country=("CH" "CH" "ES" "ES" "SE" "SE" "PL" "NO" "NL" "LV" "LT" "HU" "CZ" "HR" "HR" "FI")
#vpn_country=("CA-W")
arr_length=${#vpn_country[@]}
alias update_home_ip='curl -k -X PUT -d "" https://entrydns.net/records/modify/rPZ8fSfGJ2nFCciqhpc6'
alias update_vpn_ip='curl -k -X PUT -d "" https://entrydns.net/records/modify/1KKVH6w46vimddRBrhtp'

alias vpnus='windscribe connect US'
alias vpn='windscribe connect ${vpn_country[$[ $RANDOM % $arr_length ]]}'
alias unvpn='windscribe disconnect'
alias random_country='echo ${vpn_country[$[ $RANDOM % $arr_length ]]}'
alias vpn2='windscribe connect US'
alias vpn3='windscribe connect US-W'
alias vpn4='windscribe connect IN'
alias restart_vnc='vncserver -kill :1 && vncserver -geometry 1980x1080'
alias vnc='vncserver -geometry 1980x1080'
# DON'T ALIAS TEST

## Distraction free, block hosts
alias block="sudo python3 /home/$USER/bashrc/ext/block_hosts/block.py "

pi3_connect()
{
    # If in a git repo - call git mv. otherwise- call mv
    #if [ $(iwgetid -r) == "FifeNet" ];
    if [[ $(route -n | grep 'UG[ \t]' | awk '{print $2}') =~ 192.168.18[78].1 ]];
    then
        ssh pi@192.168.187.103 
    else 
    	ssh pi@fife.entrydns.org -p 57321
    fi
}

theserve_connect()
{
    message=${1:-"no_vpn"}
    if [ $(route -n | grep 'UG[ \t]' | awk '{print $2}') == '192.168.187.1' ];
    then
        ssh taylor@192.168.187.100
    elif [ "$1" == "vpn" ]; then
      ssh -p 57321 -L 13390:192.168.187.100:3389 pi@fife.entrydns.org
    else
    	ssh pi@fife.entrydns.org -p 57320
    fi
}

alias theserve="theserve_connect "
alias ssh_any="~/bashrc/scripts/ssh_any.sh "
alias pi3="if (iwgetid -r)==(FifeNet) ssh pi@192.168.187.103 || ssh pi@136.36.13.188 -p 57321"
alias pi3="ssh pi@192.168.187.103 || ssh pi@fife.entrydns.org -p 57321"
alias pi3=pi3_connect
# ssh-copy-id tarch@ssh.fsl.byu.edu
alias pi2_hard="ssh pi@192.168.187.99 || ssh pi@fife.entrydns.org -p 57322"
alias pi2_wifi="ssh pi@192.168.187.98 || ssh pi@fife.entrydns.org -p 57323"
alias pi2="pi2_wifi"
alias pi2="ssh_any pi2"
alias pi3="ssh_any pi3"

alias map_pi3="sshfs -o StrictHostKeyChecking=no -o nonempty,allow_other,reconnect pi@192.168.187.103:/home/pi /home/${USER}/shares/pi3"
#alias map_pi2="sudo umount -f /home/${USER}/shares/pi2 || sleep 1 || sshfs -o StrictHostKeyChecking=no,allow_other,reconnect,nonempty pi@192.168.187.98:/home/pi /home/${USER}/shares/pi2"
alias map_pi2="sshfs -o StrictHostKeyChecking=no,allow_other,reconnect,nonempty pi@192.168.187.98:/home/pi /home/${USER}/shares/pi2"
alias map_pi2_root="sudo umount -f /home/${USER}/shares/pi2_root || sleep 1 || sshfs -o StrictHostKeyChecking=no,allow_other,reconnect,nonempty pi@192.168.187.98:/ /home/${USER}/shares/pi2_root"
alias map_schizo="sshfs tarch@schizo.cs.byu.edu:/users/grads/tarch /media/BYUCS/"
alias plex="sudo systemctl start plexmediaserver"
alias server="ping 192.168.187.100"

## SSH
alias schizo="ssh tarch@schizo.cs.byu.edu"
alias brodie='~/bashrc/scripts/ssh_any.sh 192.168.29.8 taylor SCHOOL' #  prestidigitonium.cs.byu.edu
alias galois='~/bashrc/scripts/ssh_any.sh galois taylor SCHOOL'
alias dalai='~/bashrc/scripts/ssh_any.sh 192.168.187.2 taylor HOME'
#alias super="ssh tarch@ssh.fsl.byu.edu"
alias super="~/bashrc/super/super.sh"
alias super2='/home/$USER/bashrc/super/super2.sh'
alias kant="ssh -t tarch@schizo.cs.byu.edu 'ssh taylor@192.168.29.56'"
alias kant_port="ssh -t -L 13389:localhost:3389 tarch@schizo.cs.byu.edu ssh -L 3389:localhost:3389 taylor@192.168.29.56 && sleep 4"
alias galois_port3389="ssh -t -L 13389:localhost:3389 tarch@schizo.cs.byu.edu ssh -L 3389:localhost:3389 taylor@192.168.29.64 && sleep 4"
alias super_mason='~/bashrc/super/super_mason.sh'

## Ports
# Port 22 to 2222 - SSH
alias galoisjupy88="ssh -f tarch@schizo.cs.byu.edu -L 8888:galois:8888 -N"
alias galoisjupy89="ssh -f tarch@schizo.cs.byu.edu -L 8889:galois:8889 -N"
alias galoisjupy90="ssh -f tarch@schizo.cs.byu.edu -L 8890:galois:8890 -N"
alias galoisjupy="galoisjupy88 && galoisjupy90 && galoisjupy89"

alias galois_port22="ssh -f tarch@schizo.cs.byu.edu -L 2222:galois:22 -N"
alias brodie_port22="ssh -f tarch@schizo.cs.byu.edu -L 2223:192.168.29.8:22 -N"
alias galois_port3389="ssh -f tarch@schizo.cs.byu.edu -L 33389:galois:3389 -l tarch -N"

#alias galois_vis='ssh -t -L 13389:localhost:9000 tarch@schizo.cs.byu.edu ssh -L 9000:localhost:8080 taylor@192.168.29.64'
alias galois_vis='ssh -f tarch@schizo.cs.byu.edu -L 9001:galois:9001 -N'
alias galois_vnc='ssh -f tarch@schizo.cs.byu.edu -L 5901:galois:5901 -N && remmina -c /home/${USER}/.local/share/remmina/GaloisVNC.remmina'

alias plex='    ssh -p 57321 -L 32401:192.168.187.100:32400 pi@fife.entrydns.org' # PLEX forward to localhost:32401; 57321 is port to pi3

# fusermount -u ~/shares/galois_data
# fusermount -u ~/shares/galois_home 
alias map_any="~/bashrc/scripts/map_any.sh "
alias map_brodie="~/bashrc/scripts/map_any.sh brodie taylor 192.168.29.8 2223"
alias map_mason="map_any alexthelion-g10ac mason alexthelion-g10ac 2224"
alias map_galois="map_any galois taylor galois 2222"

## Write a script for this
alias map_galois_local="~/bashrc/scripts/map_galois.sh"

alias lab="lab_remote || ssh taylor@192.168.29.56"
alias map_lab='sudo ~/bashrc/super/ConnectLab'
alias map_super='sudo bash ~/bashrc/super/map_super.sh'
alias map_groups='sudo ~/bashrc/super/map_groups.sh'
alias shares='map_lab && map_super'

## 
alias visdom="eval 'conda activate hwr5 && nohup python -m visdom.server -p 9001 &>/dev/null &'"
alias connectit="galois_port22 && brodie_port22 && galois_vis && super"



## WOL
alias wol="wakeonlan 40:8D:5C:0C:3F:CA" # wake the server
alias wol_galois="wakeonlan 70:85:c2:b9:14:6b"
alias wol_kant="wakeonlan 78:24:af:83:2f:c9"

alias byu_vpn="openvpn3 session-start --config /home/${USER}/taylors_scripts/openvpn/client.ovpn"
alias byu_vpn="openvpn3 session-start --config client.ovpn"
alias np=notepadqq
alias java8="/usr/lib/jvm/java-8-openjdk-amd64/bin/java "
alias set_java8='sudo update-java-alternatives --set /usr/lib/jvm/java-1.8.0-openjdk-amd64'
alias set_java11='sudo update-java-alternatives --set /usr/lib/jvm/java-1.11.0-openjdk-amd64'

# YT Downloader
# YT
#alias yt='cd /media/data/YT && youtube-dl -f best -ciw -o "%(title)s.%(ext)s" --auto-number -v https://www.youtube.com/channel/UCYO_jab_esuFRV4b17AJtAw '
#alias yt='cd /media/data/YT && youtube-dl -f best -ciw  -o "%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" -v https://www.youtube.com/channel/UCYO_jab_esuFRV4b17AJtAw'
alias yt='cd /media/data/YT && youtube-dl -f best -ciw  -o "%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" -v '

# PDF Studio
alias pdf_studio="rm -r ~/.pdfstudio12"
alias unlock_pdf='"$ONEDRIVE/Documents/Notes for Tools/Linux/scripts/pdf/unlock_all_in_folder.sh"'

# SBATCH TRICKS
alias sbatch_local="for i in \$(ls *.sh); do sbatch \$i; done;"
alias sbatch_r="for i in \$(find . -name '*.sh'); do sbatch \$i; done;"
alias start_scripts="find . -name '*.sh' -exec {} \;"
alias ntasks="find . -type f -name '*.sh' -print0 | xargs -0 sed -i 's/--ntasks=28/--ntasks=7/g' && find . -type f -name '*.sh' -print0 | xargs -0 sed -i 's/--mem-per-cpu=2666MB/--mem-per-cpu=8000MB/g'"
alias clean_git="java -jar ~/bfg.jar --strip-blobs-bigger-than 50M ."

unalias sbatcher 2>/dev/null
sbatcher() {
    file_name="${1:-*.sh}"
    current_path=$(realpath .)
    echo $file_name
    for i in $(find . -name ${file_name}); do
    #for d in ./*; do
        #base=$(basename $i) # the file name
        #"$(dirname -- "$file")" # the parent name
        # script_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" # the script path name
        # realpath . # the full expanded path
        #[[ $base =~ ^(archive|ARCHIVE)$ ]] && continue
        if ! [[ $i =~ '/archive/' ]]; then
            echo $i
            parent=$(dirname --  $i)
            full_path=$(realpath $i)
            cd $parent
            if [ -x "$(command -v sbatch)" ]; then
                sbatch $full_path
            else
                echo "sbatch not installed"
            fi
            cd $current_path
        fi
    done;
}

# Projects
alias ss="conda activate $HWR_ENV && github && cd simple_hwr"
alias synth="github && cd handwriting-synthesis && conda activate tf16"
alias revisdom="pkill -f visdom && ss && visdom && sleep 5 && python hwr_utils/visualize.py"

unalias replace 2>/dev/null
replace() { # don't use * in specifying extension because it expands too soon
            # need to escape "/" with "\"
            # Normal sed usage: sed -i 's~icdar~ICDAR~g' ./TEST.json

    message="${3:-'.sh'}"
    echo "Find: $1" 
    echo "Replace: $2"
    echo "Extension: ${3}"
    echo "Recursive: True"
    find . -type f -name "*$3" -print0
    echo -e "\n xargs -0 sed -i 's~${1}~${2}~g'"
    read -r -p "Are you sure? [y/N] " response
    case "$response" in
        [yY][eE][sS]|[yY]) 
            #find . -type f -name "*$3" -print0 | xargs -0 sed -i 's@$1@$2@g'
            #find . -type f -name "*$3" -print0 | xargs -0 sed -i 's@$1@$2@g'
            find . -type f -name "*$3" -exec sed -i "s@$1@$2@g" {} \;
            ;;
        *) # anything else
            echo "No replace"
            ;;
    esac
}


### Bash Tips:

# Rename files (find/replace)
# rename 's/find/replace/' *

if [ $(route -n | grep 'UG[ \t]' | awk '{print $2}') == "192.168.188.1" ]; then
	echo "WARNING: Connected to ARCHINET"
fi
