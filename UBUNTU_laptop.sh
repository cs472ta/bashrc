## Right click on Ubuntu 18
# Go to Tweaks and set to "area" (mechanical right click)
# Below will enable two finger click

cat << 'EOF' > /usr/share/X11/xorg.conf.d/90-libinput-quirks.conf

Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "Tapping" "True"
EndSection

EOF



### UBUNTU SCREEN PREFERENCES
### Fix ALT+TAB ISSUES ###
/usr/bin/gsettings set org.gnome.shell.app-switcher current-workspace-only true



