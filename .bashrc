# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

alias zsh1='zsh --version'
alias zsh2='chsh -s $(which zsh)'
alias zsh3='sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
alias zsh4='git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"'
alias zsh5='ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"'

PS1='[\u@\h \W]\$ '
# >>> BEGIN ADDED BY CNCHI INSTALLER
BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/nano
# <<< END ADDED BY CNCHI INSTALLER
export PATH="$PATH:$HOME/npm/bin"
export NODE_PATH="$NODE_PATH:$HOME/npm/lib/node_modules"
