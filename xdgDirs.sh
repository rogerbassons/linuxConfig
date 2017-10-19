#!/bin/bash

dataMountPoint='/mnt/dades'
dataDevice='/dev/sdaX'

set=0
sudo mkdir $dataMountPoint && sudo echo "$dataDevice $dataMountPoint ntfs-3g rw,uid=1000,gid=1000,dmask=0002,fmask=0003 0 0" >> /etc/fstab && set=1

if [ "$set" -eq "0" ]; then

	xdg-user-dirs-update
        
        dirs=(Documents Downloads Music Pictures Videos)
	for i in "$dirs[@]}"
	do
		mv ~/$i ~/$ibackup
	        ln -s $dataMountPoint/$i ~/$i
		cp -r ~/$ibackup/* ~/$i/
	done
fi



