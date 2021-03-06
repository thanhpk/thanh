alias dgit='git --git-dir ~/.dotfiles/.git --work-tree=$HOME'
alias ls='ls --color'
alias grep='grep --color'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias cqlsh='docker run -it --rm mikewright/cqlsh --cqlversion=3.4.4'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
