# Exports and Themes

export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=/Users/goalves/.oh-my-zsh
export ZSH_CUSTOM=/Users/goalves/.oh-my-zsh/custom
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/Library/Python/3.8/bin:$PATH"
export PATH="$HOME/.asdf/asdf.sh:$PATH"
export PATH="$HOME/.asdf/completions/asdf.bash:$PATH"

plugins=(zsh-syntax-highlighting zsh-autosuggestions git)
source $ZSH/oh-my-zsh.sh

function myip() {
    ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
    ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
    ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
    ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
    ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

function extract() {
  if [ -f "$1" ] ; then
    local filename=$(basename "$1")
    local foldername="${filename%%.*}"
    local fullpath=`perl -e 'use Cwd "abs_path";print abs_path(shift)' "$1"`
    local didfolderexist=false
    if [ -d "$foldername" ]; then
      didfolderexist=true
      read -p "$foldername already exists, do you want to overwrite it? (y/n) " -n 1
      echo
      if [[ $REPLY =~ ^[Nn]$ ]]; then
        return
      fi
    fi
    mkdir -p "$foldername" && cd "$foldername"
    case $1 in
      *.tar.bz2) tar xjf "$fullpath" ;;
      *.tar.gz) tar xzf "$fullpath" ;;
      *.tar.xz) tar Jxvf "$fullpath" ;;
      *.tar.Z) tar xzf "$fullpath" ;;
      *.tar) tar xf "$fullpath" ;;
      *.taz) tar xzf "$fullpath" ;;
      *.tb2) tar xjf "$fullpath" ;;
      *.tbz) tar xjf "$fullpath" ;;
      *.tbz2) tar xjf "$fullpath" ;;
      *.tgz) tar xzf "$fullpath" ;;
      *.txz) tar Jxvf "$fullpath" ;;
      *.zip) unzip "$fullpath" ;;
      *) echo "'$1' cannot be extracted via extract()" && cd .. && ! $didfolderexist && rm -r "$foldername" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

function explain () {
  if [ "$#" -eq 0 ]; then
    while read  -p "Command: " cmd; do
      curl -Gs "https://www.mankier.com/api/explain/?cols="$(tput cols) --data-urlencode "q=$cmd"
    done
    echo "Bye!"
  elif [ "$#" -eq 1 ]; then
    curl -Gs "https://www.mankier.com/api/explain/?cols="$(tput cols) --data-urlencode "q=$1"
  else
    echo "Usage"
    echo "explain                  interactive mode."
    echo "explain 'cmd -o | ...'   one quoted command to explain it."
  fi
}

function pair () {open vnc://$1.local}

function pull_request() {
  branch=$(git rev-parse --abbrev-ref HEAD)
  userRepo=$(git remote -v | grep fetch | awk '{print $2}' | grep "github.com")

  if [ -n "$userRepo" ]
  then
      open "$userRepo/compare/$branch?expand=1"
  fi
}

alias dps='docker ps'
alias dkup='docker compose up -d'
alias dall='docker kill $(docker ps -q)'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dlogs="docker ps | grep backend_staging | awk '{print $1; exit}'"
alias prj="cd ~/Projects"
alias dev="cd ~/Projects"
alias ls='lsd -a'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias reload="source ~/.zshrc"
alias grep='grep --color=auto'
alias weather="curl -4 'http://wttr.in/Porto+Alegre?m'"
alias weatheraus="curl -4 'http://wttr.in/Austin?m'"
alias yapf=" python3.6 /Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages/yapf -i -r ."
alias frasp="sudo nmap -sP 192.168.1.0/24 | awk '/^Nmap/{ip=$NF}/B8:27:EB/{print ip}'"
alias pr=pull_request
alias update="brew update && brew upgrade"
alias map="xargs -n1"
alias iex='iex --erl "-kernel shell_history enabled"'
alias mf='mix format'
alias mtf='mix test --failed'
alias mtw='mix test --only wip'
alias fuck='sudo'
alias fucking='sudo'
alias c='clear'


# autoload -U promptinit; promptinit

if [ -f '/Users/goalves/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/goalves/Downloads/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/goalves/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/goalves/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
source $HOME/.cargo/bin

eval "$(starship init zsh)"
