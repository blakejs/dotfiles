# WELCOME TO MY:
#
#███████╗███████╗██╗  ██╗██████╗  ██████╗
#╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
  #███╔╝ ███████╗███████║██████╔╝██║     
 #███╔╝  ╚════██║██╔══██║██╔══██╗██║     
#███████╗███████║██║  ██║██║  ██║╚██████╗
#╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝

# <======================= OHMYZSH ============================>

# Path.
export ZSH=/home/blake/.oh-my-zsh
# Theme.
ZSH_THEME="spaceship"
# Plugin.
plugins=( git npm zsh-completions )
# Enable.
source $ZSH/oh-my-zsh.sh

# <========================== GENERAL ==========================>

setopt AUTO_CD
setopt EXTENDED_GLOB
export NNN_SCRIPT=/home/blake/.config/fzy.sh
export EDITOR=code
export PAGER=less
export PATH=~/.npm/bin:$PATH
stty -ixon

# <============================= HISTORY =========================>

HISTFILE=~/.history
SAVEHIST=10000
HISTSIZE=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_VERIFY
setopt EXTENDED_HISTORY
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# <====================== FUNCTIONS ============================>

# Extract.
x() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1    ;;
      *.tar.gz)    tar xvzf $1    ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       rar x $1       ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xvf $1     ;;
      *.tbz2)      tar xvjf $1    ;;
      *.tgz)       tar xvzf $1    ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "don't know how to extract '$1'..." ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}
# Uptime.
upinfo () {
  echo -ne "\t ";uptime | awk /'up/ {print $3,$4,$5,$6,$7,$8,$9,$10}'
}
# Cd then ls.
cdls() { builtin cd $@; ls }
# Makes dir then cd into it.
mkcd() { mkdir -p -v $1; cd $1 }
# Creates an archive from given directory.
mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }
# List files only.
lf () { ls -1p $@ | grep -v '\/$' }

# <============================= ALIAS =============================>

# Common.
alias l='ls -a'
alias ls='ls --color=auto' 
alias la='ls -lAFh'
alias lr='ls -tRFh'
alias lt='ls -ltFh'
alias cp='cp -i'
alias mv='mv -i'
alias df='df -h'
alias du='du -h -c'
alias mkdir='mkdir -p -v'
alias remdir='"rm" -rf'
alias biggest='BLOCKSIZE=1048576; du -x | sort -nr | head -10'
alias scrott='"scrot" -d 7 -c'
alias blank="sleep 1 && xset dpms force off"
alias lesslast="less !:*"
alias mine="sudo chown ro"
alias reboot='sudo reboot'
alias -g L="| less"
alias -g G="| grep"
alias reload='source ~/.zshrc'
alias zshrc="$EDITOR ~/.zshrc"
alias ports='netstat -nape --inet'
alias ping='ping -c 3'
alias ns='netstat -alnp --protocol=inet'
alias top="sudo htop d 1"
alias ps="ps aux"
alias today='date "+%d %h %y"'
alias now='date "+%A, %d %B, %G%t%H:%M %Z(%z)"'
alias grep="egrep --color=auto" 
alias m=more                   
alias e=$EDITOR               
alias se="sudoedit"
# Previous dir with dots.
alias .='cd ../'
alias ..='cd ../../'
alias ...='cd ../../../'
alias ....='cd ../../../../'
# Common dirs.
alias docs='~/Documents'
alias pics='~/Pictures'
alias vids='~/Videos'
alias books='~/Books'
alias music='~/Music'
alias dls='~/Downloads'
# Taskbook
alias task='tb -t'
alias note='tb -n'
alias done='tb -d'
# Personal
alias hd="hugo server -D"
alias lg="lazygit"
alias n="ranger"
alias nn='nnn -l'
alias mydotfiles='git --git-dir=$HOME/.my-dotfiles/ --work-tree=$HOME'
alias npmupdate='npm update npm -g; npm update -g;'
alias npi='npm install'
alias npr='npm run'
alias vpn='sudo openvpn --config ~/.cert/client.ovpn'

# <========================= PACKAGE MANAGER =========================>

# ArchLinux FTW.
alias update='sudo pacman -Syu'
alias clean='sudo pacman -Rsnc $(pacman -Qdqt)'
alias paur='sudo pacman -U'
alias pinstall='sudo pacman -S'
alias premove='sudo pacman -Rsn'
alias pfind='sudo pacman -Ss'
alias pinfo='sudo pacman -Si'
alias pwhat='sudo pkgfile --list'
alias pshow='sudo pacman -Qdt'
alias pby='sudo pacman -Ql'
alias pfrom='sudo pacman -Qo'

# <======================= COLOR FIX ============================>

# Basic.
black='\e[0;30m'
blue='\e[0;34m'
green='\e[0;32m'
cyan='\e[0;36m'
red='\e[0;31m'
purple='\e[0;35m'
brown='\e[0;33m'
lightgray='\e[0;37m'
darkgray='\e[1;30m'
lightblue='\e[1;34m'
lightgreen='\e[1;32m'
lightcyan='\e[1;36m'
lightred='\e[1;31m'
lightpurple='\e[1;35m'
yellow='\e[1;33m'
white='\e[1;37m'
nc='\e[0m'
# Color Table.
fg_black=%{$'\e[0;30m'%}
fg_red=%{$'\e[0;31m'%}
fg_green=%{$'\e[0;32m'%}
fg_brown=%{$'\e[0;33m'%}
fg_blue=%{$'\e[0;34m'%}
fg_purple=%{$'\e[0;35m'%}
fg_cyan=%{$'\e[0;36m'%}
fg_lgray=%{$'\e[0;37m'%}
fg_dgray=%{$'\e[1;30m'%}
fg_lred=%{$'\e[1;31m'%}
fg_lgreen=%{$'\e[1;32m'%}
fg_yellow=%{$'\e[1;33m'%}
fg_lblue=%{$'\e[1;34m'%}
fg_pink=%{$'\e[1;35m'%}
fg_lcyan=%{$'\e[1;36m'%}
fg_white=%{$'\e[1;37m'%}
# Text Background Colors.
bg_red=%{$'\e[0;41m'%}
bg_green=%{$'\e[0;42m'%}
bg_brown=%{$'\e[0;43m'%}
bg_blue=%{$'\e[0;44m'%}
bg_purple=%{$'\e[0;45m'%}
bg_cyan=%{$'\e[0;46m'%}
bg_gray=%{$'\e[0;47m'%}
# Attributes.
at_normal=%{$'\e[0m'%}
at_bold=%{$'\e[1m'%}
at_italics=%{$'\e[3m'%}
at_underl=%{$'\e[4m'%}
at_blink=%{$'\e[5m'%}
at_outline=%{$'\e[6m'%}
at_reverse=%{$'\e[7m'%}
at_nondisp=%{$'\e[8m'%}
at_strike=%{$'\e[9m'%}
at_boldoff=%{$'\e[22m'%}
at_italicsoff=%{$'\e[23m'%}
at_underloff=%{$'\e[24m'%}
at_blinkoff=%{$'\e[25m'%}
at_reverseoff=%{$'\e[27m'%}
at_strikeoff=%{$'\e[29m'%}

# <========================== KEYBOARD FIX ==========================>

# Basic.
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[2~" quoted-insert
bindkey "\e[3~" delete-char
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[Z" reverse-menu-complete
# Incremental search.
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward
# Search based on what you typed in already.
bindkey -M vicmd "//" history-beginning-search-backward
bindkey -M vicmd "??" history-beginning-search-forward
# oh wow!  This is killer...  try it!
bindkey -M vicmd "q" push-line
bindkey -M vicmd '!' edit-command-output
bindkey -M viins ' ' magic-space

# <======================= SYSTEM INFO =============================>

# Welcome msg with cal.
clear
echo -e "${lightblue}";toilet -f future --rainbow "Welcome, " $USER;
echo -ne "${lightgray}Today is:\t\t${lightgray}" `date`; echo ""
echo -e "${lightgray}Kernel Information: \t${lightgray}" `uname -smr`
echo -e "${nc}"; tb
# Auto create tmux session.
if [[ -z "$TMUX" ]]
then
  ID="`tmux ls | grep -vm1 attached | cut -d: -f1`"
  if [[ -z "$ID" ]]
  then
    tmux new-session
  else
    tmux attach-session -t "$ID"
  fi
fi
