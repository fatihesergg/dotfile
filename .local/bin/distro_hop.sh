#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 {backup|hop}"
    exit 1
fi

if [ "$1" == "backup" ];then
    backup
elif [ "$1" == "hop" ];then
    hop
else
    echo "Usage: $0 {backup|hop}"
fi

backup() {

# chromuim
echo "Backing up chromuim profile to /mnt/yedek/Linux/chromuim-backup\n"
rm -rf  /mnt/yedek/Linux/chromium-backup
mkdir -p /mnt/yedek/Linux/chromium-backup
cp -r ~/.config/chromium /mnt/yedek/Linux/chromium-backup
echo "chromuim:Done\n"

# wallpaper
echo "Backing up wallpaper to /mnt/yedek/Linux/wallpaper-backup\n"
rm -rf  /mnt/yedek/Linux/wallpaper-backup
mkdir -p /mnt/yedek/Linux/wallpaper-backup
cp ~/Pictures/wallpaper.{png,jpg} /mnt/yedek/Linux/wallpaper-backup
echo "wallpaper:Done\n"

# ssh
echo "Backing up ssh keys to /mnt/yedek/Linux/ssh-keys-backup\n"
cp -r ~/.ssh /mnt/yedek/Linux/ssh-keys-backup
echo "ssh:Done\n"

}

hop() {

# chromuim
echo "Hopping chromuim profile from /mnt/yedek/Linux/chromium-backup\n"
cp -r /mnt/yedek/Linux/chromium-backup ~/.config
echo "chromuim:Done\n"

# wallpaper
echo "Hopping wallpaper from /mnt/yedek/Linux/wallpaper-backup\n"
cp -r /mnt/yedek/Linux/wallpaper-backup ~/Pictures
echo "wallpaper:Done\n"

# ssh
echo "Hopping ssh keys from /mnt/yedek/Linux/ssh-keys-backup\n"
cp -r /mnt/yedek/Linux/ssh-keys-backup ~/.ssh
chmod 600 ~/.ssh/*
echo "ssh:Done\n"
}
