#!/bin/bash

dataMountPoint='/mnt/dades'
dataDevice='/dev/sdaX'

sudo apt update
sudo apt -y upgrade
sudo apt -y install i3 suckless-tools pasystray redshift firefox vim wget git emacs vim terminator keepass2

sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install spotify-client

echo 'exec i3' >> ~/.xinitrc || (touch ~/.xinitrc && echo 'exec i3' >> ~/.xinitrc)

i3-config-wizard

cat i3config >> .config/i3/config
# cp i3status >> .config/i3status/config

sudo cp synaptics.conf /etc/X11/xorg.conf.d/70-synaptics.conf


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

cat <<EOT >> ~/.bashrc
/usr/games/fortune -s
alias disarmstation='xrandr --output DP1 --off && setxkbmap es'
alias armstation='xrandr --output DP1 --auto --right-of eDP1 && setxkbmap us'
alias terminatorhere='terminator --working-directory=$(pwd)'
EOT


