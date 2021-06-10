#!/bin/sh
numkeep=48
numexist=`ls /mnt/valheim/bak|wc -l`

cp -r /home/valheim/.config/unity3d/IronGate/Valheim/worlds /mnt/valheim/bak/worlds$(date +%Y_%m_%d__%H_%M)
sleep 1
i=$(ls -1tr /mnt/valheim/bak | head -n 1 )

if [ $numexist -gt $numkeep ]
then
	#do if number of backups exceeds threshold
	rm -rf /mnt/valheim/bak/$i

else
	#do if number of backups that exists is behlow threshold
	sleep 1
fi
