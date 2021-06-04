#!/bin/sh
#Install valehim dedicated server
#Tyler Wight

sudo adduser valheim
sudo usermod -aG sudo valheim
sudo apt-get update -y && sudo apt-get upgrade -y

#adding multiverse required to install cmd on 64 bit machines

sudo add-apt-repository multiverse
sudo dpkg --add-architecture i386
sudo apt-get update -y
sudo apt install lib32gcc1 steamcmd -y
sudo ln -s /usr/games/steamcmd steamcmd
sudo mkdir /mnt/valheim
sudo chown -R valheim:valheim /mnt/valheim
sudo su -c "steamcmd +login anonymous +force_install_dir /mnt/valheim +app_update 896660 validate +exit" -s /bin/sh valheim


