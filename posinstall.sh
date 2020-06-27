echo "---------------------Iniciando----------------------"

!/usr/bin/env bash
# ----------------------------- VARIÁVEIS ----------------------------- #

echo "---------------------------Pegando Variáveis----------------------"

PPA_PHP_MY_ADMIN= "ppa:phpmyadmin/ppa"
PPA_LUTRIS="ppa:lutris-team/lutris"
PPA_GRAPHICS_DRIVERS="ppa:graphics-drivers/ppa"
PPA_OBS_STUDIO="ppa:obsproject/obs-studio"

URL_WINE_KEY="https://dl.winehq.org/wine-builds/winehq.key"
URL_PPA_WINE="https://dl.winehq.org/wine-builds/ubuntu/"
URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"

# ---------------------------------------------------------------------- #

echo "---------------------Preparando os requisitos para a Instalaçao----------------------"

# ----------------------------- REQUISITOS ----------------------------- #
## Removendo travas eventuais do apt ##
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock


## Adicionando/Confirmando arquitetura de 32 bits ##
sudo dpkg --add-architecture i386

## GtkMenuShells // GtkMenuItems ##
sudo apt install appmenu-gtk2-module


## Atualizando o repositório ##
sudo apt update -y

## Adicionando repositórios de terceiros e suporte a Snap, Flatpak e extensão gnome##
sudo add-apt-repository "$PPA_LUTRIS" -y
sudo apt-add-repository "$PPA_GRAPHICS_DRIVERS" -y
sudo apt-add-repository "$PPA_OBS_STUDIO" -y
sudo apt-add-repository "$PPA_PHP_MY_ADMIN" -y
wget -nc "$URL_WINE_KEY"
sudo apt-key add winehq.key
sudo apt-add-repository "deb $URL_PPA_WINE bionic main"
sudo apt install snapd
sudo apt install flatpak
sudo apt install chrome-gnome-shell
# ---------------------------------------------------------------------- #

echo "---------------------Iniciando Instalaçao----------------------"

# ----------------------------- EXECUÇÃO ----------------------------- #
## Atualizando o repositório depois da adição de novos repositórios ##
sudo apt update -y

## Criação do diretório de downloads ##

mkdir "$DIRETORIO_DOWNLOADS"

## Download e instalaçao de programas externos ##

wget -c "$URL_GOOGLE_CHROME"       -P "$DIRETORIO_DOWNLOADS

## ------------------- Instalando pacotes .deb baixados na sessão anterior ----------------- ##
sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb

sudo apt install --install-recommends winehq-stable wine-stable wine-stable-i386 wine-stable-amd64 -y

## ----------------------------- Instalando pacotes Snap ------------------------------------##
sudo snap install spotify
sudo snap install code --classic
sudo snap install sublime-text --classic
sudo snap install kdenlive 
sudo snap install mailspring
sudo snap install gimp
sudo snap install inkscape
sudo snap install telegram-desktop
sudo snap install insomnia
sudo snap install wps-2019-snap
sudo snap install gnome-calendar

## ------------------------- Instalando programas do repositorio ----------------------------##
sudo apt-get install gnome-sushi -y
sudo apt-get install gnome-tweak-tool -y
sudo apt-get install git -y 
sudo apt-get install gparted -y 
sudo apt-get install obs-studio -y 
sudo apt-get install lutris -y
sudo apt-get install flameshot -y 
sudo apt-get install filezilla -y 
sudo apt-get install zsh -y
sudo apt-get install transmission -y 
# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #

## Finalização, atualização e limpeza##

sudo apt update && sudo apt dist-upgrade -y
flatpak update -y
sudo apt autoclean -y
sudo apt autoremove -y
sudo reboot

echo "---------------------FINALIZADO----------------------"

# ---------------------------------------------------------------------- #
