#!/bin/bash

cp ~/.config/gtk-3.0/settings.ini ~/think/.config/gtk-3.0/
cp -r ~/.config/i3 ~/think/.config/
cp -r ~/.config/i3status ~/think/.config/
rsync -aH --delete --itemize-changes ~/.config/nvim/ ~/think/.config/nvim/
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

# rsync -aH --delete --itemize-changes --no-links --exclude 'bib/' ~/notes/ ~/think/backup/notes/
# rsync -aH --delete --itemize-changes --no-links --exclude 'bib/' ~/zettelkasten/ ~/think/backup/zettelkasten/
