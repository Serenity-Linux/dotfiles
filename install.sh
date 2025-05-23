#!/bin/bash
clear

######################################
#####Git Repositories & Paru##########
######################################
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ../

######################################
########Essential packages############
######################################
sudo pacman -Syyu
paru -S --needed nvim zsh aur-check-updates iwd git firefox hyprpaper swww viewnior ninja gcc wayland-protocols libjpeg-turbo libwebp libjxl pango cairo pkgconf cmake libglvnd wayland hyprutils hyprwayland-scanner hyprlang brightnessctl pavucontrol playerctl base-devel wget code waypaper wlogout python-pywal16 python-watchdog python-pywalfox matugen-bin glib2-devel hyprlock waybar sddm bluez bluez-utils nautilus swaync alacritty cava fastfecth rofi

######################################
#######Oh-my-zsh & plugins############
######################################

###Oh-my-zsh###
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

###zsh-autosuggestions###
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

###syntax highligthing###
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

###syntax faster highligthing###
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlightingpqru 

######################################
###iwd backend for network manager####
######################################
sudo cp NetworkManager.conf /etc/NetworkManager

#replace networkManager backend from wpa_supplicant to iwd
#etc/NetworkManager/NetworkManager.conf -> add
#device between square bracket
#wifi.backend=iwd
#wifi.iwd.autoconnect=yes

sudo systemctl start iwd; sudo systemctl enable iwd
sudo systemctl stop wpa_supplicant; sudo systemctl disable wpa_supplicant

######################################
#############Bluetooth################
######################################
systemctl enable bluetooth.service

#for macbook pro 13 2015
#localectl set-x11-keymap fr mac-fr


######################################
##############Fonts###################
######################################
sudo cp -R dm-sans /usr/share/fonts
sudo cp -R radio-canada-big /usr/share/fonts

######################################
#############Pywalfox#################
######################################
sudo pywalfox install

######################################
#############NvChad###################
######################################
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

######################################
#############chadwal##################
######################################
git clone https://github.com/NvChad/pywal ~/.config/nvim

######################################
###############sddm###################
######################################
git clone https://codeberg.org/minMelody/sddm-sequoia.git ~/sequoia && rm -rf ~/sequoia/.git
sudo mv ~/sequoia /usr/share/sddm/themes/
sudo mv sddm.conf /etc/sddm.conf.d/

######################################
###############ROFI###################
######################################
cp -r material-you $HOME/.local/share/rofi/themes

######################################
############dotfiles##################
######################################
cp -r .config $HOME
cp -r Wallpapers $HOME
cp .zshrc $HOME

######################################
############scripts###################
######################################
chmod +x $HOME/.config/hypr/const/terminal.sh
chmod +x $HOME/.config/hypr/const/browser.sh
chmod +x $HOME/.config/hypr/const/menu.sh
chmod +x $HOME/.config/hypr/const/filemanager.sh
chmod +x $HOME/.config/hypr/scripts/switch-keyboard-layout.sh
chmod +x $HOME/.config/hypr/scripts/keyboard-identifier.sh
