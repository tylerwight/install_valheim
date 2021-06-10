#!/bin/sh
#Install Valehim dedicated server
#Tyler Wight
#Change these two variables to install any game. The name will be used for the folder structure and the user that is created.
#=====================
gamename=valheim
gamesteamcode=896660
#=====================

cronjob="*/30 * * * * /mnt/${gamename}/backup.sh"
sudo adduser $gamename
sudo usermod -aG sudo $gamename
sudo apt-get update -y && sudo apt-get upgrade -y

#adding multiverse required to install cmd on 64 bit machines

sudo add-apt-repository multiverse
sudo dpkg --add-architecture i386
sudo apt-get update -y
sudo apt install lib32gcc1 steamcmd -y
sudo ln -s /usr/games/steamcmd steamcmd
sudo mkdir /mnt/$gamename
sudo mkdir /mnt/$gamename/bak

sudo cp -n ./backup.sh /mnt/$gamename/backup.sh

sudo chown -R $gamename:$gamename /mnt/$gamename
sudo su -c "steamcmd +login anonymous +force_install_dir /mnt/${gamename} +app_update ${gamesteamcode} validate +exit" -s /bin/sh $gamename

sudo su -c "(crontab -l| grep -v -F '$cronjob'; echo '$cronjob') | crontab -" -s /bin/sh $gamename


#to start go to /mnt/valheim and run the start_server.sh script
#backups of the world saved to /mnt/valheim/bak every 30 minutes as long as setup worked.
