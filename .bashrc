# Make things look prettier
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\W\[\033[m\]\$ "
# Custom bash prompt via kirsle.net/wizards/ps1.html
# export PS1="\[$(tput setaf 2)\][\u@\h \W]\\$ \[$(tput sgr0)\]"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

# Add rbenv to path
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# export editor 
export EDITOR=vim
