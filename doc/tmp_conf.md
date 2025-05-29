## Change `nautilus` font size

Change `org.gnome.desktop.interface.font-name` with `gsettings` or `dconf-editor`.

## Scale factor for `brave` or `chrome`

```
$HOME/.config/chrome-flags.conf

--force-device-scale-factor=n
```

```
$HOME/.config/brave-flags.conf

--force-device-scale-factor=n
```

## Other tools

```
lxappearance
```

## Add minimize and maximize buttons

```
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

```

## Install `papirus` icon theme

```
pacman -S papirus-icon-theme
paru -S papirus-folders-catppucin-git
papirus-folders -C cat-[FLAVOR]-[ACCENT] -t Papirus
```

Then go to `lxappearance` -> `Icon Theme` -> `Papirus`. Also run `gsettings set org.gnome.desktop.interface icon-theme "Papirus"`

## Set `gtk` theme and font

```
gsettings set org.gnome.desktop.interface gkt-theme "[THEME]"
gsettings set org.gnome.desktop.interface font-name "[FONT] [SIZE]"
```

## Packages

```
less
```
