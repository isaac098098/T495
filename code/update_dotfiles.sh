#!/bin/bash

cp -r ~/.mpv/config ~/T495/home/.mpv/
cp -r ~/.config/alacritty ~/T495/.config/
cp -r ~/.config/hypr ~/T495/.config/
cp -r ~/.config/dunst ~/T495/.config/
cp -r ~/.config/gtk-3.0/ ~/T495/.config/
cp -r ~/.config/nvim ~/T495/.config/
cp -r ~/.config/rofi/ ~/T495/.config/
cp -r ~/.config/zathura ~/T495/.config/

cp -r ~/.Xresources ~/T495/home
cp -r ~/.bash_profile ~/T495/home
cp -r ~/.bashrc ~/T495/home
cp -r ~/.vimrc ~/T495/home
cp -r ~/.xinitrc ~/T495/home

rsync -a --delete --itemize-changes --no-links ~/zettelkasten/ ~/T495/backup/zettelkasten
rsync -a --delete --itemize-changes --no-links ~/notes/ ~/T495/backup/notes/
