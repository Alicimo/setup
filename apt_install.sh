#!/bin/bash

sudo apt update && sudo apt full-upgrade -y

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

install curl
install exfat-utils
install git
install htop
install vim
install xclip
install ubuntu-restricted-extras

install firefox
install chromium-browser
install gimp
install inkscape
install libreoffice-write
install libreoffice-calc
install okular
install vlc
install gnome-shell-pomodoro

### Gnome tweaks

install gnome-tweaks
install gnome-shell-extensions
install chrome-gnome-shell

git clone https://github.com/home-sweet-gnome/dash-to-panel.git panel
cd panel && make install
cd ..
rm -rf panel
gnome-extension enable dash-to-panel

install gir1.2-gtop-2.0 lm-sensors
git clone https://github.com/corecoding/Vitals ~/.local/share/gnome-shell/extensions/Vitals@CoreCoding.com
gnome-shell-extension-tool -e vitals

### Python

install python3-venv python3-pip
pip3 install scipy numpy matplotlib ipython jupyter pandas

### R

install r-base r-base-core r-recommended 
install r-cran-ggplot2 r-cran-ggthemes r-cran-ggally r-cran-ggrepel r-cran-ggpubr 
install r-cran-data.table
install r-cran-devtools

### Spotify

curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && install spotify-client

### Steam

sudo add-apt-repository multiverse
sudo apt-get update && install steam
