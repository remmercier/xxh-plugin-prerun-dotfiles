[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f ~/.fca.zsh ]] || source ~/.fca.zsh

# -----------------------------------------------------------
# Aliases
# -----------------------------------------------------------
alias ipe='curl ifconfig.me; echo'
alias ipi='ifconfig | sed -En "s/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p"'
alias ps='ps aux'
alias psg='\ps aux | grep -v grep | grep -i -e VSZ -e'
alias wget='wget -c'
alias whe='whereis'
alias hostsfile='cat /etc/hosts'
alias env='env | sort'
alias envg='env | sort | grep'

# Copy a file or a directory and append date and time to his name (as to make a backup)
function backup() {
  if [ -z ${1+x} ]; then
    echo "Usage: backup <file>|<directory>"
  elif ! [ -f $1 ] && ! [ -d $1 ]; then
    echo "File or directory '$1' doesn't exist"
  else
    local now=$(date '+%FT%T' | tr ':' '-')
    cp -R $1 $1.$now
  fi
}
alias bak='backup'

# -----------------------------------------------------------
# Key bindings
# -----------------------------------------------------------

# https://superuser.com/a/583584
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

# zsh-autosuggestions keybindings
bindkey '^f' autosuggest-execute

