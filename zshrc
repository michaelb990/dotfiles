source ~/dotfiles/antigen/antigen.zsh

# Source config details from all *.zsh files in the config/<topic> directories
for file ($HOME/dotfiles/config/*.zsh) source $file

# Source local details from a .localrc file outside of the dotfiles project
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found
antigen bundle rbenv
antigen bundle bundler
antigen bundle brew
antigen bundle gem

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell antigen that you're done.
antigen apply

