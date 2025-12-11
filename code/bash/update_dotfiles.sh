#!/bin/bash

# dotfiles

cp ~/.config/gtk-3.0/settings.ini ~/think/.config/gtk-3.0/
cp -r ~/.config/i3 ~/think/.config/
cp -r ~/.config/i3status ~/think/.config/
rsync -aH --delete --itemize-changes --exclude 'lazy-lock.json' ~/.config/nvim/ ~/think/.config/nvim/
rsync -aH --delete --itemize-changes ~/.config/picom/ ~/think/.config/picom/
rsync -aH --delete --itemize-changes ~/.config/rofi/ ~/think/.config/rofi/
cp -r ~/.config/sxhkd ~/think/.config/
cp -r ~/.config/zathura ~/think/.config/
rsync -aH --delete --itemize-changes ~/.local/share/zathura/ ~/think/home/.local/share/zathura/

cp ~/.Xresources ~/think/home
cp ~/.bash_profile ~/think/home
cp ~/.bashrc ~/think/home
cp ~/.tmux.conf ~/think/home
cp ~/.vimrc ~/think/home
cp ~/.xinitrc ~/think/home

# notes and zettelkasten backup

if [ "$1" ]
then
    PASS="$1"

    7z a -t7z -mx=7 -mhe=on -p"$PASS" ~/think/backup/cv.7z ~/notes/complex_variables
    7z a -t7z -mx=7 -mhe=on -p"$PASS" ~/think/backup/cs.7z ~/notes/cybersecurity -xr!bib
    7z a -t7z -mx=7 -mhe=on -p"$PASS" ~/think/backup/dw.7z ~/notes/drawing -xr!bib
    7z a -t7z -mx=7 -mhe=on -p"$PASS" ~/think/backup/fi.7z ~/notes/finance -xr!bib

    7z a -t7z -mx=7 -mhe=on -p"$PASS" ~/think/backup/top.7z ~/zettelkasten/topology
else
    echo "not creating backups, provide a password as first argument"
    echo "it is recommended to run \`set +o history\` to temporary disable"
    echo "bash history and \`set -o history\` to re-enable it afterwards"
fi
