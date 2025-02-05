# install Fedora minimal

# needed on DELL
# use Wired or phone (connected as modem) internet
sudo dnf install iwlwifi-dvm-firmware iwlwifi-mvm-firmware
reboot

#connect to wifi
nmcli device wifi connect {network-name}

#snapper
sudo dnf snapper
sudo snapper create

#gnome
sudo dnf install gnome-shell gdm btrfs-assistant firefox gnome-console 
systemctl set-default graphical.target
reboot
#gnome programs
sudo dnf install nautilus flameshot gnome-browser-connector unzip gnome-text-editor
