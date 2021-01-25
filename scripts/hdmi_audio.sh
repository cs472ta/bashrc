#!/bin/bash
# Automatically switch to HDMI audio out when TV is connected

# NAME: hotplugtv
# PATH: /home/$USER/bin
# DESC: Update pulseaudio output device when HDMI TV plugged / unplugged
# CALL: called from /etc/udev/rules.d/99-hotplugtv.rules 
#       and /home/$USER/bin/lock-screen-timer
# DATE: Created Nov 26, 2016.
# NOTE: logs output using log-file
# UPDT: Dec 14, 2016 - Sometimes /sys/class/drm/card0 & sometimes /sys/class/drm/card1
#       so use /sys/class/dmcard* instead.
#       Dec 21, 2016 - Relocated to /home/$USER/bin for calling by lock-screen-timer
#       Aug 06, 2017 - Convert from home grown log-file to universal logger command.

if [[ $(cat /sys/class/drm/card*-HDMI-A-1/status | grep -Ec "^connected") -eq 1 ]]; then
        logger -t /home/taylor/bin/log-hotplugtv "HDMI TV connected"
        /bin/sleep 2;
        export PULSE_RUNTIME_PATH="/run/user/1000/pulse/";
        sudo -u taylor -E pacmd set-card-profile 0 output:hdmi-stereo;
else
        logger -t /home/taylor/bin/log-hotplugtv "HDMI TV disconnected"
        export PULSE_RUNTIME_PATH="/run/user/1000/pulse/";
        sudo -u taylor -E pacmd set-card-profile 0 output:analog-stereo;
fi

exit 0


## echo 'ACTION=="change", SUBSYSTEM=="drm", ENV{HOTPLUG}=="1", RUN+="/home/taylor/bashrc/scripts/hdmi_audio.sh"' > /etc/udev/rules.d/99-hotplugtv.rules
