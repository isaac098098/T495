#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\e[38;2;228;176;144m\]\W \[\e[0m\]'

export PATH="$HOME/.local/bin:$PATH"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias nsxiv='nsxiv -a -b -s f'
alias mpv='mpv --loop-file=inf --mute=yes'
alias neofetch="neofetch | sed s/'w\/ Radeon Vega Mobile Gfx '//g | sed s/' \/ Radeon Vega Mobile Series'//g"
alias tty-clock='tty-clock -c -s -C 3 -S -n'
alias pipes.sh='pipes.sh'
