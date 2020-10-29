!bash

HOME = /home/ihsan/
HUGO_VERSION = 0.53

apt-get update -y
apt install software-properties-common apt-transport-https wget git curl -y

## install chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb

## install vscode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

## install zsh
apt install zsh
apt install

## https://www.codepolitan.com/memasang-zsh-dan-oh-my-zsh-di-linux-ubuntu-5a8eb22e1ae13
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
source ~/.zshrc

## https://github.com/moovweb/gvm
sudo apt-get install binutils bison gcc make -y
zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source $HOME.gvm/scripts/gvm

## set golang version
gvm install go1.4 -B # https://github.com/moovweb/gvm/issues/286
gvm use go1.4 [--default]

## install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker ${USER}
su -s ${USER}


## install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo wget --output-document=/usr/local/bin/docker-compose "https://github.com/docker/compose/releases/download/$(wget --quiet --output-document=- https://api.github.com/repos/docker/compose/releases/latest | grep --perl-regexp --only-matching '"tag_name": "\K.*?(?=")')/run.sh"
sudo chmod +x /usr/local/bin/docker-compose
sudo wget --output-document=/etc/bash_completion.d/docker-compose "https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose"
printf '\nDocker Compose installed successfully\n\n'

## install hugo
wget -O /tmp/hugo.deb https://github.com/gohugoio/hugo/releases/download/v$HUGO_VERSION/hugo_$HUGO_VERSION_Linux-64bit.deb
sudo dpkg -i /tmp/hugo.deb
