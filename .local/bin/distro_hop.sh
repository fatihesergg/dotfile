#!/usr/bin/env bash

backup_files() {

# chromuim
echo "Backing up chromuim profile to /mnt/yedek/Linux/chromuim-backup\n"
rm -rf  /mnt/yedek/Linux/chromium-backup
mkdir -p /mnt/yedek/Linux/chromium-backup
cp -r ~/.config/chromium /mnt/yedek/Linux/chromium-backup
echo "chromuim:Done\n"

# zen
echo "Backing up zen profile to /mnt/yedek/Linux/zen-backup\n"
rm -rf  /mnt/yedek/Linux/zen-backup
mkdir -p /mnt/yedek/Linux/zen-backup
cp -r /home/fatih/.var/app/io.github.zen_browser.zen/cache/zen /mnt/yedek/Linux/zen-backup
echo "zen:Done\n"

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

# Programming
echo "Backing up programming to /mnt/yedek/Linux/programming-backup\n"
rm -rf  /mnt/yedek/Linux/programming-backup
mkdir -p /mnt/yedek/Linux/programming-backup
cp -r ~/Programming /mnt/yedek/Linux/programming-backup
echo "programming:Done\n"
}

hop() {

# chromuim
echo "Hopping chromuim profile from /mnt/yedek/Linux/chromium-backup\n"
cp -r /mnt/yedek/Linux/chromium-backup ~/.config
echo "chromuim:Done\n"

# zen 
echo "Hopping zen profile from /mnt/yedek/Linux/zen-backup\n"
cp -r /mnt/yedek/Linux/zen-backup /home/fatih/.var/app/io.github.zen_browser.zen/cache
echo "zen:Done\n"

# wallpaper
echo "Hopping wallpaper from /mnt/yedek/Linux/wallpaper-backup\n"
cp -r /mnt/yedek/Linux/wallpaper-backup ~/Pictures
echo "wallpaper:Done\n"

# ssh
echo "Hopping ssh keys from /mnt/yedek/Linux/ssh-keys-backup\n"
cp -r /mnt/yedek/Linux/ssh-keys-backup ~/.ssh
chmod 600 ~/.ssh/*
echo "ssh:Done\n"


# Programming
echo "Hopping programming from /mnt/yedek/Linux/programming-backup\n"
cp -r /mnt/yedek/Linux/programming-backup ~/Programming/
echo "programming:Done\n"

echo "Settings flatpak themes"
mkdir ~/.themes 2>/dev/null
mkdir ~/.icons 2>/dev/null
mkdir ~/.fonts 2>/dev/null


sudo flatpak override --filesystem=~/.themes
sudo flatpak override --filesystem=~/.icons
sudo flatpak override --filesystem=~/.fonts
sudo flatpak override --env=XCURSOR_SIZE=24


gsettings set org.gnome.desktop.default-applications.terminal exec alacritty

}
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 {backup|hop}"
    exit 1
fi

if [ "$1" == "backup" ];then
    backup_files
elif [ "$1" == "hop" ];then
    hop
else
    echo "Usage: $0 {backup|hop}"
fi

