#!/bin/sh
#Install valehim dedicated server
#Tyler Wight
cronjob="*/30 * * * * /mnt/valheim/backup.sh"
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
sudo mkdir /mnt/valheim/bak
sudo cp ./backup.sh /mnt/valheim/backup.sh
sudo chown -R valheim:valheim /mnt/valheim
sudo su -c "steamcmd +login anonymous +force_install_dir /mnt/valheim +app_update 896660 validate +exit" -s /bin/sh valheim

sudo su -c "(crontab -l| grep -v -F '$cronjob'; echo '$cronjob') | crontab -" -s /bin/sh valheim


#to start go to /mnt/valheim and run the start_server.sh script
#backups of the world saved to /mnt/valheim/bak every 30 minutes as long as setup worked.
