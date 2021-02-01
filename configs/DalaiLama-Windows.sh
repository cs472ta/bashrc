if [ $OSTYPE == 'msys' ]; then
    ONEDRIVE="D:/OneDrive"
    GITHUB="D:/Pycharm Projects"
    echo "SET WINDOWS PATHS SUCCESSFULLY"
else
    ONEDRIVE="/media/taylor/Data/OneDrive"
    GITHUB="/media/taylor/Data/Linux/Github"
    HWR_ENV="hwr"
    BASHRC="/home/taylor/bashrc"
    echo "SET LINUX PATHS SUCCESSFULLY"
fi;

alias boot_windows="sudo grub-reboot 2 && sudo reboot"
